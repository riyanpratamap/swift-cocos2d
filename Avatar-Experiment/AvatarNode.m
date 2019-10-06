//
//  AvatarNode.m
//  students
//
//  Created by Wisnu Riyan on 17/09/19.
//  Copyright © 2019 Ruangguru. All rights reserved.
//

#import "AvatarNode.h"
#import <spine/extension.h>
#import "Avatar_Experiment-Swift.h"

@implementation AvatarNode

-(id) init {
    self = [super init];
    if (!self) return nil;
    
    return self;
}

+ (CCScene*)sceneWithScale:(double)scale withAtlases:(NSArray*)atlases andSkins:(nullable NSArray*)skins {
    return [[AvatarNode alloc] initWithAtlases:atlases withScale:scale andSkin:skins];
}

- (id)initWithAtlases:(NSArray*)atlases withScale:(double)scale andSkin:(NSArray*)skins {
    self = [super init];
    if (!self) return nil;
    
    // load your skeleton atlas here
    spAtlas *arrayOfAtlas[] = {};
    int i;
    for (i=0; i<atlases.count; i++) {
        arrayOfAtlas[i] = spAtlas_createFromFile([atlases[i] UTF8String], 0);
    }
    spRGAtlasAttachmentLoader *attachmentLoader = spRGAtlasAttachmentLoader_create(arrayOfAtlas, 2);
    
    // Your atlases has been loaded. Now create your skin
    
    // create your skeleton json here
    spSkeletonJson *myJson = spSkeletonJson_createWithLoader(SUPER(attachmentLoader));
    myJson->scale = scale;
    
    // create your skeletonData here
    spSkeletonData* skeletonData = spSkeletonJson_readSkeletonDataFile(myJson, [@"skeleton_17d.json" UTF8String]);
    
    NSString *faceSkin = @"face_basic_male";
    NSString *colorSkin = @"skin_light_male";
    NSString *hairSkin = @"hair_hat_mask_basicshort_m";
    NSString *topSkin = @"top_short_basic_m";
    NSString *bottomSkin = @"bottom_long_basic_m";
    NSString *shoesSkin = @"shoes_socks";
    
    NSNumber *sex = [NSNumber numberWithInt:1];
    if (sex == [NSNumber numberWithInt:2]) {
        faceSkin = @"face_basic_female";
        topSkin = @"top_short_basic_f";
        bottomSkin = @"bottom_skirt";
    }
    // (sex == 0 / sex == 1)
    else {
        faceSkin = @"face_basic_male";
        topSkin = @"top_short_basic_m";
        bottomSkin = @"bottom_short";
    }
    
    NSNumber *skinTone = [NSNumber numberWithInt:1];
    if ([skinTone isEqualToNumber:[NSNumber numberWithInt:0]]) {
        colorSkin = ([sex isEqualToNumber:[NSNumber numberWithInt:1]]) ? @"skin_light_male" : @"skin_light_female";
    }
    else if ([skinTone isEqualToNumber:[NSNumber numberWithInt:1]]) {
        colorSkin = ([sex isEqualToNumber:[NSNumber numberWithInt:1]]) ? @"skin_yellow_male" : @"skin_yellow_female";
    }
    // skinTone == 2
    else {
        colorSkin = ([sex isEqualToNumber:[NSNumber numberWithInt:1]]) ? @"skin_brown_male" : @"skin_brown_female";
    }
    
    NSNumber *hairType = [NSNumber numberWithInt:1];
    if ([hairType isEqualToNumber:[NSNumber numberWithInt:0]]) {
        hairSkin = ([sex isEqualToNumber:[NSNumber numberWithInt:1]]) ? @"hair_hat_mask_basicshort_m" : @"hair_hat_mask_basicshort_f";
    }
    else if ([hairType isEqualToNumber:[NSNumber numberWithInt:1]]) {
        hairSkin = ([sex isEqualToNumber:[NSNumber numberWithInt:1]]) ? @"hair_hat_mask_basicnormal_m" : @"hair_hat_mask_basicnormal_f";
    }
    // hairType == 2
    else {
        hairSkin = ([sex isEqualToNumber:[NSNumber numberWithInt:1]]) ? @"hair_hat_mask_basiclong_m" : @"hair_hat_mask_basiclong_f";
    }
    
    // iterate trough input array of skins
    for (PairOfSkin *data in skins) {
        if ([[data getType] isEqualToString:[AvatarSkinTypeEnum Face]]) {
            faceSkin = [data getSkin];
        } else if ([[data getType] isEqualToString:[AvatarSkinTypeEnum SkinColor]]) {
            colorSkin = [data getSkin];
        } else if ([[data getType] isEqualToString:[AvatarSkinTypeEnum HairType]]) {
            hairSkin = [data getSkin];
        } else if ([[data getType] isEqualToString:[AvatarSkinTypeEnum Top]]) {
            topSkin = [data getSkin];
        } else if ([[data getType] isEqualToString:[AvatarSkinTypeEnum Bottom]]) {
            bottomSkin = [data getSkin];
        } else if ([[data getType] isEqualToString:[AvatarSkinTypeEnum Shoes]]) {
            shoesSkin = [data getSkin];
        } else {
            NSLog(@"Cannot recognize skin type");
        }
    }
    
    NSMutableArray *groupedSkins = [[NSMutableArray alloc] init];
    [groupedSkins addObject:faceSkin];
    [groupedSkins addObject:colorSkin];
    [groupedSkins addObject:hairSkin];
    [groupedSkins addObject:topSkin];
    [groupedSkins addObject:bottomSkin];
    [groupedSkins addObject:shoesSkin];
    // watch out! Your new skin should be attached here, it's a PairOfSkin object
    
    // get your multiple atlases, iterate, and create skin in each atlas
    skeletonNode = [SkeletonAnimation skeletonWithData:skeletonData ownsSkeletonData:TRUE arrayOfSkin:groupedSkins];
    
    // add your animation here
    [skeletonNode setAnimationForTrack:0 name:@"idle_02" loop:YES];
    
    CGSize windowSize = [[CCDirector sharedDirector] viewSize];
    CCSprite *background = [CCSprite spriteWithImageNamed:@"icCreateAvatarBackground"];
    [background setTextureRect:CGRectMake(0, 0, windowSize.width, windowSize.height)];
    [background setAnchorPoint:ccp(0,0)];
    [self addChild:background];
    
    [skeletonNode setPosition:ccp(windowSize.width / 2, 24)];
    [self addChild:skeletonNode];
    
    self.userInteractionEnabled = YES;
    self.contentSize = windowSize;
    
    return self;
}

@end
