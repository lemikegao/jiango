//
//  CommonProtocols.h
//  jiango
//
//  Created by Michael Gao on 6/30/12.
//  Copyright (c) 2012 Calimucho. All rights reserved.
//

typedef enum {
//    kStateSpawning,
    kStateIdle,
    kStateMovingStraight,
    kStateRotatingLeft,
    kStateRotatingRight,
    kStateRotatingLeftAndMovingStraight,
    kStateRotatingRightAndMovingStraight,
    kStateAttacking,
    kStateTakingDamage,
    kStateDead
} CharacterStates;

//typedef enum {
//    kMovementNone,
//    kMoveStraight,
//    kRotateLeft,
//    kRotateRight
//} RocketshipMovement;

typedef enum {
    kObjectTypeNone,
    kRocketshipType
} GameObjectType;

@protocol GameplayLayerDelegate
-(void)createObjectOfType:(GameObjectType)objectType
               withHealth:(int)initialHealth
               atLocation:(CGPoint)spawnLocation
               withZValue:(int)ZValue;

@end