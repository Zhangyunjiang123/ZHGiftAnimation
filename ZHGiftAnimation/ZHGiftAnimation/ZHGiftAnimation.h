//
//  ZHGiftAnimation.h
//  ZHGiftAnimation
//
//  Created by 张云江 on 2018/11/26.
//  Copyright © 2018年 张云江. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZHMessageInfo.h"

NS_ASSUME_NONNULL_BEGIN

@protocol ZHGiftAnimationDelegate <NSObject>

@optional

- (void)onZHGiftAnimationhide:(NSString *)strId;

@end

@interface ZHGiftAnimation : UIView <CAAnimationDelegate>
{
    NSTimer     *_times;
    
    UIImageView *_giftimage;
    UIImageView *tenthousand_image;
    UIImageView *thousand_image;
    UIImageView *hundred_image;
    UIImageView *ten_image;
    UIImageView *bits_image;
    UIImageView *x_image;
    UIImageView *_avatarBtn;
    
    ZHMessageInfo   *_messgaeInfo;
}
@property(nonatomic,weak) id <ZHGiftAnimationDelegate> delegate;

@property(nonatomic,copy) NSString         *strId;//识别id
@property(nonatomic,strong) UILabel        *nicknameLabel;//用户昵称

- (void)message:(ZHMessageInfo *)info;
- (void)setAnumationFrame:(CGRect)rect;

@end

NS_ASSUME_NONNULL_END
