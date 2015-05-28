#import <Specta/Specta.h>
#import "Expecta.h"
#import <OCMock/OCMock.h>

#import "BowlingGame.h"
#import "RollValidator.h"
#import "RollHistory.h"

SpecBegin(BowlingGame)

pending(@"when the player rolls an invalid ball", ^{
    it(@"should throw an error", ^{
        
    });
});

describe(@"when the player rolls a valid ball", ^{
    it(@"should record the number of pins hit", ^{
        //roll
        NSInteger roll = 0;
        
        //mocks
        id rollValidatorMock = OCMProtocolMock(@protocol(RollValidator));
        OCMStub([rollValidatorMock isValidRoll:roll]).andReturn(true);
        id rollHistoryMock = OCMProtocolMock(@protocol(RollHistory));
        
        //sut
        BowlingGame *game = [[BowlingGame alloc] initWithValidator:rollValidatorMock andHistory:rollHistoryMock];
        
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
    });
});

SpecEnd