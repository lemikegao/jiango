//
//  HelloWorldLayer.h
//  jiango
//
//  Created by Michael Gao on 6/28/12.
//  Copyright Calimucho 2012. All rights reserved.
//


#import <GameKit/GameKit.h>

// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"
#import "iCadeReaderView.h"

typedef enum {
    kDirectionLeft,
    kDirectionUp,
    kDirectionRight,
    kDirectionDown,
    kDirectionNone
} ControlDirection;

@protocol ControlsDelegate

-(void)changeAndyDirection:(ControlDirection)direction;

@end


// HelloWorldLayer
@interface HelloWorldLayer : CCLayer <GKAchievementViewControllerDelegate, GKLeaderboardViewControllerDelegate, iCadeEventDelegate>
{
    id <ControlsDelegate> delegate;
}

@property (nonatomic, strong) id <ControlsDelegate> delegate;
// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

@end
