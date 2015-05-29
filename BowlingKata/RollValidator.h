#import "RollHistory.h"

@protocol RollValidator <NSObject>
//i can do this as a, pass all the data in, or in sequential order like bowling game
- (BOOL) isValidRoll:(NSInteger)roll error:(NSError * __autoreleasing *)error;
- (BOOL) isGameComplete:(id<RollHistory>)history;
@end