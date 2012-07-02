//
//  Rocketship.m
//  jiango
//
//  Created by Michael Gao on 6/30/12.
//  Copyright 2012 Calimucho. All rights reserved.
//

#import "Rocketship.h"


@implementation Rocketship

@synthesize idleFrame = _idleFrame;
@synthesize movingStraightAnim = _movingStraightAnim;
@synthesize rotatingLeftAndMovingStraightAnim = _rotatingLeftAndMovingStraightAnim;
@synthesize rotatingRightAndMovingStraightAnim = _rotatingRightAndMovingStraightAnim;

#pragma mark -
#pragma mark - init methods
-(id) initWithTexture:(CCTexture2D *)texture rect:(CGRect)rect {
    if( (self=[super initWithTexture:texture rect:rect]) ) {
        self.gameObjectType = kRocketshipType;
        [self initAnimations];
    }
    return self;
}

-(void)initAnimations {
    [self setMovingStraightAnim:[self loadPlistForAnimationWithName:@"movingStraightAnim" andClassName:NSStringFromClass([self class])]];
    [self setRotatingLeftAndMovingStraightAnim:[self loadPlistForAnimationWithName:@"rotatingLeftAndMovingStraightAnim" andClassName:NSStringFromClass([self class])]];
    [self setRotatingRightAndMovingStraightAnim:[self loadPlistForAnimationWithName:@"rotatingRightAndMovingStraightAnim" andClassName:NSStringFromClass([self class])]];
}

#pragma mark -
#pragma mark - ControlsDelegate methods

-(void)changeState:(CharacterStates)newState {
    [self stopAllActions];
    id action = nil;

    [self setCharacterState:newState];
    switch (newState) {
        case kStateIdle:
            [self setDisplayFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"rocketship_1.png"]];
            break;
            
        case kStateMovingStraight:
            action = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:self.movingStraightAnim]];
            break;
            
        case kStateRotatingLeft:
            [self setDisplayFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"rocketship_4.png"]];
            break;
            
        case kStateRotatingRight:
            [self setDisplayFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"rocketship_7.png"]];
            break;
            
        case kStateRotatingLeftAndMovingStraight:
            action = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:self.rotatingLeftAndMovingStraightAnim]];
            break;
            
        case kStateRotatingRightAndMovingStraight:
            action = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:self.rotatingRightAndMovingStraightAnim]];
            break;
            
        default:
            break;
    }
    
    if (action != nil) {
        [self runAction:action];
    }
}

-(CharacterStates)getDelegateState {
    return self.characterState;
}

#pragma mark -

-(void)checkAndClampSpritePosition {
    
}


#pragma mark -
-(void)updateStateWithDeltaTime:(ccTime)deltaTime andListOfGameObjects:(CCArray*)listOfGameObjects {
    
    if (self.characterState == kStateMovingStraight) {
        CGPoint facingAngle = ccp(sin(CC_DEGREES_TO_RADIANS(self.rotation)), cos(CC_DEGREES_TO_RADIANS(self.rotation)));
        CGPoint newPosition = ccp(self.position.x + facingAngle.x*5, self.position.y + facingAngle.y*5);
        self.position = ccp(newPosition.x, newPosition.y);
    } else if (self.characterState == kStateRotatingLeft) {
        self.rotation = self.rotation - 4.0f;
    } else if (self.characterState == kStateRotatingRight) {
        self.rotation = self.rotation + 4.0f;
    } else if (self.characterState == kStateRotatingLeftAndMovingStraight) {
        self.rotation = self.rotation - 4.0f;
        CGPoint facingAngle = ccp(sin(CC_DEGREES_TO_RADIANS(self.rotation)), cos(CC_DEGREES_TO_RADIANS(self.rotation)));
        CGPoint newPosition = ccp(self.position.x + facingAngle.x*5, self.position.y + facingAngle.y*5);
        self.position = ccp(newPosition.x, newPosition.y);
    } else if (self.characterState == kStateRotatingRightAndMovingStraight) {
        self.rotation = self.rotation + 4.0f;
        CGPoint facingAngle = ccp(sin(CC_DEGREES_TO_RADIANS(self.rotation)), cos(CC_DEGREES_TO_RADIANS(self.rotation)));
        CGPoint newPosition = ccp(self.position.x + facingAngle.x*5, self.position.y + facingAngle.y*5);
        self.position = ccp(newPosition.x, newPosition.y);
    }
}

#pragma mark -
-(CGRect)adjustedBoundingBox {
    // Adjust the bouding box to the size of the sprite
    // without the transparent space
    
    CGRect rocketshipBoundingBox = [self boundingBox];
    
    return rocketshipBoundingBox;
}

@end
