//
//  BackgroundLayer.h
//  jiango
//
//  Created by Michael Gao on 6/28/12.
//  Copyright Calimucho 2012. All rights reserved.
//

#import "cocos2d.h"
#import "iCadeReaderView.h"
#import "Constants.h"
#import "CommonProtocols.h"

@protocol ControlsDelegate

-(void)changeState:(CharacterStates)newState;
-(CharacterStates)getDelegateState;

@end


@interface BackgroundLayer : CCLayer <iCadeEventDelegate>

@property (nonatomic, strong) CCParallaxNode *backgroundNode;
@property (nonatomic, strong) CCSprite *bgStars;
@property (nonatomic, strong) CCSprite *bgStars2;
@property (nonatomic, strong) CCProgressTimer *fuel;
@property (nonatomic, strong) id <ControlsDelegate> controlsDelegate;

@end
