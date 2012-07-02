//
//  Rocketship.h
//  jiango
//
//  Created by Michael Gao on 6/30/12.
//  Copyright 2012 Calimucho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameCharacter.h"
#import "BackgroundLayer.h"

@interface Rocketship : GameCharacter <ControlsDelegate>

@property (nonatomic, strong) CCSpriteFrame *idleFrame;
@property (nonatomic, strong) CCAnimation *movingStraightAnim;
@property (nonatomic, strong) CCAnimation *rotatingLeftAndMovingStraightAnim;
@property (nonatomic, strong) CCAnimation *rotatingRightAndMovingStraightAnim;

@end
