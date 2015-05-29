#import <Foundation/Foundation.h>
#import "RollValidator.h"
#import "RollHistory.h"
#import "ScoreCalculator.h"

@interface BowlingGame : NSObject

- (id) initWithValidator:(id<RollValidator>)validator history:(id<RollHistory>)history andCalculator:(id<ScoreCalculator>)calculator;
- (void) roll:(NSInteger)roll error:(NSError * __autoreleasing *)error;
- (NSInteger) score;

@end
