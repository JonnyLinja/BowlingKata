#import "TyphoonAssembly.h"

@class BowlingGame;
@protocol RollValidator;
@protocol RollHistory;
@protocol ScoreCalculator;

@interface BowlingAssembly : TyphoonAssembly

- (BowlingGame *) basicBowlingGame;
- (id<RollValidator>) yesValidator;
- (id<RollHistory>) intHistory;
- (id<ScoreCalculator>) simpleCalculator;

@end
