#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self rollPins:3 times:4];
    [self rollStrike];
    [self rollPins:2 times:8];
    [self rollSpare];
    [self rollStrike];
    [self rollStrike];
    [self rollStrike];
    [self rollStrike];
    
    NSLog(@"SCORE %li", [self.game score]);
}

- (void) rollStrike {
    [self.game roll:10 error:nil];
}

- (void) rollSpare {
    [self.game roll:4 error:nil];
    [self.game roll:6 error:nil];
}

- (void) rollPins:(NSInteger)pin times:(NSInteger)times {
    for(int i=0; i<times; i++) {
        [self.game roll:pin error:nil];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
