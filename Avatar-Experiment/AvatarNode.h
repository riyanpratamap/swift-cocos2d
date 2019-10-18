//
//  AvatarNode.h
//  students
//
//  Created by Wisnu Riyan on 17/09/19.
//  Copyright © 2019 Ruangguru. All rights reserved.
//

#import "cocos2d.h"
#import <spine/spine-cocos2d-objc.h>

NS_ASSUME_NONNULL_BEGIN

@interface AvatarNode : CCNode  {
    SkeletonAnimation *skeletonNode;
}

+ (CCScene*)sceneWithScale:(double)scale andSkins:(nullable NSArray*)skins;

@end

NS_ASSUME_NONNULL_END

