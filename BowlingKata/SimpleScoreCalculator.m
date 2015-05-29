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
        NSInteger score = 10 + [self strikeBonus];
        _historyPosition++;
        return score;
    }
    
    if([self isSpare]) {
        NSInteger score = 10 + [self spareBonus];
        _historyPosition+=2;
        return score;
    }
    
    NSInteger score = [self totalPinsInFrame];
    _historyPosition+=2;
    return score;
}

- (BOOL) isStrike {
    return ([self.history pinsForRoll:_historyPosition] == 10);
}

- (BOOL) isSpare {
    return (![self isStrike] && [self totalPinsInFrame] == 10);
}

- (NSInteger) strikeBonus {
    return [self.history pinsForRoll:_historyPosition+1] + [self.history pinsForRoll:_historyPosition+2];
}

- (NSInteger) spareBonus {
    return [self.history pinsForRoll:_historyPosition+2];
}

- (NSInteger) totalPinsInFrame {
    return [self.history pinsForRoll:_historyPosition] + [self.history pinsForRoll:_historyPosition+1];
}

@end
