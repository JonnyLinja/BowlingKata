#import <Foundation/Foundation.h>
#import "RollValidator.h"
#import "RollHistory.h"

@interface BowlingGame : NSObject

- (id) initWithValidator:(id<RollValidator>)validator andHistory:(id<RollHistory>)history;
- (void) roll:(NSInteger)roll;
- (NSInteger) score;

@end
