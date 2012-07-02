//
//  GameplayLayer.h
//  jiango
//
//  Created by Michael Gao on 6/28/12.
//  Copyright 2012 Calimucho. All rights reserved.
//

#import "cocos2d.h"
#import "Constants.h"
#import "CommonProtocols.h"
#import "Rocketship.h"


@interface GameplayLayer : CCLayer

@property (nonatomic, strong) Rocketship *rocketship;
@property (nonatomic, strong) CCSpriteBatchNode *gameplayBatchNode;
@property (nonatomic, strong) CCLabelTTF *scoreLabel;
@property int score;
@property (nonatomic, strong) CCProgressTimer *fundingTimer;

@end
