#import "TyphoonAssembly.h"

@class BowlingAssembly;
@class ViewController;

@interface ApplicationAssembly : TyphoonAssembly
@property(nonatomic, strong, readonly) BowlingAssembly *bowlingAssembly;
- (ViewController *) rootViewController;
@end
