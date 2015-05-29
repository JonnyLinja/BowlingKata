#import "SimpleScoreCalculator.h"

@implementation SimpleScoreCalculator {
    NSInteger _historyPosition;
}
@synthesize history;

- (NSInteger) totalScore {
    return -1;
}

- (NSInteger) scoreForNextFrame {
    if([self isStrike]) {
        return 10+[self.history pinsForRoll:1]+[self.history pinsForRoll:2];
    }
    return -1;
}

- (BOOL) isStrike {
    return ([self.history pinsForRoll:_historyPosition] == 10);
}

@end
