#import "SimpleScoreCalculator.h"

@implementation SimpleScoreCalculator
@synthesize history;

- (NSInteger) totalScore {
    return -1;
}

- (NSInteger) scoreForFrame:(NSInteger)frame {
    if([self isStrikeOnFrame:frame]) {
        return 10+[self.history pinsForRoll:1]+[self.history pinsForRoll:2];
    }
    return -1;
}

- (BOOL) isStrikeOnFrame:(NSInteger)frame {
    //frame to roll conversion is troublesome
    return ([self.history pinsForRoll:0] == 10);
}

@end
