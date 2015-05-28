#import "BowlingGame.h"

@implementation BowlingGame {
    id<RollValidator> _validator;
    id<RollHistory> _history;
}

- (id) initWithValidator:(id<RollValidator>)validator andHistory:(id<RollHistory>)history {
    if(self = [super init]) {
        _validator = validator;
        _history = history;
    }
    return self;
}

- (void) roll:(NSInteger)roll {
    if([_validator isValidRoll:roll]) {
        [_history recordRoll:roll];
    }
}

- (NSInteger) score {
    return -1;
}

@end
