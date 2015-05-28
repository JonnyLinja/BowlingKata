@protocol RollHistory <NSObject>
//i can do this as a, pass all the data in, or in sequential order like bowling game
- (void) recordRoll:(NSInteger)roll;
@end