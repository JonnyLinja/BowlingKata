#import "RollHistory.h"

@protocol ScoreCalculator <NSObject>
- (NSInteger) calculateScoreOf:(id <RollHistory>)history;
@end