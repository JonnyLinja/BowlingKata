//
//  YesValidator.m
//  BowlingKata
//
//  Created by N A on 5/29/15.
//  Copyright (c) 2015 N A. All rights reserved.
//

#import "YesValidator.h"

@implementation YesValidator

- (BOOL) isValidRoll:(NSInteger)roll error:(NSError * __autoreleasing *)error {
    return YES;
}

- (BOOL) isGameComplete:(id<RollHistory>)history {
    return YES;
}

@end
