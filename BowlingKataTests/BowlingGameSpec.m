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
    
    describe(@"when the player rolls an invalid ball", ^{
        it(@"should return an error", ^{
            //context
            NSInteger roll = 9001;
            NSError *err = nil;
            NSError *stubError = [NSError errorWithDomain:@"foobar" code:9001 userInfo:nil];
            OCMStub([rollValidatorMock isValidRoll:roll error:[OCMArg setTo:stubError]]).andReturn(false);
            
            //because
            [game roll:roll error:&err];
            
            //expectations
            OCMVerify([rollValidatorMock isValidRoll:roll error:[OCMArg anyObjectRef]]);
            expect(err).notTo.beNil();
        });
    });
    
    describe(@"when the player rolls a valid ball", ^{
        it(@"should record the number of pins hit", ^{
            //context
            NSInteger roll = 0;
            OCMStub([rollValidatorMock isValidRoll:roll error:nil]).andReturn(true);
            
            //because
            [game roll:roll error:nil];
            
            //expectations
            OCMVerify([rollValidatorMock isValidRoll:roll error:nil]);
            OCMVerify([rollHistoryMock recordRoll:roll]);
        });
    });
    
    describe(@"when checking the score of an incomplete game", ^{
        it(@"should return -1", ^{
            //context
            OCMStub([rollValidatorMock isGameComplete:rollHistoryMock]).andReturn(false);
            
            //because
            NSInteger score = [game score];
            
            //expectations
            OCMVerify([rollValidatorMock isGameComplete:rollHistoryMock]);
            expect(score).to.equal(-1);
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
            OCMVerify([scoreCalculatorMock totalScore]);
        });
    });
    
});

SpecEnd