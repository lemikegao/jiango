//
//  GameScene.m
//  jiango
//
//  Created by Michael Gao on 6/28/12.
//  Copyright 2012 Calimucho. All rights reserved.
//

#import "GameScene.h"
#import "BackgroundLayer.h"
#import "GameplayLayer.h"


@implementation GameScene

-(id)init {
    self = [super init];
    if (self != nil) {
        // Background Layer
        BackgroundLayer *backgroundLayer = [BackgroundLayer node];
        [self addChild:backgroundLayer z:0];
        
        // Gameplay Layer
        GameplayLayer *gameplayLayer = [GameplayLayer node];
        backgroundLayer.controlsDelegate = gameplayLayer.rocketship;
        [self addChild:gameplayLayer z:5];
    }
    return self;
}

@end
