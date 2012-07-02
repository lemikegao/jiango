//
//  GameplayLayer.m
//  jiango
//
//  Created by Michael Gao on 6/28/12.
//  Copyright 2012 Calimucho. All rights reserved.
//

#import "GameplayLayer.h"


@implementation GameplayLayer

@synthesize rocketship = _rocketship;
@synthesize gameplayBatchNode = _gameplayBatchNode;

-(id)init {
    self = [super init];
    if (self != nil) {
        CGSize screenSize = [CCDirector sharedDirector].winSize;
        
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"jiangoAtlas.plist"];
        _gameplayBatchNode = [CCSpriteBatchNode batchNodeWithFile:@"jiangoAtlas.png"];
        [self addChild:_gameplayBatchNode z:0];
        
        _rocketship = [[Rocketship alloc] initWithSpriteFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"rocketship_1.png"]];
        [_rocketship setPosition:ccp(screenSize.width/2, screenSize.height/2)];
        
        [_gameplayBatchNode addChild:_rocketship z:kRocketshipSpriteZValue tag:kRocketshipSpriteTagValue];
        
        [self scheduleUpdate];
    }
    
    return self; 
}

#pragma mark -
#pragma mark Update Method
-(void) update:(ccTime)deltaTime
{
    CCArray *listOfGameObjects = [self.gameplayBatchNode children];
    for (GameCharacter *tempChar in listOfGameObjects) {
        [tempChar updateStateWithDeltaTime:deltaTime andListOfGameObjects:listOfGameObjects];
    }
}

@end
