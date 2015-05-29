#import <Specta/Specta.h>
#import "Expecta.h"
#import <OCMock/OCMock.h>

#import "BowlingGame.h"
#import "RollValidator.h"
#import "RollHistory.h"
#import "ScoreCalculator.h"

SpecBegin(BowlingGame)

describe(@"BowlingGame", ^{
    //variables
    __block id rollValidatorMock;
    __block id rollHistoryMock;
    __block id scoreCalculatorMock;
    __block BowlingGame *game;
    
    beforeEach(^{
        rollValidatorMock = OCMProtocolMock(@protocol(RollValidator));
        rollHistoryMock = OCMProtocolMock(@protocol(RollHistory));
        scoreCalculatorMock = OCMProtocolMock(@protocol(ScoreCalculator));
        game = [[BowlingGame alloc] initWithValidator:rollValidatorMock history:rollHistoryMock andCalculator:scoreCalculatorMock];
    });
    
    pending(@"when the player rolls an invalid ball", ^{
        it(@"should throw an error", ^{
            
        });
    });
    
    describe(@"when the player rolls a valid ball", ^{
        it(@"should record the number of pins hit", ^{
            //context
            NSInteger roll = 0;
            OCMStub([rollValidatorMock isValidRoll:roll]).andReturn(true);
            
            //because
            [game roll:0];
            
            //expectations
            OCMVerify([rollValidatorMock isValidRoll:roll]);
            OCMVerify([rollHistoryMock recordRoll:roll]);
        });
    });
    
    pending(@"when checking the score of an incomplete game", ^{
        it(@"should throw an error", ^{
            
        });
    });
    
    describe(@"when checking the score of a complete game", ^{
        it(@"should return the total points for the game", ^{
            //context
            OCMStub([rollValidatorMock isGameComplete:rollHistoryMock]).andReturn(true);
            
            //because
            [game score];
            
            //expectations
            OCMVerify([rollValidatorMock isGameComplete:rollHistoryMock]);
            OCMVerify([scoreCalculatorMock calculateScoreOf:rollHistoryMock]);
        });
    });
    
});

SpecEnd