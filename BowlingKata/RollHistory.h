@protocol RollHistory <NSObject>
- (void) recordRollWithPins:(NSInteger)pins;
- (NSInteger) pinsForRoll:(NSInteger)roll;
@end