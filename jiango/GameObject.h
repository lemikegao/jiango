//
//  GameObject.h
//  jiango
//
//  Created by Michael Gao on 6/30/12.
//  Copyright 2012 Calimucho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Constants.h"
#import "CommonProtocols.h"

@interface GameObject : CCSprite

@property BOOL isActive;
@property BOOL reactsToScreenBoundaries;
@property CGSize screenSize;
@property GameObjectType gameObjectType;

-(void)changeState:(CharacterStates)newState;
-(void)updateStateWithDeltaTime:(ccTime)deltaTime andListOfGameObjects:(CCArray*)listOfGameObjects;
-(CGRect)adjustedBoundingBox;
-(CCAnimation*)loadPlistForAnimationWithName:(NSString*)animationName andClassName:(NSString*)className;

@end
