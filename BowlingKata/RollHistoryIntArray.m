#import "RollHistoryIntArray.h"

@implementation RollHistoryIntArray {
    NSInteger _array[21];
    NSInteger _currentPosition;
}

- (void) recordRollWithPins:(NSInteger)pins {
    _array[_currentPosition++] = pins;
}

- (NSInteger) pinsForRoll:(NSInteger)roll {
    return _array[roll];
}

@end
