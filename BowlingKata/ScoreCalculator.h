#import "RollHistory.h"

@protocol ScoreCalculator <NSObject>
@property (nonatomic, strong) id<RollHistory> history;
- (NSInteger) totalScore;
@end
