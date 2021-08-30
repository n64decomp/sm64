#include <stdbool.h>
#include <stdint.h>
#include <string.h>
#include <ultra64.h>

#include "mixer.h"

#ifdef __SSE4_1__
#include <immintrin.h>
#define HAS_SSE41 1
#define HAS_NEON 0
#elif __ARM_NEON
#include <arm_neon.h>
#define HAS_SSE41 0
#define HAS_NEON 1
#else
#define HAS_SSE41 0
#define HAS_NEON 0
#endif

#pragma GCC optimize ("unroll-loops")

#if HAS_SSE41
#define LOADLH(l, h) _mm_castpd_si128(_mm_loadh_pd(_mm_load_sd((const double *)(l)), (const double *)(h)))
#endif

#define ROUND_UP_64(v) (((v) + 63) & ~63)
#define ROUND_UP_32(v) (((v) + 31) & ~31)
#define ROUND_UP_16(v) (((v) + 15) & ~15)
#define ROUND_UP_8(v) (((v) + 7) & ~7)
#define ROUND_DOWN_16(v) ((v) & ~0xf)

#ifdef NEW_AUDIO_UCODE
#define BUF_SIZE 2880
#define BUF_U8(a) (rspa.buf.as_u8 + ((a) - 0x450))
#define BUF_S16(a) (rspa.buf.as_s16 + ((a) - 0x450) / sizeof(int16_t))
#else
#define BUF_SIZE 2512
#define BUF_U8(a) (rspa.buf.as_u8 + (a))
#define BUF_S16(a) (rspa.buf.as_s16 + (a) / sizeof(int16_t))
#endif

static struct {
    uint16_t in;
    uint16_t out;
    uint16_t nbytes;

#ifdef NEW_AUDIO_UCODE
    uint16_t vol[2];
    uint16_t rate[2];
    uint16_t vol_wet;
    uint16_t rate_wet;
#else
    int16_t vol[2];

    uint16_t dry_right;
    uint16_t wet_left;
    uint16_t wet_right;

    int16_t target[2];
    int32_t rate[2];

    int16_t vol_dry;
    int16_t vol_wet;
#endif

    ADPCM_STATE *adpcm_loop_state;

    int16_t adpcm_table[8][2][8];

#ifdef NEW_AUDIO_UCODE
    uint16_t filter_count;
    int16_t filter[8];
#endif

    union {
        int16_t as_s16[BUF_SIZE / sizeof(int16_t)];
        uint8_t as_u8[BUF_SIZE];
    } buf;
} rspa;

static int16_t resample_table[64][4] = {
    {0x0c39, 0x66ad, 0x0d46, 0xffdf}, {0x0b39, 0x6696, 0x0e5f, 0xffd8},
    {0x0a44, 0x6669, 0x0f83, 0xffd0}, {0x095a, 0x6626, 0x10b4, 0xffc8},
    {0x087d, 0x65cd, 0x11f0, 0xffbf}, {0x07ab, 0x655e, 0x1338, 0xffb6},
    {0x06e4, 0x64d9, 0x148c, 0xffac}, {0x0628, 0x643f, 0x15eb, 0xffa1},
    {0x0577, 0x638f, 0x1756, 0xff96}, {0x04d1, 0x62cb, 0x18cb, 0xff8a},
    {0x0435, 0x61f3, 0x1a4c, 0xff7e}, {0x03a4, 0x6106, 0x1bd7, 0xff71},
    {0x031c, 0x6007, 0x1d6c, 0xff64}, {0x029f, 0x5ef5, 0x1f0b, 0xff56},
    {0x022a, 0x5dd0, 0x20b3, 0xff48}, {0x01be, 0x5c9a, 0x2264, 0xff3a},
    {0x015b, 0x5b53, 0x241e, 0xff2c}, {0x0101, 0x59fc, 0x25e0, 0xff1e},
    {0x00ae, 0x5896, 0x27a9, 0xff10}, {0x0063, 0x5720, 0x297a, 0xff02},
    {0x001f, 0x559d, 0x2b50, 0xfef4}, {0xffe2, 0x540d, 0x2d2c, 0xfee8},
    {0xffac, 0x5270, 0x2f0d, 0xfedb}, {0xff7c, 0x50c7, 0x30f3, 0xfed0},
    {0xff53, 0x4f14, 0x32dc, 0xfec6}, {0xff2e, 0x4d57, 0x34c8, 0xfebd},
    {0xff0f, 0x4b91, 0x36b6, 0xfeb6}, {0xfef5, 0x49c2, 0x38a5, 0xfeb0},
    {0xfedf, 0x47ed, 0x3a95, 0xfeac}, {0xfece, 0x4611, 0x3c85, 0xfeab},
    {0xfec0, 0x4430, 0x3e74, 0xfeac}, {0xfeb6, 0x424a, 0x4060, 0xfeaf},
    {0xfeaf, 0x4060, 0x424a, 0xfeb6}, {0xfeac, 0x3e74, 0x4430, 0xfec0},
    {0xfeab, 0x3c85, 0x4611, 0xfece}, {0xfeac, 0x3a95, 0x47ed, 0xfedf},
    {0xfeb0, 0x38a5, 0x49c2, 0xfef5}, {0xfeb6, 0x36b6, 0x4b91, 0xff0f},
    {0xfebd, 0x34c8, 0x4d57, 0xff2e}, {0xfec6, 0x32dc, 0x4f14, 0xff53},
    {0xfed0, 0x30f3, 0x50c7, 0xff7c}, {0xfedb, 0x2f0d, 0x5270, 0xffac},
    {0xfee8, 0x2d2c, 0x540d, 0xffe2}, {0xfef4, 0x2b50, 0x559d, 0x001f},
    {0xff02, 0x297a, 0x5720, 0x0063}, {0xff10, 0x27a9, 0x5896, 0x00ae},
    {0xff1e, 0x25e0, 0x59fc, 0x0101}, {0xff2c, 0x241e, 0x5b53, 0x015b},
    {0xff3a, 0x2264, 0x5c9a, 0x01be}, {0xff48, 0x20b3, 0x5dd0, 0x022a},
    {0xff56, 0x1f0b, 0x5ef5, 0x029f}, {0xff64, 0x1d6c, 0x6007, 0x031c},
    {0xff71, 0x1bd7, 0x6106, 0x03a4}, {0xff7e, 0x1a4c, 0x61f3, 0x0435},
    {0xff8a, 0x18cb, 0x62cb, 0x04d1}, {0xff96, 0x1756, 0x638f, 0x0577},
    {0xffa1, 0x15eb, 0x643f, 0x0628}, {0xffac, 0x148c, 0x64d9, 0x06e4},
    {0xffb6, 0x1338, 0x655e, 0x07ab}, {0xffbf, 0x11f0, 0x65cd, 0x087d},
    {0xffc8, 0x10b4, 0x6626, 0x095a}, {0xffd0, 0x0f83, 0x6669, 0x0a44},
    {0xffd8, 0x0e5f, 0x6696, 0x0b39}, {0xffdf, 0x0d46, 0x66ad, 0x0c39}
};

static inline int16_t clamp16(int32_t v) {
    if (v < -0x8000) {
        return -0x8000;
    } else if (v > 0x7fff) {
        return 0x7fff;
    }
    return (int16_t)v;
}

static inline int32_t clamp32(int64_t v) {
    if (v < -0x7fffffff - 1) {
        return -0x7fffffff - 1;
    } else if (v > 0x7fffffff) {
        return 0x7fffffff;
    }
    return (int32_t)v;
}

void aClearBufferImpl(uint16_t addr, int nbytes) {
    nbytes = ROUND_UP_16(nbytes);
    memset(BUF_U8(addr), 0, nbytes);
}

#ifdef NEW_AUDIO_UCODE
void aLoadBufferImpl(const void *source_addr, uint16_t dest_addr, uint16_t nbytes) {
    memcpy(BUF_U8(dest_addr), source_addr, ROUND_DOWN_16(nbytes));
}

void aSaveBufferImpl(uint16_t source_addr, int16_t *dest_addr, uint16_t nbytes) {
    memcpy(dest_addr, BUF_S16(source_addr), ROUND_DOWN_16(nbytes));
}
#else
void aLoadBufferImpl(const void *source_addr) {
    memcpy(BUF_U8(rspa.in), source_addr, ROUND_UP_8(rspa.nbytes));
}

void aSaveBufferImpl(int16_t *dest_addr) {
    memcpy(dest_addr, BUF_S16(rspa.out), ROUND_UP_8(rspa.nbytes));
}
#endif

void aLoadADPCMImpl(int num_entries_times_16, const int16_t *book_source_addr) {
    memcpy(rspa.adpcm_table, book_source_addr, num_entries_times_16);
}

void aSetBufferImpl(uint8_t flags, uint16_t in, uint16_t out, uint16_t nbytes) {
#ifndef NEW_AUDIO_UCODE
    if (flags & A_AUX) {
        rspa.dry_right = in;
        rspa.wet_left = out;
        rspa.wet_right = nbytes;
        return;
    }
#endif
    rspa.in = in;
    rspa.out = out;
    rspa.nbytes = nbytes;
}

#ifndef NEW_AUDIO_UCODE
void aSetVolumeImpl(uint8_t flags, int16_t v, int16_t t, int16_t r) {
    if (flags & A_AUX) {
        rspa.vol_dry = v;
        rspa.vol_wet = r;
    } else if (flags & A_VOL) {
        if (flags & A_LEFT) {
            rspa.vol[0] = v;
        } else {
            rspa.vol[1] = v;
        }
    } else {
        if (flags & A_LEFT) {
            rspa.target[0] = v;
            rspa.rate[0] = (int32_t)((uint16_t)t << 16 | ((uint16_t)r));
        } else {
            rspa.target[1] = v;
            rspa.rate[1] = (int32_t)((uint16_t)t << 16 | ((uint16_t)r));
        }
    }
}
#endif

#ifdef NEW_AUDIO_UCODE
void aInterleaveImpl(uint16_t dest, uint16_t left, uint16_t right, uint16_t c) {
    int count = ROUND_UP_8(c) / sizeof(int16_t) / 4;
    int16_t *l = BUF_S16(left);
    int16_t *r = BUF_S16(right);
    int16_t *d = BUF_S16(dest);
    while (count > 0) {
        int16_t l0 = *l++;
        int16_t l1 = *l++;
        int16_t l2 = *l++;
        int16_t l3 = *l++;
        int16_t r0 = *r++;
        int16_t r1 = *r++;
        int16_t r2 = *r++;
        int16_t r3 = *r++;
        *d++ = l0;
        *d++ = r0;
        *d++ = l1;
        *d++ = r1;
        *d++ = l2;
        *d++ = r2;
        *d++ = l3;
        *d++ = r3;
        --count;
    }
}
#else
void aInterleaveImpl(uint16_t left, uint16_t right) {
    int count = ROUND_UP_16(rspa.nbytes) / sizeof(int16_t) / 8;
    int16_t *l = BUF_S16(left);
    int16_t *r = BUF_S16(right);
    int16_t *d = BUF_S16(rspa.out);
    while (count > 0) {
        int16_t l0 = *l++;
        int16_t l1 = *l++;
        int16_t l2 = *l++;
        int16_t l3 = *l++;
        int16_t l4 = *l++;
        int16_t l5 = *l++;
        int16_t l6 = *l++;
        int16_t l7 = *l++;
        int16_t r0 = *r++;
        int16_t r1 = *r++;
        int16_t r2 = *r++;
        int16_t r3 = *r++;
        int16_t r4 = *r++;
        int16_t r5 = *r++;
        int16_t r6 = *r++;
        int16_t r7 = *r++;
        *d++ = l0;
        *d++ = r0;
        *d++ = l1;
        *d++ = r1;
        *d++ = l2;
        *d++ = r2;
        *d++ = l3;
        *d++ = r3;
        *d++ = l4;
        *d++ = r4;
        *d++ = l5;
        *d++ = r5;
        *d++ = l6;
        *d++ = r6;
        *d++ = l7;
        *d++ = r7;
        --count;
    }
}
#endif

void aDMEMMoveImpl(uint16_t in_addr, uint16_t out_addr, int nbytes) {
    nbytes = ROUND_UP_16(nbytes);
    memmove(BUF_U8(out_addr), BUF_U8(in_addr), nbytes);
}

void aSetLoopImpl(ADPCM_STATE *adpcm_loop_state) {
    rspa.adpcm_loop_state = adpcm_loop_state;
}

void aADPCMdecImpl(uint8_t flags, ADPCM_STATE state) {
#if HAS_SSE41
    const __m128i tblrev = _mm_setr_epi8(12, 13, 10, 11, 8, 9, 6, 7, 4, 5, 2, 3, 0, 1, -1, -1);
    const __m128i pos0 = _mm_set_epi8(3, -1, 3, -1, 2, -1, 2, -1, 1, -1, 1, -1, 0, -1, 0, -1);
    const __m128i pos1 = _mm_set_epi8(7, -1, 7, -1, 6, -1, 6, -1, 5, -1, 5, -1, 4, -1, 4, -1);
    const __m128i mult = _mm_set_epi16(0x10, 0x01, 0x10, 0x01, 0x10, 0x01, 0x10, 0x01);
    const __m128i mask = _mm_set1_epi16((int16_t)0xf000);
#elif HAS_NEON
    static const int8_t pos0_data[] = {-1, 0, -1, 0, -1, 1, -1, 1, -1, 2, -1, 2, -1, 3, -1, 3};
    static const int8_t pos1_data[] = {-1, 4, -1, 4, -1, 5, -1, 5, -1, 6, -1, 6, -1, 7, -1, 7};
    static const int16_t mult_data[] = {0x01, 0x10, 0x01, 0x10, 0x01, 0x10, 0x01, 0x10};
    static const int16_t table_prefix_data[] = {0, 0, 0, 0, 0, 0, 0, 1 << 11};
    const int8x16_t pos0 = vld1q_s8(pos0_data);
    const int8x16_t pos1 = vld1q_s8(pos1_data);
    const int16x8_t mult = vld1q_s16(mult_data);
    const int16x8_t mask = vdupq_n_s16((int16_t)0xf000);
    const int16x8_t table_prefix = vld1q_s16(table_prefix_data);
#endif
    uint8_t *in = BUF_U8(rspa.in);
    int16_t *out = BUF_S16(rspa.out);
    int nbytes = ROUND_UP_32(rspa.nbytes);
    if (flags & A_INIT) {
        memset(out, 0, 16 * sizeof(int16_t));
    } else if (flags & A_LOOP) {
        memcpy(out, rspa.adpcm_loop_state, 16 * sizeof(int16_t));
    } else {
        memcpy(out, state, 16 * sizeof(int16_t));
    }
    out += 16;
#if HAS_SSE41
    __m128i prev_interleaved = _mm_set1_epi32((uint16_t)out[-2] | ((uint16_t)out[-1] << 16));
    //__m128i prev_interleaved = _mm_shuffle_epi32(_mm_loadu_si32(out - 2), 0); // GCC misses this?
#elif HAS_NEON
    int16x8_t result = vld1q_s16(out - 8);
#endif
    while (nbytes > 0) {
        int shift = *in >> 4; // should be in 0..12
        int table_index = *in++ & 0xf; // should be in 0..7
        int16_t (*tbl)[8] = rspa.adpcm_table[table_index];
        int i;
#if HAS_SSE41
        // The _mm_loadu_si64 instruction was added in GCC 9, and results in the same
        // asm as the following instructions, so better be compatible with old GCC.
        //__m128i inv = _mm_loadu_si64(in);
        uint64_t v; memcpy(&v, in, 8);
        __m128i inv = _mm_set_epi64x(0, v);
        __m128i invec[2] = {_mm_shuffle_epi8(inv, pos0), _mm_shuffle_epi8(inv, pos1)};
        __m128i tblvec0 = _mm_loadu_si128((const __m128i *)tbl[0]);
        __m128i tblvec1 = _mm_loadu_si128((const __m128i *)(tbl[1]));
        __m128i tbllo = _mm_unpacklo_epi16(tblvec0, tblvec1);
        __m128i tblhi = _mm_unpackhi_epi16(tblvec0, tblvec1);
        __m128i shiftcount = _mm_set_epi64x(0, 12 - shift); // _mm_cvtsi64_si128 does not exist on 32-bit x86
        __m128i tblvec1_rev[8];

        tblvec1_rev[0] = _mm_insert_epi16(_mm_shuffle_epi8(tblvec1, tblrev), 1 << 11, 7);
        tblvec1_rev[1] = _mm_bsrli_si128(tblvec1_rev[0], 2);
        tblvec1_rev[2] = _mm_bsrli_si128(tblvec1_rev[0], 4);
        tblvec1_rev[3] = _mm_bsrli_si128(tblvec1_rev[0], 6);
        tblvec1_rev[4] = _mm_bsrli_si128(tblvec1_rev[0], 8);
        tblvec1_rev[5] = _mm_bsrli_si128(tblvec1_rev[0], 10);
        tblvec1_rev[6] = _mm_bsrli_si128(tblvec1_rev[0], 12);
        tblvec1_rev[7] = _mm_bsrli_si128(tblvec1_rev[0], 14);
        in += 8;
        for (i = 0; i < 2; i++) {
            __m128i acc0 = _mm_madd_epi16(prev_interleaved, tbllo);
            __m128i acc1 = _mm_madd_epi16(prev_interleaved, tblhi);
            __m128i muls[8];
            __m128i result;
            invec[i] = _mm_sra_epi16(_mm_and_si128(_mm_mullo_epi16(invec[i], mult), mask), shiftcount);

            muls[7] = _mm_madd_epi16(tblvec1_rev[0], invec[i]);
            muls[6] = _mm_madd_epi16(tblvec1_rev[1], invec[i]);
            muls[5] = _mm_madd_epi16(tblvec1_rev[2], invec[i]);
            muls[4] = _mm_madd_epi16(tblvec1_rev[3], invec[i]);
            muls[3] = _mm_madd_epi16(tblvec1_rev[4], invec[i]);
            muls[2] = _mm_madd_epi16(tblvec1_rev[5], invec[i]);
            muls[1] = _mm_madd_epi16(tblvec1_rev[6], invec[i]);
            muls[0] = _mm_madd_epi16(tblvec1_rev[7], invec[i]);

            acc0 = _mm_add_epi32(acc0, _mm_hadd_epi32(_mm_hadd_epi32(muls[0], muls[1]), _mm_hadd_epi32(muls[2], muls[3])));
            acc1 = _mm_add_epi32(acc1, _mm_hadd_epi32(_mm_hadd_epi32(muls[4], muls[5]), _mm_hadd_epi32(muls[6], muls[7])));

            acc0 = _mm_srai_epi32(acc0, 11);
            acc1 = _mm_srai_epi32(acc1, 11);

            result = _mm_packs_epi32(acc0, acc1);
            _mm_storeu_si128((__m128i *)out, result);
            out += 8;

            prev_interleaved = _mm_shuffle_epi32(result, _MM_SHUFFLE(3, 3, 3, 3));
        }
#elif HAS_NEON
        int8x8_t inv = vld1_s8((int8_t *)in);
        int16x8_t tblvec[2] = {vld1q_s16(tbl[0]), vld1q_s16(tbl[1])};
        int16x8_t invec[2] = {vreinterpretq_s16_s8(vcombine_s8(vtbl1_s8(inv, vget_low_s8(pos0)),
                                                               vtbl1_s8(inv, vget_high_s8(pos0)))),
                              vreinterpretq_s16_s8(vcombine_s8(vtbl1_s8(inv, vget_low_s8(pos1)),
                                                               vtbl1_s8(inv, vget_high_s8(pos1))))};
        int16x8_t shiftcount = vdupq_n_s16(shift - 12); // negative means right shift
        int16x8_t tblvec1[8];

        in += 8;
        tblvec1[0] = vextq_s16(table_prefix, tblvec[1], 7);
        invec[0] = vmulq_s16(invec[0], mult);
        tblvec1[1] = vextq_s16(table_prefix, tblvec[1], 6);
        invec[1] = vmulq_s16(invec[1], mult);
        tblvec1[2] = vextq_s16(table_prefix, tblvec[1], 5);
        tblvec1[3] = vextq_s16(table_prefix, tblvec[1], 4);
        invec[0] = vandq_s16(invec[0], mask);
        tblvec1[4] = vextq_s16(table_prefix, tblvec[1], 3);
        invec[1] = vandq_s16(invec[1], mask);
        tblvec1[5] = vextq_s16(table_prefix, tblvec[1], 2);
        tblvec1[6] = vextq_s16(table_prefix, tblvec[1], 1);
        invec[0] = vqshlq_s16(invec[0], shiftcount);
        invec[1] = vqshlq_s16(invec[1], shiftcount);
        tblvec1[7] = table_prefix;
        for (i = 0; i < 2; i++) {
            int32x4_t acc0;
            int32x4_t acc1;

            acc1 = vmull_lane_s16(vget_high_s16(tblvec[0]), vget_high_s16(result), 2);
            acc1 = vmlal_lane_s16(acc1, vget_high_s16(tblvec[1]), vget_high_s16(result), 3);
            acc0 = vmull_lane_s16(vget_low_s16(tblvec[0]), vget_high_s16(result), 2);
            acc0 = vmlal_lane_s16(acc0, vget_low_s16(tblvec[1]), vget_high_s16(result), 3);

            acc0 = vmlal_lane_s16(acc0, vget_low_s16(tblvec1[0]), vget_low_s16(invec[i]), 0);
            acc0 = vmlal_lane_s16(acc0, vget_low_s16(tblvec1[1]), vget_low_s16(invec[i]), 1);
            acc0 = vmlal_lane_s16(acc0, vget_low_s16(tblvec1[2]), vget_low_s16(invec[i]), 2);
            acc0 = vmlal_lane_s16(acc0, vget_low_s16(tblvec1[3]), vget_low_s16(invec[i]), 3);

            acc1 = vmlal_lane_s16(acc1, vget_high_s16(tblvec1[0]), vget_low_s16(invec[i]), 0);
            acc1 = vmlal_lane_s16(acc1, vget_high_s16(tblvec1[1]), vget_low_s16(invec[i]), 1);
            acc1 = vmlal_lane_s16(acc1, vget_high_s16(tblvec1[2]), vget_low_s16(invec[i]), 2);
            acc1 = vmlal_lane_s16(acc1, vget_high_s16(tblvec1[3]), vget_low_s16(invec[i]), 3);
            acc1 = vmlal_lane_s16(acc1, vget_high_s16(tblvec1[4]), vget_high_s16(invec[i]), 0);
            acc1 = vmlal_lane_s16(acc1, vget_high_s16(tblvec1[5]), vget_high_s16(invec[i]), 1);
            acc1 = vmlal_lane_s16(acc1, vget_high_s16(tblvec1[6]), vget_high_s16(invec[i]), 2);
            acc1 = vmlal_lane_s16(acc1, vget_high_s16(tblvec1[7]), vget_high_s16(invec[i]), 3);

            result = vcombine_s16(vqshrn_n_s32(acc0, 11), vqshrn_n_s32(acc1, 11));
            vst1q_s16(out, result);
            out += 8;
        }
#else
        for (i = 0; i < 2; i++) {
            int16_t ins[8];
            int16_t prev1 = out[-1];
            int16_t prev2 = out[-2];
            int j, k;
            for (j = 0; j < 4; j++) {
                ins[j * 2] = (((*in >> 4) << 28) >> 28) << shift;
                ins[j * 2 + 1] = (((*in++ & 0xf) << 28) >> 28) << shift;
            }
            for (j = 0; j < 8; j++) {
                int32_t acc = tbl[0][j] * prev2 + tbl[1][j] * prev1 + (ins[j] << 11);
                for (k = 0; k < j; k++) {
                    acc += tbl[1][((j - k) - 1)] * ins[k];
                }
                acc >>= 11;
                *out++ = clamp16(acc);
            }
        }
#endif
        nbytes -= 16 * sizeof(int16_t);
    }
    memcpy(state, out - 16, 16 * sizeof(int16_t));
}

void aResampleImpl(uint8_t flags, uint16_t pitch, RESAMPLE_STATE state) {
    int16_t tmp[16];
    int16_t *in_initial = BUF_S16(rspa.in);
    int16_t *in = in_initial;
    int16_t *out = BUF_S16(rspa.out);
    int nbytes = ROUND_UP_16(rspa.nbytes);
    uint32_t pitch_accumulator;
    int i;
#if !HAS_SSE41 && !HAS_NEON
    int16_t *tbl;
    int32_t sample;
#endif
    if (flags & A_INIT) {
        memset(tmp, 0, 5 * sizeof(int16_t));
    } else {
        memcpy(tmp, state, 16 * sizeof(int16_t));
    }
    if (flags & 2) {
        memcpy(in - 8, tmp + 8, 8 * sizeof(int16_t));
        in -= tmp[5] / sizeof(int16_t);
    }
    in -= 4;
    pitch_accumulator = (uint16_t)tmp[4];
    memcpy(in, tmp, 4 * sizeof(int16_t));

#if HAS_SSE41
    __m128i multiples = _mm_setr_epi16(0, 2, 4, 6, 8, 10, 12, 14);
    __m128i pitchvec = _mm_set1_epi16((int16_t)pitch);
    __m128i pitchvec_8_steps = _mm_set1_epi32((pitch << 1) * 8);
    __m128i pitchacclo_vec = _mm_set1_epi32((uint16_t)pitch_accumulator);
    __m128i pl = _mm_mullo_epi16(multiples, pitchvec);
    __m128i ph = _mm_mulhi_epu16(multiples, pitchvec);
    __m128i acc_a = _mm_add_epi32(_mm_unpacklo_epi16(pl, ph), pitchacclo_vec);
    __m128i acc_b = _mm_add_epi32(_mm_unpackhi_epi16(pl, ph), pitchacclo_vec);

    do {
        __m128i tbl_positions = _mm_srli_epi16(_mm_packus_epi32(
            _mm_and_si128(acc_a, _mm_set1_epi32(0xffff)),
            _mm_and_si128(acc_b, _mm_set1_epi32(0xffff))), 10);

        __m128i in_positions = _mm_packus_epi32(_mm_srli_epi32(acc_a, 16), _mm_srli_epi32(acc_b, 16));
        __m128i tbl_entries[4];
        __m128i samples[4];

        /*for (i = 0; i < 4; i++) {
            tbl_entries[i] = _mm_castpd_si128(_mm_loadh_pd(_mm_load_sd(
                (const double *)resample_table[_mm_extract_epi16(tbl_positions, 2 * i)]),
                (const double *)resample_table[_mm_extract_epi16(tbl_positions, 2 * i + 1)]));
            samples[i] = _mm_castpd_si128(_mm_loadh_pd(_mm_load_sd(
                (const double *)&in[_mm_extract_epi16(in_positions, 2 * i)]),
                (const double *)&in[_mm_extract_epi16(in_positions, 2 * i + 1)]));
            samples[i] = _mm_mulhrs_epi16(samples[i], tbl_entries[i]);
        }*/
        tbl_entries[0] = LOADLH(resample_table[_mm_extract_epi16(tbl_positions, 0)], resample_table[_mm_extract_epi16(tbl_positions, 1)]);
        tbl_entries[1] = LOADLH(resample_table[_mm_extract_epi16(tbl_positions, 2)], resample_table[_mm_extract_epi16(tbl_positions, 3)]);
        tbl_entries[2] = LOADLH(resample_table[_mm_extract_epi16(tbl_positions, 4)], resample_table[_mm_extract_epi16(tbl_positions, 5)]);
        tbl_entries[3] = LOADLH(resample_table[_mm_extract_epi16(tbl_positions, 6)], resample_table[_mm_extract_epi16(tbl_positions, 7)]);
        samples[0] = LOADLH(&in[_mm_extract_epi16(in_positions, 0)], &in[_mm_extract_epi16(in_positions, 1)]);
        samples[1] = LOADLH(&in[_mm_extract_epi16(in_positions, 2)], &in[_mm_extract_epi16(in_positions, 3)]);
        samples[2] = LOADLH(&in[_mm_extract_epi16(in_positions, 4)], &in[_mm_extract_epi16(in_positions, 5)]);
        samples[3] = LOADLH(&in[_mm_extract_epi16(in_positions, 6)], &in[_mm_extract_epi16(in_positions, 7)]);
        samples[0] = _mm_mulhrs_epi16(samples[0], tbl_entries[0]);
        samples[1] = _mm_mulhrs_epi16(samples[1], tbl_entries[1]);
        samples[2] = _mm_mulhrs_epi16(samples[2], tbl_entries[2]);
        samples[3] = _mm_mulhrs_epi16(samples[3], tbl_entries[3]);

        _mm_storeu_si128((__m128i *)out, _mm_hadds_epi16(_mm_hadds_epi16(samples[0], samples[1]), _mm_hadds_epi16(samples[2], samples[3])));

        acc_a = _mm_add_epi32(acc_a, pitchvec_8_steps);
        acc_b = _mm_add_epi32(acc_b, pitchvec_8_steps);
        out += 8;
        nbytes -= 8 * sizeof(int16_t);
    } while (nbytes > 0);
    in += (uint16_t)_mm_extract_epi16(acc_a, 1);
    pitch_accumulator = (uint16_t)_mm_extract_epi16(acc_a, 0);
#elif HAS_NEON
    static const uint16_t multiples_data[8] = {0, 2, 4, 6, 8, 10, 12, 14};
    uint16x8_t multiples = vld1q_u16(multiples_data);
    uint32x4_t pitchvec_8_steps = vdupq_n_u32((pitch << 1) * 8);
    uint32x4_t pitchacclo_vec = vdupq_n_u32((uint16_t)pitch_accumulator);
    uint32x4_t acc_a = vmlal_n_u16(pitchacclo_vec, vget_low_u16(multiples), pitch);
    uint32x4_t acc_b = vmlal_n_u16(pitchacclo_vec, vget_high_u16(multiples), pitch);

    do {
        uint16x8x2_t unzipped = vuzpq_u16(vreinterpretq_u16_u32(acc_a), vreinterpretq_u16_u32(acc_b));
        uint16x8_t tbl_positions = vshrq_n_u16(unzipped.val[0], 10);
        uint16x8_t in_positions = unzipped.val[1];
        int16x8_t tbl_entries[4];
        int16x8_t samples[4];
        int16x8x2_t unzipped1;
        int16x8x2_t unzipped2;

        tbl_entries[0] = vcombine_s16(vld1_s16(resample_table[vgetq_lane_u16(tbl_positions, 0)]), vld1_s16(resample_table[vgetq_lane_u16(tbl_positions, 1)]));
        tbl_entries[1] = vcombine_s16(vld1_s16(resample_table[vgetq_lane_u16(tbl_positions, 2)]), vld1_s16(resample_table[vgetq_lane_u16(tbl_positions, 3)]));
        tbl_entries[2] = vcombine_s16(vld1_s16(resample_table[vgetq_lane_u16(tbl_positions, 4)]), vld1_s16(resample_table[vgetq_lane_u16(tbl_positions, 5)]));
        tbl_entries[3] = vcombine_s16(vld1_s16(resample_table[vgetq_lane_u16(tbl_positions, 6)]), vld1_s16(resample_table[vgetq_lane_u16(tbl_positions, 7)]));
        samples[0] = vcombine_s16(vld1_s16(&in[vgetq_lane_u16(in_positions, 0)]), vld1_s16(&in[vgetq_lane_u16(in_positions, 1)]));
        samples[1] = vcombine_s16(vld1_s16(&in[vgetq_lane_u16(in_positions, 2)]), vld1_s16(&in[vgetq_lane_u16(in_positions, 3)]));
        samples[2] = vcombine_s16(vld1_s16(&in[vgetq_lane_u16(in_positions, 4)]), vld1_s16(&in[vgetq_lane_u16(in_positions, 5)]));
        samples[3] = vcombine_s16(vld1_s16(&in[vgetq_lane_u16(in_positions, 6)]), vld1_s16(&in[vgetq_lane_u16(in_positions, 7)]));
        samples[0] = vqrdmulhq_s16(samples[0], tbl_entries[0]);
        samples[1] = vqrdmulhq_s16(samples[1], tbl_entries[1]);
        samples[2] = vqrdmulhq_s16(samples[2], tbl_entries[2]);
        samples[3] = vqrdmulhq_s16(samples[3], tbl_entries[3]);

        unzipped1 = vuzpq_s16(samples[0], samples[1]);
        unzipped2 = vuzpq_s16(samples[2], samples[3]);
        samples[0] = vqaddq_s16(unzipped1.val[0], unzipped1.val[1]);
        samples[1] = vqaddq_s16(unzipped2.val[0], unzipped2.val[1]);
        unzipped1 = vuzpq_s16(samples[0], samples[1]);
        samples[0] = vqaddq_s16(unzipped1.val[0], unzipped1.val[1]);

        vst1q_s16(out, samples[0]);

        acc_a = vaddq_u32(acc_a, pitchvec_8_steps);
        acc_b = vaddq_u32(acc_b, pitchvec_8_steps);
        out += 8;
        nbytes -= 8 * sizeof(int16_t);
    } while (nbytes > 0);
    in += vgetq_lane_u16(vreinterpretq_u16_u32(acc_a), 1);
    pitch_accumulator = vgetq_lane_u16(vreinterpretq_u16_u32(acc_a), 0);
#else
    do {
        for (i = 0; i < 8; i++) {
            tbl = resample_table[pitch_accumulator * 64 >> 16];
            sample = ((in[0] * tbl[0] + 0x4000) >> 15) +
                     ((in[1] * tbl[1] + 0x4000) >> 15) +
                     ((in[2] * tbl[2] + 0x4000) >> 15) +
                     ((in[3] * tbl[3] + 0x4000) >> 15);
            *out++ = clamp16(sample);

            pitch_accumulator += (pitch << 1);
            in += pitch_accumulator >> 16;
            pitch_accumulator %= 0x10000;
        }
        nbytes -= 8 * sizeof(int16_t);
    } while (nbytes > 0);
#endif

    state[4] = (int16_t)pitch_accumulator;
    memcpy(state, in, 4 * sizeof(int16_t));
    i = (in - in_initial + 4) & 7;
    in -= i;
    if (i != 0) {
        i = -8 - i;
    }
    state[5] = i;
    memcpy(state + 8, in, 8 * sizeof(int16_t));
}

#ifdef NEW_AUDIO_UCODE
void aEnvSetup1Impl(uint8_t initial_vol_wet, uint16_t rate_wet, uint16_t rate_left, uint16_t rate_right) {
    rspa.vol_wet = (uint16_t)(initial_vol_wet << 8);
    rspa.rate_wet = rate_wet;
    rspa.rate[0] = rate_left;
    rspa.rate[1] = rate_right;
}

void aEnvSetup2Impl(uint16_t initial_vol_left, uint16_t initial_vol_right) {
    rspa.vol[0] = initial_vol_left;
    rspa.vol[1] = initial_vol_right;
}

void aEnvMixerImpl(uint16_t in_addr, uint16_t n_samples, bool swap_reverb,
                   bool neg_left, bool neg_right,
                   uint16_t dry_left_addr, uint16_t dry_right_addr,
                   uint16_t wet_left_addr, uint16_t wet_right_addr)
{
    int16_t *in = BUF_S16(in_addr);
    int16_t *dry[2] = {BUF_S16(dry_left_addr), BUF_S16(dry_right_addr)};
    int16_t *wet[2] = {BUF_S16(wet_left_addr), BUF_S16(wet_right_addr)};
    int16_t negs[2] = {neg_left ? -1 : 0, neg_right ? -1 : 0};
    int swapped[2] = {swap_reverb ? 1 : 0, swap_reverb ? 0 : 1};
    int n = ROUND_UP_16(n_samples);

    uint16_t vols[2] = {rspa.vol[0], rspa.vol[1]};
    uint16_t rates[2] = {rspa.rate[0], rspa.rate[1]};
    uint16_t vol_wet = rspa.vol_wet;
    uint16_t rate_wet = rspa.rate_wet;

    do {
        for (int i = 0; i < 8; i++) {
            int16_t samples[2] = {*in, *in}; in++;
            for (int j = 0; j < 2; j++) {
                samples[j] = (samples[j] * vols[j] >> 16) ^ negs[j];
                *dry[j] = clamp16(*dry[j] + samples[j]); dry[j]++;
                *wet[j] = clamp16(*wet[j] + (samples[swapped[j]] * vol_wet >> 16)); wet[j]++;
            }
        }
        vols[0] += rates[0];
        vols[1] += rates[1];
        vol_wet += rate_wet;

        n -= 8;
    } while (n > 0);
}
#else
void aEnvMixerImpl(uint8_t flags, ENVMIX_STATE state) {
    int16_t *in = BUF_S16(rspa.in);
    int16_t *dry[2] = {BUF_S16(rspa.out), BUF_S16(rspa.dry_right)};
    int16_t *wet[2] = {BUF_S16(rspa.wet_left), BUF_S16(rspa.wet_right)};
    int nbytes = ROUND_UP_16(rspa.nbytes);

#if HAS_SSE41
    __m128 vols[2][2];
    __m128i dry_factor;
    __m128i wet_factor;
    __m128 target[2];
    __m128 rate[2];
    __m128i in_loaded;
    __m128i vol_s16;
    bool increasing[2];

    int c;

    if (flags & A_INIT) {
        float vol_init[2] = {rspa.vol[0], rspa.vol[1]};
        float rate_float[2] = {(float)rspa.rate[0] * (1.0f / 65536.0f), (float)rspa.rate[1] * (1.0f / 65536.0f)};
        float step_diff[2] = {vol_init[0] * (rate_float[0] - 1.0f), vol_init[1] * (rate_float[1] - 1.0f)};

        for (c = 0; c < 2; c++) {
            vols[c][0] = _mm_add_ps(
                _mm_set_ps1(vol_init[c]),
                _mm_mul_ps(_mm_set1_ps(step_diff[c]), _mm_setr_ps(1.0f / 8.0f, 2.0f / 8.0f, 3.0f / 8.0f, 4.0f / 8.0f)));
            vols[c][1] = _mm_add_ps(
                _mm_set_ps1(vol_init[c]),
                _mm_mul_ps(_mm_set1_ps(step_diff[c]), _mm_setr_ps(5.0f / 8.0f, 6.0f / 8.0f, 7.0f / 8.0f, 8.0f / 8.0f)));

            increasing[c] = rate_float[c] >= 1.0f;
            target[c] = _mm_set1_ps(rspa.target[c]);
            rate[c] = _mm_set1_ps(rate_float[c]);
        }

        dry_factor = _mm_set1_epi16(rspa.vol_dry);
        wet_factor = _mm_set1_epi16(rspa.vol_wet);

        memcpy(state + 32, &rate_float[0], 4);
        memcpy(state + 34, &rate_float[1], 4);
        state[36] = rspa.target[0];
        state[37] = rspa.target[1];
        state[38] = rspa.vol_dry;
        state[39] = rspa.vol_wet;
    } else {
        float floats[2];
        vols[0][0] = _mm_loadu_ps((const float *)state);
        vols[0][1] = _mm_loadu_ps((const float *)(state + 8));
        vols[1][0] = _mm_loadu_ps((const float *)(state + 16));
        vols[1][1] = _mm_loadu_ps((const float *)(state + 24));
        memcpy(floats, state + 32, 8);
        rate[0] = _mm_set1_ps(floats[0]);
        rate[1] = _mm_set1_ps(floats[1]);
        increasing[0] = floats[0] >= 1.0f;
        increasing[1] = floats[1] >= 1.0f;
        target[0] = _mm_set1_ps(state[36]);
        target[1] = _mm_set1_ps(state[37]);
        dry_factor = _mm_set1_epi16(state[38]);
        wet_factor = _mm_set1_epi16(state[39]);
    }
    do {
        in_loaded = _mm_loadu_si128((const __m128i *)in);
        in += 8;
        for (c = 0; c < 2; c++) {
            if (increasing[c]) {
                vols[c][0] = _mm_min_ps(vols[c][0], target[c]);
                vols[c][1] = _mm_min_ps(vols[c][1], target[c]);
            } else {
                vols[c][0] = _mm_max_ps(vols[c][0], target[c]);
                vols[c][1] = _mm_max_ps(vols[c][1], target[c]);
            }

            vol_s16 = _mm_packs_epi32(_mm_cvtps_epi32(vols[c][0]), _mm_cvtps_epi32(vols[c][1]));
            _mm_storeu_si128((__m128i *)dry[c],
                             _mm_adds_epi16(
                                 _mm_loadu_si128((const __m128i *)dry[c]),
                                 _mm_mulhrs_epi16(in_loaded, _mm_mulhrs_epi16(vol_s16, dry_factor))));
            dry[c] += 8;

            if (flags & A_AUX) {
                _mm_storeu_si128((__m128i *)wet[c],
                                 _mm_adds_epi16(
                                     _mm_loadu_si128((const __m128i *)wet[c]),
                                     _mm_mulhrs_epi16(in_loaded, _mm_mulhrs_epi16(vol_s16, wet_factor))));
                wet[c] += 8;
            }

            vols[c][0] = _mm_mul_ps(vols[c][0], rate[c]);
            vols[c][1] = _mm_mul_ps(vols[c][1], rate[c]);
        }

        nbytes -= 8 * sizeof(int16_t);
    } while (nbytes > 0);

    _mm_storeu_ps((float *)state, vols[0][0]);
    _mm_storeu_ps((float *)(state + 8), vols[0][1]);
    _mm_storeu_ps((float *)(state + 16), vols[1][0]);
    _mm_storeu_ps((float *)(state + 24), vols[1][1]);
#elif HAS_NEON
    float32x4_t vols[2][2];
    int16_t dry_factor;
    int16_t wet_factor;
    float32x4_t target[2];
    float rate[2];
    int16x8_t in_loaded;
    int16x8_t vol_s16;
    bool increasing[2];

    int c;

    if (flags & A_INIT) {
        float vol_init[2] = {rspa.vol[0], rspa.vol[1]};
        float rate_float[2] = {(float)rspa.rate[0] * (1.0f / 65536.0f), (float)rspa.rate[1] * (1.0f / 65536.0f)};
        float step_diff[2] = {vol_init[0] * (rate_float[0] - 1.0f), vol_init[1] * (rate_float[1] - 1.0f)};
        static const float step_dividers_data[2][4] = {{1.0f / 8.0f, 2.0f / 8.0f, 3.0f / 8.0f, 4.0f / 8.0f},
                                                      {5.0f / 8.0f, 6.0f / 8.0f, 7.0f / 8.0f, 8.0f / 8.0f}};
        float32x4_t step_dividers[2] = {vld1q_f32(step_dividers_data[0]), vld1q_f32(step_dividers_data[1])};

        for (c = 0; c < 2; c++) {
            vols[c][0] = vaddq_f32(vdupq_n_f32(vol_init[c]), vmulq_n_f32(step_dividers[0], step_diff[c]));
            vols[c][1] = vaddq_f32(vdupq_n_f32(vol_init[c]), vmulq_n_f32(step_dividers[1], step_diff[c]));
            increasing[c] = rate_float[c] >= 1.0f;
            target[c] = vdupq_n_f32(rspa.target[c]);
            rate[c] = rate_float[c];
        }

        dry_factor = rspa.vol_dry;
        wet_factor = rspa.vol_wet;

        memcpy(state + 32, &rate_float[0], 4);
        memcpy(state + 34, &rate_float[1], 4);
        state[36] = rspa.target[0];
        state[37] = rspa.target[1];
        state[38] = rspa.vol_dry;
        state[39] = rspa.vol_wet;
    } else {
        vols[0][0] = vreinterpretq_f32_s16(vld1q_s16(state));
        vols[0][1] = vreinterpretq_f32_s16(vld1q_s16(state + 8));
        vols[1][0] = vreinterpretq_f32_s16(vld1q_s16(state + 16));
        vols[1][1] = vreinterpretq_f32_s16(vld1q_s16(state + 24));
        memcpy(&rate[0], state + 32, 4);
        memcpy(&rate[1], state + 34, 4);
        increasing[0] = rate[0] >= 1.0f;
        increasing[1] = rate[1] >= 1.0f;
        target[0] = vdupq_n_f32(state[36]);
        target[1] = vdupq_n_f32(state[37]);
        dry_factor = state[38];
        wet_factor = state[39];
    }

    do {
        in_loaded = vld1q_s16(in);
        in += 8;
        for (c = 0; c < 2; c++) {
            if (increasing[c]) {
                vols[c][0] = vminq_f32(vols[c][0], target[c]);
                vols[c][1] = vminq_f32(vols[c][1], target[c]);
            } else {
                vols[c][0] = vmaxq_f32(vols[c][0], target[c]);
                vols[c][1] = vmaxq_f32(vols[c][1], target[c]);
            }

            vol_s16 = vcombine_s16(vqmovn_s32(vcvtq_s32_f32(vols[c][0])), vqmovn_s32(vcvtq_s32_f32(vols[c][1])));
            vst1q_s16(dry[c], vqaddq_s16(vld1q_s16(dry[c]), vqrdmulhq_s16(in_loaded, vqrdmulhq_n_s16(vol_s16, dry_factor))));
            dry[c] += 8;
            if (flags & A_AUX) {
                vst1q_s16(wet[c], vqaddq_s16(vld1q_s16(wet[c]), vqrdmulhq_s16(in_loaded, vqrdmulhq_n_s16(vol_s16, wet_factor))));
                wet[c] += 8;
            }
            vols[c][0] = vmulq_n_f32(vols[c][0], rate[c]);
            vols[c][1] = vmulq_n_f32(vols[c][1], rate[c]);
        }

        nbytes -= 8 * sizeof(int16_t);
    } while (nbytes > 0);

    vst1q_s16(state, vreinterpretq_s16_f32(vols[0][0]));
    vst1q_s16(state + 8, vreinterpretq_s16_f32(vols[0][1]));
    vst1q_s16(state + 16, vreinterpretq_s16_f32(vols[1][0]));
    vst1q_s16(state + 24, vreinterpretq_s16_f32(vols[1][1]));
#else
    int16_t target[2];
    int32_t rate[2];
    int16_t vol_dry, vol_wet;

    int32_t step_diff[2];
    int32_t vols[2][8];

    int c, i;

    if (flags & A_INIT) {
        target[0] = rspa.target[0];
        target[1] = rspa.target[1];
        rate[0] = rspa.rate[0];
        rate[1] = rspa.rate[1];
        vol_dry = rspa.vol_dry;
        vol_wet = rspa.vol_wet;
        step_diff[0] = rspa.vol[0] * (rate[0] - 0x10000) / 8;
        step_diff[1] = rspa.vol[0] * (rate[1] - 0x10000) / 8;

        for (i = 0; i < 8; i++) {
            vols[0][i] = clamp32((int64_t)(rspa.vol[0] << 16) + step_diff[0] * (i + 1));
            vols[1][i] = clamp32((int64_t)(rspa.vol[1] << 16) + step_diff[1] * (i + 1));
        }
    } else {
        memcpy(vols[0], state, 32);
        memcpy(vols[1], state + 16, 32);
        target[0] = state[32];
        target[1] = state[35];
        rate[0] = (state[33] << 16) | (uint16_t)state[34];
        rate[1] = (state[36] << 16) | (uint16_t)state[37];
        vol_dry = state[38];
        vol_wet = state[39];
    }

    do {
        for (c = 0; c < 2; c++) {
            for (i = 0; i < 8; i++) {
                if ((rate[c] >> 16) > 0) {
                    // Increasing volume
                    if ((vols[c][i] >> 16) > target[c]) {
                        vols[c][i] = target[c] << 16;
                    }
                } else {
                    // Decreasing volume
                    if ((vols[c][i] >> 16) < target[c]) {
                        vols[c][i] = target[c] << 16;
                    }
                }
                dry[c][i] = clamp16((dry[c][i] * 0x7fff + in[i] * (((vols[c][i] >> 16) * vol_dry + 0x4000) >> 15) + 0x4000) >> 15);
                if (flags & A_AUX) {
                    wet[c][i] = clamp16((wet[c][i] * 0x7fff + in[i] * (((vols[c][i] >> 16) * vol_wet + 0x4000) >> 15) + 0x4000) >> 15);
                }
                vols[c][i] = clamp32((int64_t)vols[c][i] * rate[c] >> 16);
            }

            dry[c] += 8;
            if (flags & A_AUX) {
                wet[c] += 8;
            }
        }

        nbytes -= 16;
        in += 8;
    } while (nbytes > 0);

    memcpy(state, vols[0], 32);
    memcpy(state + 16, vols[1], 32);
    state[32] = target[0];
    state[35] = target[1];
    state[33] = (int16_t)(rate[0] >> 16);
    state[34] = (int16_t)rate[0];
    state[36] = (int16_t)(rate[1] >> 16);
    state[37] = (int16_t)rate[1];
    state[38] = vol_dry;
    state[39] = vol_wet;
#endif
}
#endif

#ifdef NEW_AUDIO_UCODE
void aMixImpl(int16_t gain, uint16_t in_addr, uint16_t out_addr, uint16_t count) {
    int nbytes = ROUND_UP_32(ROUND_DOWN_16(count));
#else
void aMixImpl(int16_t gain, uint16_t in_addr, uint16_t out_addr) {
    int nbytes = ROUND_UP_32(rspa.nbytes);
#endif
    int16_t *in = BUF_S16(in_addr);
    int16_t *out = BUF_S16(out_addr);
#if HAS_SSE41
    __m128i gain_vec = _mm_set1_epi16(gain);
#elif !HAS_NEON
    int i;
    int32_t sample;
#endif

#if !HAS_NEON
    if (gain == -0x8000) {
        while (nbytes > 0) {
#if HAS_SSE41
            __m128i out1, out2, in1, in2;
            out1 = _mm_loadu_si128((const __m128i *)out);
            out2 = _mm_loadu_si128((const __m128i *)(out + 8));
            in1 = _mm_loadu_si128((const __m128i *)in);
            in2 = _mm_loadu_si128((const __m128i *)(in + 8));

            out1 = _mm_subs_epi16(out1, in1);
            out2 = _mm_subs_epi16(out2, in2);

            _mm_storeu_si128((__m128i *)out, out1);
            _mm_storeu_si128((__m128i *)(out + 8), out2);

            out += 16;
            in += 16;
#else
            for (i = 0; i < 16; i++) {
                sample = *out - *in++;
                *out++ = clamp16(sample);
            }
#endif

            nbytes -= 16 * sizeof(int16_t);
        }
    }
#endif

    while (nbytes > 0) {
#if HAS_SSE41
        __m128i out1, out2, in1, in2;
        out1 = _mm_loadu_si128((const __m128i *)out);
        out2 = _mm_loadu_si128((const __m128i *)(out + 8));
        in1 = _mm_loadu_si128((const __m128i *)in);
        in2 = _mm_loadu_si128((const __m128i *)(in + 8));

        out1 = _mm_adds_epi16(out1, _mm_mulhrs_epi16(in1, gain_vec));
        out2 = _mm_adds_epi16(out2, _mm_mulhrs_epi16(in2, gain_vec));

        _mm_storeu_si128((__m128i *)out, out1);
        _mm_storeu_si128((__m128i *)(out + 8), out2);

        out += 16;
        in += 16;
#elif HAS_NEON
        int16x8_t out1, out2, in1, in2;
        out1 = vld1q_s16(out);
        out2 = vld1q_s16(out + 8);
        in1 = vld1q_s16(in);
        in2 = vld1q_s16(in + 8);

        out1 = vqaddq_s16(out1, vqrdmulhq_n_s16(in1, gain));
        out2 = vqaddq_s16(out2, vqrdmulhq_n_s16(in2, gain));

        vst1q_s16(out, out1);
        vst1q_s16(out + 8, out2);

        out += 16;
        in += 16;
#else
        for (i = 0; i < 16; i++) {
            sample = ((*out * 0x7fff + *in++ * gain) + 0x4000) >> 15;
            *out++ = clamp16(sample);
        }
#endif

        nbytes -= 16 * sizeof(int16_t);
    }
}

#ifdef NEW_AUDIO_UCODE
void aS8DecImpl(uint8_t flags, ADPCM_STATE state) {
    uint8_t *in = BUF_U8(rspa.in);
    int16_t *out = BUF_S16(rspa.out);
    int nbytes = ROUND_UP_32(rspa.nbytes);
    if (flags & A_INIT) {
        memset(out, 0, 16 * sizeof(int16_t));
    } else if (flags & A_LOOP) {
        memcpy(out, rspa.adpcm_loop_state, 16 * sizeof(int16_t));
    } else {
        memcpy(out, state, 16 * sizeof(int16_t));
    }
    out += 16;

    while (nbytes > 0) {
        *out++ = (int16_t)(*in++ << 8);
        *out++ = (int16_t)(*in++ << 8);
        *out++ = (int16_t)(*in++ << 8);
        *out++ = (int16_t)(*in++ << 8);
        *out++ = (int16_t)(*in++ << 8);
        *out++ = (int16_t)(*in++ << 8);
        *out++ = (int16_t)(*in++ << 8);
        *out++ = (int16_t)(*in++ << 8);
        *out++ = (int16_t)(*in++ << 8);
        *out++ = (int16_t)(*in++ << 8);
        *out++ = (int16_t)(*in++ << 8);
        *out++ = (int16_t)(*in++ << 8);
        *out++ = (int16_t)(*in++ << 8);
        *out++ = (int16_t)(*in++ << 8);
        *out++ = (int16_t)(*in++ << 8);
        *out++ = (int16_t)(*in++ << 8);

        nbytes -= 16 * sizeof(int16_t);
    }

    memcpy(state, out - 16, 16 * sizeof(int16_t));
}

void aAddMixerImpl(uint16_t in_addr, uint16_t out_addr, uint16_t count) {
    int16_t *in = BUF_S16(in_addr);
    int16_t *out = BUF_S16(out_addr);
    int nbytes = ROUND_UP_64(ROUND_DOWN_16(count));

    do {
        *out = clamp16(*out + *in++); out++;
        *out = clamp16(*out + *in++); out++;
        *out = clamp16(*out + *in++); out++;
        *out = clamp16(*out + *in++); out++;
        *out = clamp16(*out + *in++); out++;
        *out = clamp16(*out + *in++); out++;
        *out = clamp16(*out + *in++); out++;
        *out = clamp16(*out + *in++); out++;
        *out = clamp16(*out + *in++); out++;
        *out = clamp16(*out + *in++); out++;
        *out = clamp16(*out + *in++); out++;
        *out = clamp16(*out + *in++); out++;
        *out = clamp16(*out + *in++); out++;
        *out = clamp16(*out + *in++); out++;
        *out = clamp16(*out + *in++); out++;
        *out = clamp16(*out + *in++); out++;

        nbytes -= 16 * sizeof(int16_t);
    } while (nbytes > 0);
}

void aDuplicateImpl(uint16_t in_addr, uint16_t out_addr, uint16_t count) {
    uint8_t *in = BUF_U8(in_addr);
    uint8_t *out = BUF_U8(out_addr);

    uint8_t tmp[128];
    memcpy(tmp, in, 128);
    do {
        memcpy(out, tmp, 128);
        out += 128;
    } while (count-- > 0);
}

void aDMEMMove2Impl(uint8_t t, uint16_t in_addr, uint16_t out_addr, uint16_t count) {
    uint8_t *in = BUF_U8(in_addr);
    uint8_t *out = BUF_U8(out_addr);
    int nbytes = ROUND_UP_32(count);

    do {
        memmove(out, in, nbytes);
        in += nbytes;
        out += nbytes;
    } while (t-- > 0);
}

void aResampleZohImpl(uint16_t pitch, uint16_t start_fract) {
    int16_t *in = BUF_S16(rspa.in);
    int16_t *out = BUF_S16(rspa.out);
    int nbytes = ROUND_UP_8(rspa.nbytes);
    uint32_t pos = start_fract;
    uint32_t pitch_add = pitch << 2;

    do {
        *out++ = in[pos >> 17]; pos += pitch_add;
        *out++ = in[pos >> 17]; pos += pitch_add;
        *out++ = in[pos >> 17]; pos += pitch_add;
        *out++ = in[pos >> 17]; pos += pitch_add;

        nbytes -= 4 * sizeof(int16_t);
    } while (nbytes > 0);
}

void aDownsampleHalfImpl(uint16_t n_samples, uint16_t in_addr, uint16_t out_addr) {
    int16_t *in = BUF_S16(in_addr);
    int16_t *out = BUF_S16(out_addr);
    int n = ROUND_UP_8(n_samples);

    do {
        *out++ = *in++; in++;
        *out++ = *in++; in++;
        *out++ = *in++; in++;
        *out++ = *in++; in++;
        *out++ = *in++; in++;
        *out++ = *in++; in++;
        *out++ = *in++; in++;
        *out++ = *in++; in++;

        n -= 8;
    } while (n > 0);
}

void aFilterImpl(uint8_t flags, uint16_t count_or_buf, int16_t state_or_filter[8]) {
    if (flags > A_INIT) {
        rspa.filter_count = ROUND_UP_16(count_or_buf);
        memcpy(rspa.filter, state_or_filter, sizeof(rspa.filter));
    } else {
        int16_t tmp[16];
        int count = rspa.filter_count;
        int16_t *buf = BUF_S16(count_or_buf);

        if (flags == A_INIT) {
            memset(tmp, 0, 8 * sizeof(int16_t));
        } else {
            memcpy(tmp, state_or_filter, 8 * sizeof(int16_t));
        }

        do {
            memcpy(tmp + 8, buf, 8 * sizeof(int16_t));
            for (int i = 0; i < 8; i++) {
                int64_t sample = 0x4000; // round term
                int16_t in = tmp[8 + i];
                for (int j = 1; j <= 8; j++) {
                    sample += in * tmp[8 + i - j];
                }
                buf[i] = clamp16((int32_t)(sample >> 15));
            }
            memcpy(tmp, tmp + 8, 8 * sizeof(int16_t));

            buf += 8;
            count -= 8 * sizeof(int16_t);
        } while (count > 0);

        memcpy(state_or_filter, tmp, 8 * sizeof(int16_t));
    }
}

void aHiLoGainImpl(uint8_t g, uint16_t count, uint16_t addr) {
    int16_t *samples = BUF_S16(addr);
    int nbytes = ROUND_UP_32(count);

    do {
        *samples = clamp16((*samples * g) >> 4); samples++;
        *samples = clamp16((*samples * g) >> 4); samples++;
        *samples = clamp16((*samples * g) >> 4); samples++;
        *samples = clamp16((*samples * g) >> 4); samples++;
        *samples = clamp16((*samples * g) >> 4); samples++;
        *samples = clamp16((*samples * g) >> 4); samples++;
        *samples = clamp16((*samples * g) >> 4); samples++;
        *samples = clamp16((*samples * g) >> 4); samples++;

        nbytes -= 8;
    } while (nbytes > 0);
}

void aUnknown25Impl(uint8_t f, uint16_t count, uint16_t out_addr, uint16_t in_addr) {
    int nbytes = ROUND_UP_64(count);
    int16_t *in = BUF_S16(in_addr + f);
    int16_t *out = BUF_S16(out_addr);
    int16_t tbl[32];

    memcpy(tbl, in, 32 * sizeof(int16_t));
    do {
        for (int i = 0; i < 32; i++) {
            out[i] = clamp16(out[i] * tbl[i]);
        }
        out += 32;
        nbytes -= 32 * sizeof(int16_t);
    } while (nbytes > 0);
}
#endif
