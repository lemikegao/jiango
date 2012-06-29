//
//  GameplayLayer.m
//  jiango
//
//  Created by Michael Gao on 6/28/12.
//  Copyright 2012 Calimucho. All rights reserved.
//

#import "GameplayLayer.h"


@implementation GameplayLayer

-(id)init {
    self = [super init];
    if (self != nil) {
        andyDirection = kDirectionNone;
        CGSize screenSize = [CCDirector sharedDirector].winSize;  // 1
        // enable touches
//        self.isTouchEnabled = YES;                                // 2
        andySprite = [CCSprite spriteWithFile:@"andy horse zoom.jpg"]; // 3
        
        [andySprite setPosition:
         CGPointMake(screenSize.width/2,
                     screenSize.height/2)];                // 4
        [self addChild:andySprite];                             // 5
    }
    
    [self scheduleUpdate];
    
    return self; 
}

-(void)changeAndyDirection:(ControlDirection)direction {
    andyDirection = direction;
}

-(void)andyMove {
    if (andyDirection == kDirectionLeft) {
        CGPoint newPosition = ccp(andySprite.position.x-5, andySprite.position.y);
        [andySprite setPosition:newPosition];
    } else if (andyDirection == kDirectionUp) {
        CGPoint newPosition = ccp(andySprite.position.x, andySprite.position.y+5);
        [andySprite setPosition:newPosition];
    } else if (andyDirection == kDirectionRight) {
        CGPoint newPosition = ccp(andySprite.position.x+5, andySprite.position.y);
        [andySprite setPosition:newPosition];
    } else if (andyDirection == kDirectionDown) {
        CGPoint newPosition = ccp(andySprite.position.x, andySprite.position.y-5);
        [andySprite setPosition:newPosition];
    }
}

#pragma mark -
#pragma mark Update Method
-(void) update:(ccTime)deltaTime
{
    [self andyMove];
}

@end
