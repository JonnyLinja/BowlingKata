#import "BowlingGame.h"

@implementation BowlingGame {
    id<RollValidator> _validator;
    id<RollHistory> _history;
    id<ScoreCalculator> _calculator;
}

- (id) initWithValidator:(id<RollValidator>)validator history:(id<RollHistory>)history andCalculator:(id<ScoreCalculator>)calculator {
    if(self = [super init]) {
        _validator = validator;
        _history = history;
        _calculator = calculator;
    }
    return self;
}

- (void) roll:(NSInteger)roll error:(NSError * __autoreleasing *)error {
    if([_validator isValidRoll:roll error:error]) {
        [_history recordRoll:roll];
    }
}

- (NSInteger) score {
    if([_validator isGameComplete:_history]) {
        return [_calculator calculateScoreOf:_history];
    }
    return -1;
}

@end
