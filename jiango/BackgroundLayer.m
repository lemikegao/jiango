//
//  HelloWorldLayer.m
//  jiango
//
//  Created by Michael Gao on 6/28/12.
//  Copyright Calimucho 2012. All rights reserved.
//


#import "BackgroundLayer.h"

@implementation BackgroundLayer

@synthesize backgroundNode = _backgroundNode;
@synthesize bgStars = _bgStars;
@synthesize bgStars2 = _bgStars2;
@synthesize fuel = _fuel;
@synthesize controlsDelegate = _controlsDelegate;

-(id) init
{
	if( (self=[super init]) ) {
        // Create fuel bar
        _fuel = [CCProgressTimer progressWithSprite:[CCSprite spriteWithFile:@"white_bar.png"]];
        _fuel.type = kCCProgressTimerTypeBar;
        _fuel.midpoint = ccp(0, 0);
        _fuel.percentage = 100;
        
        [self addChild:_fuel z:1000];
        [_fuel setPosition:ccp(400, 1000)];
        
        // Create the background CCParallaxNode
        _backgroundNode = [CCParallaxNode node];
        [self addChild:_backgroundNode z:-1];
        
        // Create the sprites we'll add to the CCParallaxNode
        _bgStars = [CCSprite spriteWithFile:@"background.png"];
        _bgStars2 = [CCSprite spriteWithFile:@"background.png"];
        
        // Determine relative movement speeds for background
        CGPoint bgSpeed = ccp(0.1, 0.1);
        
        // Add children to CCParallaxNode
        [_backgroundNode addChild:_bgStars z:0 parallaxRatio:bgSpeed positionOffset:ccp([CCDirector sharedDirector].winSize.width/2, _bgStars.contentSize.height/2)];
        [_backgroundNode addChild:_bgStars2 z:0 parallaxRatio:bgSpeed positionOffset:ccp([CCDirector sharedDirector].winSize.width/2, _bgStars2.contentSize.height*1.5)];
        
        // Add iCade support
        iCadeReaderView *icrv = [[iCadeReaderView alloc] initWithFrame:CGRectZero];
        UIView *root = [[CCDirector sharedDirector] view];
        [root addSubview:icrv];
        icrv.active = YES;
        icrv.delegate = self;
        
        [self scheduleUpdate];
	}
    
	return self;
}

#pragma mark - 
#pragma mark - iCade

-(void)buttonDown:(iCadeState)button {
    CharacterStates delegateState = [self.controlsDelegate getDelegateState];
    if (button == iCadeButtonA) {
        if (delegateState == kStateMovingStraight) {
            [self.controlsDelegate changeState:kStateRotatingLeftAndMovingStraight];
        } else {
            [self.controlsDelegate changeState:kStateRotatingLeft];
        }
    } else if (button == iCadeButtonC) {
        if (delegateState == kStateMovingStraight) {
            [self.controlsDelegate changeState:kStateRotatingRightAndMovingStraight];
        } else {
            [self.controlsDelegate changeState:kStateRotatingRight];
        }
    } else if (button == iCadeButtonE) {
        if (delegateState == kStateRotatingLeft) {
            [self.controlsDelegate changeState:kStateRotatingLeftAndMovingStraight];
        } else if (delegateState == kStateRotatingRight) {
            [self.controlsDelegate changeState:kStateRotatingRightAndMovingStraight];
        } else {
            [self.controlsDelegate changeState:kStateMovingStraight];
        }
    }
}

-(void)buttonUp:(iCadeState)button {
    CharacterStates delegateState = [self.controlsDelegate getDelegateState];
    
    if (button == iCadeButtonA) {
        if (delegateState == kStateRotatingLeftAndMovingStraight) {
            [self.controlsDelegate changeState:kStateMovingStraight];
        } else {
            [self.controlsDelegate changeState:kStateIdle];
        }
    } else if (button == iCadeButtonC) {
        if (delegateState == kStateRotatingRightAndMovingStraight) {
            [self.controlsDelegate changeState:kStateMovingStraight];
        } else {
            [self.controlsDelegate changeState:kStateIdle];
        }
    } else if (button == iCadeButtonE) {
        if (delegateState == kStateRotatingLeftAndMovingStraight) {
            [self.controlsDelegate changeState:kStateRotatingLeft];
        } else if (delegateState == kStateRotatingRightAndMovingStraight) {
            [self.controlsDelegate changeState:kStateRotatingRight];
        } else {
            [self.controlsDelegate changeState:kStateIdle];
        }
    }
}

#pragma mark -
#pragma mark - update
- (void)update:(ccTime)dt {
    
    CGPoint backgroundScrollVel = ccp(0, -3000);
    _backgroundNode.position = ccpAdd(_backgroundNode.position, ccpMult(backgroundScrollVel, dt));
    
    NSArray *backgrounds = [NSArray arrayWithObjects:self.bgStars, self.bgStars2, nil];
    for (CCSprite *background in backgrounds) {
        if ([self.backgroundNode convertToWorldSpace:background.position].y < -500) {
            [self.backgroundNode incrementOffset:ccp(0,background.contentSize.height*2) forChild:background];
        }
    }
    
    // timer
    _fuel.percentage -= dt * 10;
}

@end
