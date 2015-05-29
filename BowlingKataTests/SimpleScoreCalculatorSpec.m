#import <Specta/Specta.h>
#import "Expecta.h"
#import <OCMock/OCMock.h>

#import "SimpleScoreCalculator.h"
#import "RollHistory.h"

SpecBegin(SimpleScoreCalculator)

describe(@"SimpleScoreCalculator", ^{
    //variables
    __block id<RollHistory> historyMock;
    __block SimpleScoreCalculator *sut;
    
    beforeEach(^{
        historyMock = OCMProtocolMock(@protocol(RollHistory));
        sut = [SimpleScoreCalculator new];
        sut.history = historyMock;
    });
    
    describe(@"when calculating score", ^{
        it(@"should return the sum of the scores for each of the 10 frames", ^{
            
        });
    });
    
    
    describe(@"when calculating the score for frame with a strike", ^{
        it(@"should return 10 plus the sum of the next two rolls", ^{
            //mocks
            OCMStub([historyMock pinsForRoll:0]).andReturn(10);
            OCMStub([historyMock pinsForRoll:1]).andReturn(6);
            OCMStub([historyMock pinsForRoll:2]).andReturn(2);
            
            //because
            NSInteger score = [sut scoreForNextFrame];
            
            //verify
            expect(score).to.equal(18);
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
});

SpecEnd