//
//  GameCharacter.h
//  jiango
//
//  Created by Michael Gao on 6/30/12.
//  Copyright 2012 Calimucho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameObject.h"

@interface GameCharacter : GameObject

@property int characterHealth;
@property CharacterStates characterState;

-(void)checkAndClampSpritePosition;

@end
