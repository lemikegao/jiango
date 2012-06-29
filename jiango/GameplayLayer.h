//
//  GameplayLayer.h
//  jiango
//
//  Created by Michael Gao on 6/28/12.
//  Copyright 2012 Calimucho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "HelloWorldLayer.h"

@interface GameplayLayer : CCLayer <ControlsDelegate>  {
    CCSprite *andySprite;
    ControlDirection andyDirection;
}

@end
