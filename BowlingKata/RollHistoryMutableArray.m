#import "RollHistoryMutableArray.h"

@implementation RollHistoryMutableArray {
    NSMutableArray *_array;
}

- (id) init {
    if(self = [super init]) {
        _array = [NSMutableArray array];
    }
    return self;
}

- (void) recordRollWithPins:(NSInteger)pins {
    [_array addObject:[NSNumber numberWithInteger:pins]];
}

- (NSInteger) pinsForRoll:(NSInteger)roll {
    return [[_array objectAtIndex:roll] integerValue];
}

@end
