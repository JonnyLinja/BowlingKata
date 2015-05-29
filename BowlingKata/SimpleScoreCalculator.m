#import "SimpleScoreCalculator.h"

@implementation SimpleScoreCalculator {
    NSInteger _historyPosition;
}
@synthesize history;

- (NSInteger) totalScore {
    NSInteger score = 0;
    for(int i=0; i<10; i++) {
        score += [self scoreForNextFrame];
    }
    return score;
}

- (NSInteger) scoreForNextFrame {
    if([self isStrike]) {
        _historyPosition++;
        return 10 + [self.history pinsForRoll:_historyPosition] + [self.history pinsForRoll:_historyPosition+1];
    }
    
    if([self isSpare]) {
        _historyPosition += 2;
        return 10 + [self.history pinsForRoll:_historyPosition];
    }
    
    NSInteger score = [self.history pinsForRoll:_historyPosition] + [self.history pinsForRoll:_historyPosition+1];
    _historyPosition += 2;
    return score;
}

- (BOOL) isStrike {
    return ([self.history pinsForRoll:_historyPosition] == 10);
}

- (BOOL) isSpare {
    NSInteger sum = [self.history pinsForRoll:_historyPosition] + [self.history pinsForRoll:_historyPosition+1];
    return sum == 10;
}

@end
