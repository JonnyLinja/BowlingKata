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
    
    if([self isSpare]) {
        return 10+[self.history pinsForRoll:2];
    }
    
    return [self.history pinsForRoll:0]+[self.history pinsForRoll:1];
}

- (BOOL) isStrike {
    return ([self.history pinsForRoll:_historyPosition] == 10);
}

- (BOOL) isSpare {
    NSInteger sum = [self.history pinsForRoll:_historyPosition] + [self.history pinsForRoll:_historyPosition+1];
    return sum == 10;
}

@end
