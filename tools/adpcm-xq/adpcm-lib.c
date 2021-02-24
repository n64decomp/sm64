////////////////////////////////////////////////////////////////////////////
//                           **** ADPCM-XQ ****                           //
//                  Xtreme Quality ADPCM Encoder/Decoder                  //
//                    Copyright (c) 2015 David Bryant.                    //
//                          All Rights Reserved.                          //
//      Distributed under the BSD Software License (see license.txt)      //
////////////////////////////////////////////////////////////////////////////

#include <stdlib.h>
#include <string.h>

#include "adpcm-lib.h"

/* This module encodes and decodes 4-bit ADPCM (DVI/IMA varient). ADPCM data is divided
 * into independently decodable blocks that can be relatively small. The most common
 * configuration is to store 505 samples into a 256 byte block, although other sizes are
 * permitted as long as the number of samples is one greater than a multiple of 8. When
 * multiple channels are present, they are interleaved in the data with an 8-sample
 * interval. 
 */

/********************************* 4-bit ADPCM encoder ********************************/

#define CLIP(data, min, max) \
if ((data) > (max)) data = max; \
else if ((data) < (min)) data = min;

/* step table */
static const uint16_t step_table[89] = {
    7, 8, 9, 10, 11, 12, 13, 14,
    16, 17, 19, 21, 23, 25, 28, 31,
    34, 37, 41, 45, 50, 55, 60, 66,
    73, 80, 88, 97, 107, 118, 130, 143,
    157, 173, 190, 209, 230, 253, 279, 307,
    337, 371, 408, 449, 494, 544, 598, 658,
    724, 796, 876, 963, 1060, 1166, 1282, 1411,
    1552, 1707, 1878, 2066, 2272, 2499, 2749, 3024,
    3327, 3660, 4026, 4428, 4871, 5358, 5894, 6484,
    7132, 7845, 8630, 9493, 10442, 11487, 12635, 13899,
    15289, 16818, 18500, 20350, 22385, 24623, 27086, 29794,
    32767
};

/* step index tables */
static const int index_table[] = {
    /* adpcm data size is 4 */
    -1, -1, -1, -1, 2, 4, 6, 8
};

struct adpcm_channel {
    int32_t pcmdata;                        // current PCM value
    int32_t error, weight, history [2];     // for noise shaping
    int8_t index;                           // current index into step size table
};

struct adpcm_context {
    struct adpcm_channel channels [2];
    int num_channels, lookahead, noise_shaping;
};

/* Create ADPCM encoder context with given number of channels.
 * The returned pointer is used for subsequent calls. Note that
 * even though an ADPCM encoder could be set up to encode frames
 * independently, we use a context so that we can use previous
 * data to improve quality (this encoder might not be optimal
 * for encoding independent frames).
 */

void *adpcm_create_context (int num_channels, int lookahead, int noise_shaping, int32_t initial_deltas [2])
{
    struct adpcm_context *pcnxt = malloc (sizeof (struct adpcm_context));
    int ch, i;

    memset (pcnxt, 0, sizeof (struct adpcm_context));
    pcnxt->noise_shaping = noise_shaping;
    pcnxt->num_channels = num_channels;
    pcnxt->lookahead = lookahead;

    // given the supplied initial deltas, search for and store the closest index

    for (ch = 0; ch < num_channels; ++ch)
        for (i = 0; i <= 88; i++)
            if (i == 88 || initial_deltas [ch] < ((int32_t) step_table [i] + step_table [i+1]) / 2) {
                pcnxt->channels [ch].index = i;
                break;
            }

    return pcnxt;
}

/* Free the ADPCM encoder context.
 */

void adpcm_free_context (void *p)
{
    struct adpcm_context *pcnxt = (struct adpcm_context *) p;

    free (pcnxt);
}

static void set_decode_parameters (struct adpcm_context *pcnxt, int32_t *init_pcmdata, int8_t *init_index)
{
    int ch;

    for (ch = 0; ch < pcnxt->num_channels; ch++) {
        pcnxt->channels[ch].pcmdata = init_pcmdata[ch];
        pcnxt->channels[ch].index = init_index[ch];
    }
}

static void get_decode_parameters (struct adpcm_context *pcnxt, int32_t *init_pcmdata, int8_t *init_index)
{
    int ch;

    for (ch = 0; ch < pcnxt->num_channels; ch++) {
        init_pcmdata[ch] = pcnxt->channels[ch].pcmdata;
        init_index[ch] = pcnxt->channels[ch].index;
    }
}

static double minimum_error (const struct adpcm_channel *pchan, int nch, int32_t csample, const int16_t *sample, int depth, int *best_nibble)
{
    int32_t delta = csample - pchan->pcmdata;
    struct adpcm_channel chan = *pchan;
    int step = step_table[chan.index];
    int trial_delta = (step >> 3);
    int nibble, nibble2;
    double min_error;

    if (delta < 0) {
        int mag = (-delta << 2) / step;
        nibble = 0x8 | (mag > 7 ? 7 : mag);
    }
    else {
        int mag = (delta << 2) / step;
        nibble = mag > 7 ? 7 : mag;
    }

    if (nibble & 1) trial_delta += (step >> 2);
    if (nibble & 2) trial_delta += (step >> 1);
    if (nibble & 4) trial_delta += step;
    if (nibble & 8) trial_delta = -trial_delta;

    chan.pcmdata += trial_delta;
    CLIP(chan.pcmdata, -32768, 32767);
    if (best_nibble) *best_nibble = nibble;
    min_error = (double) (chan.pcmdata - csample) * (chan.pcmdata - csample);

    if (depth) {
        chan.index += index_table[nibble & 0x07];
        CLIP(chan.index, 0, 88);
        min_error += minimum_error (&chan, nch, sample [nch], sample + nch, depth - 1, NULL);
    }
    else
        return min_error;

    for (nibble2 = 0; nibble2 <= 0xF; ++nibble2) {
        double error;

        if (nibble2 == nibble)
            continue;

        chan = *pchan;
        trial_delta = (step >> 3);

        if (nibble2 & 1) trial_delta += (step >> 2);
        if (nibble2 & 2) trial_delta += (step >> 1);
        if (nibble2 & 4) trial_delta += step;
        if (nibble2 & 8) trial_delta = -trial_delta;

        chan.pcmdata += trial_delta;
        CLIP(chan.pcmdata, -32768, 32767);

        error = (double) (chan.pcmdata - csample) * (chan.pcmdata - csample);

        if (error < min_error) {
            chan.index += index_table[nibble2 & 0x07];
            CLIP(chan.index, 0, 88);
            error += minimum_error (&chan, nch, sample [nch], sample + nch, depth - 1, NULL);

            if (error < min_error) {
                if (best_nibble) *best_nibble = nibble2;
                min_error = error;
            }
        }
    }

    return min_error;
}

static uint8_t encode_sample (struct adpcm_context *pcnxt, int ch, const int16_t *sample, int num_samples)
{
    struct adpcm_channel *pchan = pcnxt->channels + ch;
    int32_t csample = *sample;
    int depth = num_samples - 1, nibble;
    int step = step_table[pchan->index];
    int trial_delta = (step >> 3);

    if (pcnxt->noise_shaping == NOISE_SHAPING_DYNAMIC) {
        int32_t sam = (3 * pchan->history [0] - pchan->history [1]) >> 1;
        int32_t temp = csample - (((pchan->weight * sam) + 512) >> 10);
        int32_t shaping_weight;

        if (sam && temp) pchan->weight -= (((sam ^ temp) >> 29) & 4) - 2;
        pchan->history [1] = pchan->history [0];
        pchan->history [0] = csample;

        shaping_weight = (pchan->weight < 256) ? 1024 : 1536 - (pchan->weight * 2);
        temp = -((shaping_weight * pchan->error + 512) >> 10);

        if (shaping_weight < 0 && temp) {
            if (temp == pchan->error)
                temp = (temp < 0) ? temp + 1 : temp - 1;

            pchan->error = -csample;
            csample += temp;
        }
        else
            pchan->error = -(csample += temp);
    }
    else if (pcnxt->noise_shaping == NOISE_SHAPING_STATIC)
        pchan->error = -(csample -= pchan->error);

    if (depth > pcnxt->lookahead)
        depth = pcnxt->lookahead;

    minimum_error (pchan, pcnxt->num_channels, csample, sample, depth, &nibble);

    if (nibble & 1) trial_delta += (step >> 2);
    if (nibble & 2) trial_delta += (step >> 1);
    if (nibble & 4) trial_delta += step;
    if (nibble & 8) trial_delta = -trial_delta;

    pchan->pcmdata += trial_delta;
    pchan->index += index_table[nibble & 0x07];
    CLIP(pchan->index, 0, 88);
    CLIP(pchan->pcmdata, -32768, 32767);

    if (pcnxt->noise_shaping)
        pchan->error += pchan->pcmdata;

    return nibble;
}

static void encode_chunks (struct adpcm_context *pcnxt, uint8_t **outbuf, size_t *outbufsize, const int16_t **inbuf, int inbufcount)
{
    const int16_t *pcmbuf;
    int chunks, ch, i;

    chunks = (inbufcount - 1) / 8;
    *outbufsize += (chunks * 4) * pcnxt->num_channels;

    while (chunks--)
    {
        for (ch = 0; ch < pcnxt->num_channels; ch++)
        {
            pcmbuf = *inbuf + ch;

            for (i = 0; i < 4; i++) {
                **outbuf = encode_sample (pcnxt, ch, pcmbuf, chunks * 8 + (3 - i) * 2 + 2);
                pcmbuf += pcnxt->num_channels;
                **outbuf |= encode_sample (pcnxt, ch, pcmbuf, chunks * 8 + (3 - i) * 2 + 1) << 4;
                pcmbuf += pcnxt->num_channels;
                (*outbuf)++;
            }
        }

        *inbuf += 8 * pcnxt->num_channels;
    }
}

/* Encode a block of 16-bit PCM data into 4-bit ADPCM.
 *
 * Parameters:
 *  p               the context returned by adpcm_begin()
 *  outbuf          destination buffer
 *  outbufsize      pointer to variable where the number of bytes written
 *                   will be stored
 *  inbuf           source PCM samples
 *  inbufcount      number of composite PCM samples provided (note: this is
 *                   the total number of 16-bit samples divided by the number
 *                   of channels)
 *
 * Returns 1 (for success as there is no error checking)
 */

int adpcm_encode_block (void *p, uint8_t *outbuf, size_t *outbufsize, const int16_t *inbuf, int inbufcount)
{
    struct adpcm_context *pcnxt = (struct adpcm_context *) p;
    int32_t init_pcmdata[2];
    int8_t init_index[2];
    int ch;

    *outbufsize = 0;

    if (!inbufcount)
        return 1;

    get_decode_parameters(pcnxt, init_pcmdata, init_index);

    for (ch = 0; ch < pcnxt->num_channels; ch++) {
        init_pcmdata[ch] = *inbuf++;
        outbuf[0] = init_pcmdata[ch];
        outbuf[1] = init_pcmdata[ch] >> 8;
        outbuf[2] = init_index[ch];
        outbuf[3] = 0;

        outbuf += 4;
        *outbufsize += 4;
    }

    set_decode_parameters(pcnxt, init_pcmdata, init_index);
    encode_chunks (pcnxt, &outbuf, outbufsize, &inbuf, inbufcount);

    return 1;
}

/********************************* 4-bit ADPCM decoder ********************************/

/* Decode the block of ADPCM data into PCM. This requires no context because ADPCM blocks
 * are indeppendently decodable. This assumes that a single entire block is always decoded;
 * it must be called multiple times for multiple blocks and cannot resume in the middle of a
 * block.
 *
 * Parameters:
 *  outbuf          destination for interleaved PCM samples
 *  inbuf           source ADPCM block
 *  inbufsize       size of source ADPCM block
 *  channels        number of channels in block (must be determined from other context)
 *
 * Returns number of converted composite samples (total samples divided by number of channels)
 */ 

int adpcm_decode_block (int16_t *outbuf, const uint8_t *inbuf, size_t inbufsize, int channels)
{
    int ch, samples = 1, chunks;
    int32_t pcmdata[2];
    int8_t index[2];

    if (inbufsize < (uint32_t) channels * 4)
        return 0;

    for (ch = 0; ch < channels; ch++) {
        *outbuf++ = pcmdata[ch] = (int16_t) (inbuf [0] | (inbuf [1] << 8));
        index[ch] = inbuf [2];

        if (index [ch] < 0 || index [ch] > 88 || inbuf [3])     // sanitize the input a little...
            return 0;

        inbufsize -= 4;
        inbuf += 4;
    }

    chunks = inbufsize / (channels * 4);
    samples += chunks * 8;

    while (chunks--) {
        int ch, i;

        for (ch = 0; ch < channels; ++ch) {

            for (i = 0; i < 4; ++i) {
                int step = step_table [index [ch]], delta = step >> 3;

                if (*inbuf & 1) delta += (step >> 2);
                if (*inbuf & 2) delta += (step >> 1);
                if (*inbuf & 4) delta += step;
                if (*inbuf & 8) delta = -delta;
                
                pcmdata[ch] += delta;
                index[ch] += index_table [*inbuf & 0x7];
                CLIP(index[ch], 0, 88);
                CLIP(pcmdata[ch], -32768, 32767);
                outbuf [i * 2 * channels] = pcmdata[ch];

                step = step_table [index [ch]], delta = step >> 3;

                if (*inbuf & 0x10) delta += (step >> 2);
                if (*inbuf & 0x20) delta += (step >> 1);
                if (*inbuf & 0x40) delta += step;
                if (*inbuf & 0x80) delta = -delta;
                
                pcmdata[ch] += delta;
                index[ch] += index_table [(*inbuf >> 4) & 0x7];
                CLIP(index[ch], 0, 88);
                CLIP(pcmdata[ch], -32768, 32767);
                outbuf [(i * 2 + 1) * channels] = pcmdata[ch];

                inbuf++;
            }

            outbuf++;
        }

        outbuf += channels * 7;
    }

    return samples;
}

