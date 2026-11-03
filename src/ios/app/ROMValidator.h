//
// ROMValidator.h — scans Documents for N64 ROMs, validates SHA-1 against the
// known-good SM64 hashes (mirrored from sm64.{us,jp,eu,sh}.sha1), same layout
// as existing N64 emulators: ROMs live in Documents, valid ones are listed.
//
#import <Foundation/Foundation.h>

typedef enum {
    SM64RomVersionUnknown = 0,
    SM64RomVersionUS,
    SM64RomVersionJP,
    SM64RomVersionEU,
    SM64RomVersionSH
} SM64RomVersion;

@interface SM64RomInfo : NSObject
@property (nonatomic, strong) NSString *path;
@property (nonatomic, strong) NSString *sha1;
@property (nonatomic, assign) SM64RomVersion version;
- (NSString *)displayName;
@end

@interface SM64ROMValidator : NSObject
// All *.z64/*.n64/*.v64 files found in Documents (valid or not).
+ (NSArray *)scanDocuments;
// SHA-1 hex of a file, or nil on error. Uses CommonCrypto (iOS 6 SDK).
+ (NSString *)sha1OfFileAtPath:(NSString *)path;
// Classify a SHA-1; SM64RomVersionUnknown if not a known SM64 dump.
+ (SM64RomVersion)versionForSHA1:(NSString *)sha1;
+ (BOOL)isKnownGoodVersion:(SM64RomVersion)v;
// First known-good ROM in Documents, or nil when none is provided yet.
+ (SM64RomInfo *)firstValidROM;
@end
