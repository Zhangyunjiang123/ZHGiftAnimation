//
//  ZHGiftAnimation.m
//  ZHGiftAnimation
//
//  Created by 张云江 on 2018/11/26.
//  Copyright © 2018年 张云江. All rights reserved.
//

#import "ZHGiftAnimation.h"

@interface ZHGiftAnimation()
{
    BOOL    _isstartComeOutAnimation;
}
@end

@implementation ZHGiftAnimation

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self creatUI];
    }
    return self;
}

- (void)creatUI
{
    CGFloat centerY = (50 - 36)/2;
    UIImageView *giftBg = [[UIImageView alloc]initWithFrame:CGRectMake(0, centerY, 200, 36)];
    giftBg.image = [self imagestretching:[UIImage imageNamed:@"LV_gift_effect_bg"] tensile:0.5];
    [self addSubview:giftBg];
    
    _avatarBtn = [[UIImageView alloc]initWithFrame:CGRectMake(3, (36 - 30)/2, 30, 30)];
    _avatarBtn.image = [UIImage imageNamed:@"avatar_role_guard"];
    _avatarBtn.layer.cornerRadius = 15;
    _avatarBtn.layer.masksToBounds = YES;
    [giftBg addSubview:_avatarBtn];
    
    _nicknameLabel = [[UILabel alloc]initWithFrame:CGRectMake(38, (36 - 12)/2, 48, 12)];
    _nicknameLabel.font = [UIFont systemFontOfSize:10];
    _nicknameLabel.textColor = [UIColor whiteColor];
    _nicknameLabel.textAlignment = NSTextAlignmentLeft;
    [giftBg addSubview:_nicknameLabel];
    
    _giftimage = [[UIImageView alloc]initWithFrame:CGRectMake(38 + 30, (36 - 134/2)/2, 134/2, 134/2)];
    [giftBg addSubview:_giftimage];
    
    x_image = [[UIImageView alloc]initWithFrame:CGRectMake(38 + 20 + 134/2, (36 - 11 - 5), 11, 11)];
    x_image.image = [UIImage imageNamed:@"LV_gift_effect_x"];
    [giftBg addSubview:x_image];
    
    tenthousand_image = [[UIImageView alloc]initWithFrame:CGRectMake(38 + 20 + 134/2 + 16, (36 - 20 - 5), 16, 20)];
    [giftBg addSubview:tenthousand_image];
    
    thousand_image = [[UIImageView alloc]initWithFrame:CGRectMake(38 + 20 + 134/2 + 16 * 2, (36 - 20 - 5), 16, 20)];
    [giftBg addSubview:thousand_image];
    
    hundred_image = [[UIImageView alloc]initWithFrame:CGRectMake(38 + 20 + 134/2 + 16 * 3, (36 - 20 - 5), 16, 20)];
    [giftBg addSubview:hundred_image];
    
    ten_image = [[UIImageView alloc]initWithFrame:CGRectMake(38 + 20 + 134/2 + 16 * 4, (36 - 20 - 5), 16, 20)];
    [giftBg addSubview:ten_image];
    
    bits_image = [[UIImageView alloc]initWithFrame:CGRectMake(38 + 20 + 134/2 + 16 * 5, (36 - 20 - 5), 16, 20)];
    [giftBg addSubview:bits_image];
}

- (void)message:(ZHMessageInfo *)info
{
    if (_messgaeInfo
        && (_messgaeInfo.togiftUid != info.togiftUid || _messgaeInfo.uid != info.uid)) {
        return;
    }
    if (!_messgaeInfo) {
        _isstartComeOutAnimation = NO;
        _messgaeInfo = info;
        _strId = [NSString stringWithFormat:@"%d-%d-%d",_messgaeInfo.uid,_messgaeInfo.togiftUid,_messgaeInfo.gid];
    } else {
        _isstartComeOutAnimation = YES;
        if (_messgaeInfo.gcount >= 100000) {
            _messgaeInfo.gcount = 0;
        }
        _messgaeInfo.gcount += info.gcount;
    }
    tenthousand_image.hidden = NO;
    thousand_image.hidden = NO;
    hundred_image.hidden = NO;
    ten_image.hidden = NO;
    bits_image.hidden = NO;
    if (_messgaeInfo.gcount > 9999) {
        tenthousand_image.image = [UIImage imageNamed:[NSString stringWithFormat:@"LV_gift_effect_%d",_messgaeInfo.gcount/10000]];
        thousand_image.image = [UIImage imageNamed:[NSString stringWithFormat:@"LV_gift_effect_%d",_messgaeInfo.gcount%10000/1000]];
        hundred_image.image = [UIImage imageNamed:[NSString stringWithFormat:@"LV_gift_effect_%d",_messgaeInfo.gcount%10000%1000/100]];
        ten_image.image = [UIImage imageNamed:[NSString stringWithFormat:@"LV_gift_effect_%d",_messgaeInfo.gcount%10000%1000%100/10]];
        bits_image.image = [UIImage imageNamed:[NSString stringWithFormat:@"LV_gift_effect_%d",_messgaeInfo.gcount%10000%1000%100%10]];
    } else if (_messgaeInfo.gcount > 999) {
        tenthousand_image.image = [UIImage imageNamed:[NSString stringWithFormat:@"LV_gift_effect_%d",_messgaeInfo.gcount/1000]];
        thousand_image.image = [UIImage imageNamed:[NSString stringWithFormat:@"LV_gift_effect_%d",_messgaeInfo.gcount%1000/100]];
        hundred_image.image = [UIImage imageNamed:[NSString stringWithFormat:@"LV_gift_effect_%d",_messgaeInfo.gcount%1000%100/10]];
        ten_image.image = [UIImage imageNamed:[NSString stringWithFormat:@"LV_gift_effect_%d",_messgaeInfo.gcount%1000%100%10]];
        bits_image.hidden = YES;
    } else if (_messgaeInfo.gcount > 99) {
        tenthousand_image.image = [UIImage imageNamed:[NSString stringWithFormat:@"LV_gift_effect_%d",_messgaeInfo.gcount/100]];
        thousand_image.image = [UIImage imageNamed:[NSString stringWithFormat:@"LV_gift_effect_%d",_messgaeInfo.gcount%100/10]];
        hundred_image.image = [UIImage imageNamed:[NSString stringWithFormat:@"LV_gift_effect_%d",_messgaeInfo.gcount%100%10]];
        ten_image.hidden = YES;
        bits_image.hidden = YES;
    } else if (_messgaeInfo.gcount > 9) {
        tenthousand_image.image = [UIImage imageNamed:[NSString stringWithFormat:@"LV_gift_effect_%d",_messgaeInfo.gcount/10]];
        thousand_image.image = [UIImage imageNamed:[NSString stringWithFormat:@"LV_gift_effect_%d",_messgaeInfo.gcount%10]];
        hundred_image.hidden = YES;
        ten_image.hidden = YES;
        bits_image.hidden = YES;
    } else {
        tenthousand_image.image = [UIImage imageNamed:[NSString stringWithFormat:@"LV_gift_effect_%d",_messgaeInfo.gcount]];
        thousand_image.hidden = YES;
        hundred_image.hidden = YES;
        ten_image.hidden = YES;
        bits_image.hidden = YES;
    }
    _giftimage.image = [UIImage imageNamed:[NSString stringWithFormat:@"detail_gift_%d",info.gid]];
    _nicknameLabel.text = [NSString stringWithFormat:@"%@送出",_messgaeInfo.userName];
    if (!_isstartComeOutAnimation) {
        [self startComeOutAnimation];
        _isstartComeOutAnimation = YES;
    } else {
        [self startNumberAnimation];
    }
    [self stopTimes];
    _times = [NSTimer scheduledTimerWithTimeInterval:5
                                              target:self
                                            selector:@selector(onTimeHide)
                                            userInfo:nil
                                             repeats:NO];
}

- (void)onTimeHide
{
    [self startExitAnimation];
}

- (void)stopTimes
{
    if (_times) {
        [_times invalidate];
        _times = nil;
    }
}

- (void)setAnumationFrame:(CGRect)rect
{
    [UIView animateWithDuration:.8 animations:^{
        [self setFrame:rect];
    } completion:^(BOOL finished) {
        
    }];
}

- (void)startExitAnimation
{
    CGPoint endPoint = CGPointMake(-self.center.x - 30, self.center.y);
    CABasicAnimation *animationgo2 = [CABasicAnimation animationWithKeyPath:@"position"];
    animationgo2.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    animationgo2.duration = 0.5;
    animationgo2.repeatCount = 1;
    animationgo2.delegate = self;
    animationgo2.removedOnCompletion = NO;
    animationgo2.fillMode = kCAFillModeForwards;
    animationgo2.beginTime = CACurrentMediaTime();
    animationgo2.fromValue = [NSValue valueWithCGPoint:self.center];
    animationgo2.toValue = [NSValue valueWithCGPoint:endPoint];
    [self.layer addAnimation:animationgo2 forKey:@"exitAnimation"];
}

- (void)startNumberAnimation
{
    CABasicAnimation *animationscale = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animationscale.duration = 0.3;
    animationscale.repeatCount = 1;
    animationscale.autoreverses = NO;
    animationscale.removedOnCompletion = YES;
    animationscale.fromValue = [NSNumber numberWithFloat:2];
    animationscale.toValue = [NSNumber numberWithFloat:1];
    [x_image.layer addAnimation:animationscale forKey:@"scale-layer"];
    [bits_image.layer addAnimation:animationscale forKey:@"scale-layer"];
    [ten_image.layer addAnimation:animationscale forKey:@"scale-layer"];
    [hundred_image.layer addAnimation:animationscale forKey:@"scale-layer"];
    [thousand_image.layer addAnimation:animationscale forKey:@"scale-layer"];
    [tenthousand_image.layer addAnimation:animationscale forKey:@"scale-layer"];
}

- (void)startComeOutAnimation
{
    CABasicAnimation *finishanimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    finishanimation.fromValue = [NSNumber numberWithFloat:0.0f];
    finishanimation.toValue = [NSNumber numberWithFloat:1.0f];
    finishanimation.autoreverses = NO;
    finishanimation.duration = 0.8;
    finishanimation.repeatCount = 1;
    finishanimation.delegate = self;
    finishanimation.beginTime = CACurrentMediaTime();
    finishanimation.removedOnCompletion = NO;
    finishanimation.fillMode = kCAFillModeForwards;
    finishanimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    [self.layer addAnimation:finishanimation forKey:@"opacity"];
    
    CGPoint startPoint = CGPointMake(self.center.x, self.center.y + self.frame.size.height);
    
    CABasicAnimation *animationgo = [CABasicAnimation animationWithKeyPath:@"position"];
    animationgo.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    animationgo.duration = 0.8;
    animationgo.repeatCount = 1;
    animationgo.delegate = self;
    animationgo.removedOnCompletion = NO;
    animationgo.fillMode = kCAFillModeForwards;
    animationgo.beginTime = CACurrentMediaTime();
    animationgo.fromValue = [NSValue valueWithCGPoint:startPoint];
    animationgo.toValue = [NSValue valueWithCGPoint:self.center];
    [self.layer addAnimation:animationgo forKey:@"position"];
}

#pragma mark - CAAnimationDelegate
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    if (anim == [self.layer animationForKey:@"opacity"]) {
        [self.layer removeAnimationForKey:@"opacity"];
        [self.layer removeAnimationForKey:@"position"];
    }
    if (anim == [self.layer animationForKey:@"exitAnimation"]) {
        [self.layer removeAnimationForKey:@"exitAnimation"];
        if (self.delegate && [self.delegate respondsToSelector:@selector(onZHGiftAnimationhide:)]) {
            [self.delegate onZHGiftAnimationhide:_strId];
        }
    }
}

- (UIImage *)imagestretching:(UIImage *)image tensile:(CGFloat)tensile
{
    NSInteger leftCapWidth = image.size.width * tensile;
    NSInteger topCapHeight = image.size.height * tensile;
    return [image stretchableImageWithLeftCapWidth:leftCapWidth topCapHeight:topCapHeight];
}
@end

