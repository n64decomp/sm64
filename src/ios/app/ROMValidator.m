//
// ROMValidator.m — implementation. Hashes mirrored from the donor repo:
//   sm64.us.sha1  9bef1128717f958171a4afac3ed78ee2bb4e86ce
//   sm64.jp.sha1  8a20a5c83d6ceb0f0506cfc9fa20d8f438cafe51
//   sm64.eu.sha1  4ac5721683d0e0b6bbb561b58a71740845dceea9
//   sm64.sh.sha1  3f319ae697533a255a1003d09202379d78d5a2e0
//
#import "ROMValidator.h"
#import <CommonCrypto/CommonDigest.h>

@implementation SM64RomInfo

- (NSString *)displayName {
    NSString *base = [_path lastPathComponent];
    switch (_version) {
        case SM64RomVersionUS: return [base stringByAppendingString:@"  (US — supported)"];
        case SM64RomVersionJP: return [base stringByAppendingString:@"  (JP)"];
        case SM64RomVersionEU: return [base stringByAppendingString:@"  (EU)"];
        case SM64RomVersionSH: return [base stringByAppendingString:@"  (SH)"];
        default: return [base stringByAppendingString:@"  (unknown dump)"];
    }
}
@end

@implementation SM64ROMValidator

+ (NSArray *)romSearchPaths {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docs = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
    if (docs == nil) return [NSArray array];
    return [NSArray arrayWithObject:docs];
}

+ (NSArray *)scanDocuments {
    NSMutableArray *out = [NSMutableArray array];
    NSFileManager *fm = [NSFileManager defaultManager];
    NSArray *exts = [NSArray arrayWithObjects:@"z64", @"n64", @"v64", nil];
    for (NSString *dir in [self romSearchPaths]) {
        NSArray *files = [fm contentsOfDirectoryAtPath:dir error:nil];
        for (NSString *f in files) {
            NSString *ext = [[f pathExtension] lowercaseString];
            if (![exts containsObject:ext]) continue;
            NSString *full = [dir stringByAppendingPathComponent:f];
            NSString *sha1 = [self sha1OfFileAtPath:full];
            SM64RomInfo *info = [[SM64RomInfo alloc] init];
            info.path = full;
            info.sha1 = (sha1 != nil) ? sha1 : @"";
            info.version = [self versionForSHA1:sha1];
            [out addObject:info];
        }
    }
    return out;
}

+ (NSString *)sha1OfFileAtPath:(NSString *)path {
    NSFileHandle *fh = [NSFileHandle fileHandleForReadingAtPath:path];
    if (fh == nil) return nil;
    CC_SHA1_CTX ctx;
    CC_SHA1_Init(&ctx);
    while (YES) {
        NSData *chunk = [fh readDataOfLength:65536];
        if ([chunk length] == 0) break;
        CC_SHA1_Update(&ctx, [chunk bytes], (CC_LONG)[chunk length]);
    }
    [fh closeFile];
    unsigned char digest[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1_Final(digest, &ctx);
    NSMutableString *hex = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    int i;
    for (i = 0; i < CC_SHA1_DIGEST_LENGTH; i++) {
        [hex appendFormat:@"%02x", digest[i]];
    }
    return hex;
}

+ (SM64RomVersion)versionForSHA1:(NSString *)sha1 {
    if (sha1 == nil) return SM64RomVersionUnknown;
    NSString *s = [sha1 lowercaseString];
    if ([s isEqualToString:@"9bef1128717f958171a4afac3ed78ee2bb4e86ce"]) return SM64RomVersionUS;
    if ([s isEqualToString:@"8a20a5c83d6ceb0f0506cfc9fa20d8f438cafe51"]) return SM64RomVersionJP;
    if ([s isEqualToString:@"4ac5721683d0e0b6bbb561b58a71740845dceea9"]) return SM64RomVersionEU;
    if ([s isEqualToString:@"3f319ae697533a255a1003d09202379d78d5a2e0"]) return SM64RomVersionSH;
    return SM64RomVersionUnknown;
}

+ (BOOL)isKnownGoodVersion:(SM64RomVersion)v {
    return v == SM64RomVersionUS || v == SM64RomVersionJP ||
           v == SM64RomVersionEU || v == SM64RomVersionSH;
}

+ (SM64RomInfo *)firstValidROM {
    for (SM64RomInfo *info in [self scanDocuments]) {
        if ([self isKnownGoodVersion:info.version]) return info;
    }
    return nil;
}

@end
