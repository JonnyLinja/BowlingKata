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
            //mocks
            OCMStub([historyMock pinsForRoll:0]).andReturn(10);     //1
            OCMStub([historyMock pinsForRoll:1]).andReturn(6);      //2
            OCMStub([historyMock pinsForRoll:2]).andReturn(2);
            OCMStub([historyMock pinsForRoll:3]).andReturn(4);      //3
            OCMStub([historyMock pinsForRoll:4]).andReturn(6);
            OCMStub([historyMock pinsForRoll:5]).andReturn(10);     //4
            OCMStub([historyMock pinsForRoll:6]).andReturn(10);     //5
            OCMStub([historyMock pinsForRoll:7]).andReturn(10);     //6
            OCMStub([historyMock pinsForRoll:8]).andReturn(10);     //7
            OCMStub([historyMock pinsForRoll:9]).andReturn(10);     //8
            OCMStub([historyMock pinsForRoll:10]).andReturn(10);    //9
            OCMStub([historyMock pinsForRoll:11]).andReturn(3);     //10
            OCMStub([historyMock pinsForRoll:12]).andReturn(6);
            
            //because
            NSInteger score = [sut totalScore];
            
            //verify
            expect(score).to.equal(217);
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
            //mocks
            OCMStub([historyMock pinsForRoll:0]).andReturn(4);
            OCMStub([historyMock pinsForRoll:1]).andReturn(6);
            OCMStub([historyMock pinsForRoll:2]).andReturn(2);
            
            //because
            NSInteger score = [sut scoreForNextFrame];
            
            //verify
            expect(score).to.equal(12);
        });
    });
    
    describe(@"when calculating the score for frame with neither a strike or spare", ^{
        it(@"should return the sum of the two rolls of that frame", ^{
            //mocks
            OCMStub([historyMock pinsForRoll:0]).andReturn(3);
            OCMStub([historyMock pinsForRoll:1]).andReturn(6);
            
            //because
            NSInteger score = [sut scoreForNextFrame];
            
            //verify
            expect(score).to.equal(9);
        });
    });
});

SpecEnd