#import "ApplicationAssembly.h"
#import "BowlingAssembly.h"
#import "ViewController.h"

@implementation ApplicationAssembly

- (ViewController *) rootViewController {
    return [TyphoonDefinition withClass:[ViewController class] configuration:^(TyphoonDefinition* definition) {
        [definition injectProperty:@selector(game) with:[_bowlingAssembly basicBowlingGame]];
    }];
}

@end
