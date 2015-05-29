#import <Foundation/Foundation.h>
#import "ScoreCalculator.h"

@interface SimpleScoreCalculator : NSObject <ScoreCalculator>

- (NSInteger) scoreForFrame;

@end
