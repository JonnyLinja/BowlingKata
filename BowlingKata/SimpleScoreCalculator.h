#import <Foundation/Foundation.h>
#import "ScoreCalculator.h"

@interface SimpleScoreCalculator : NSObject <ScoreCalculator>

//internal use
- (NSInteger) scoreForFrame:(NSInteger)frame;

@end
