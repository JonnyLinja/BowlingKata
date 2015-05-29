#import "YesValidator.h"

@implementation YesValidator

- (BOOL) isValidRoll:(NSInteger)roll error:(NSError * __autoreleasing *)error {
    return YES;
}

- (BOOL) isGameComplete:(id<RollHistory>)history {
    return YES;
}

@end
