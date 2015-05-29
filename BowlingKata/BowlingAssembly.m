#import "BowlingAssembly.h"
#import "BowlingGame.h"
#import "YesValidator.h"
#import "RollHistoryIntArray.h"
#import "SimpleScoreCalculator.h"

@implementation BowlingAssembly

- (BowlingGame *) basicBowlingGame {
    return [TyphoonDefinition withClass:[BowlingGame class] configuration:^(TyphoonDefinition* definition) {
        [definition useInitializer:@selector(initWithValidator:history:andCalculator:) parameters:^(TyphoonMethod *initializer) {
            [initializer injectParameterWith:[self yesValidator]];
            [initializer injectParameterWith:[self intHistory]];
            [initializer injectParameterWith:[self simpleCalculator]];
        }];
    }];
}

- (id<RollValidator>) yesValidator {
    return [TyphoonDefinition withClass:[YesValidator class]];
}

- (id<RollHistory>) intHistory {
    return [TyphoonDefinition withClass:[RollHistoryIntArray class]];
}

- (id<ScoreCalculator>) simpleCalculator {
    return [TyphoonDefinition withClass:[SimpleScoreCalculator class]];

}

@end
