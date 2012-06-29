//
//  MyCocos2DClass.m
//  jiango
//
//  Created by Michael Gao on 6/28/12.
//  Copyright 2012 Calimucho. All rights reserved.
//

#import "GameScene.h"


@implementation GameScene

-(id)init {
    self = [super init];
    if (self != nil) {
        // Background Layer
        HelloWorldLayer *backgroundLayer = [HelloWorldLayer node]; // 1
        // Gameplay Layer
        GameplayLayer *gameplayLayer = [GameplayLayer node];       // 3
        backgroundLayer.delegate = gameplayLayer;
        
        [self addChild:backgroundLayer z:0];                       // 2
        [self addChild:gameplayLayer z:5];                         // 4
    }
    return self;
}

@end
