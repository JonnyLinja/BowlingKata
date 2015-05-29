#import <Specta/Specta.h>
#import "Expecta.h"
#import <OCMock/OCMock.h>

#import "ScoreCalculator.h"
#import "RollHistory.h"

SpecBegin(SimpleScoreCalculator)

describe(@"when calculating score", ^{
    it(@"should return the sum of the scores for each of the 10 frames", ^{
        
    });
});


describe(@"when calculating the score for frame with a strike", ^{
    it(@"should return 10 plus the sum of the next two rolls", ^{
        
    });
});

describe(@"when calculating the score for frame with a spare", ^{
    it(@"should return 10 plus the score of the next roll", ^{
        
    });
});

describe(@"when calculating the score for frame with neither a strike or spare", ^{
    it(@"should return the sum of the two rolls of that frame", ^{
        
    });
});

SpecEnd