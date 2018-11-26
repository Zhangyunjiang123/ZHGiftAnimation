//
//  ZHGiftShow.m
//  ZHGiftAnimation
//
//  Created by 张云江 on 2018/11/26.
//  Copyright © 2018年 张云江. All rights reserved.
//

#import "ZHGiftShow.h"
#import "ZHGiftAnimation.h"

@interface ZHGiftShow() <ZHGiftAnimationDelegate>
{
    NSMutableArray *_viewArray;
    NSMutableArray *_cacheArray;
}
@end

@implementation ZHGiftShow

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
    _viewArray = [[NSMutableArray alloc] init];
}

- (void)message:(ZHMessageInfo *)info
{
    BOOL isView = NO;
    NSString *strId = [NSString stringWithFormat:@"%d-%d-%d",info.uid,info.togiftUid,info.gid];
    for (ZHGiftAnimation *view in _viewArray) {
        if ([strId isEqualToString:view.strId]) {
            [view message:info];
            isView = YES;
        }
    }
    if (isView == NO) {
        if (_viewArray.count >= 3) {
            if (!_cacheArray) {
                _cacheArray = [[NSMutableArray alloc]init];
            }
            [_cacheArray addObject:info];
        } else {
            ZHGiftAnimation *view = [[ZHGiftAnimation alloc]initWithFrame:CGRectMake(15, _viewArray.count * 50, 200, 50)];
            view.delegate = self;
            view.tag = _viewArray.count;
            [view message:info];
            [self addSubview:view];
            [_viewArray addObject:view];
        }
    }
    [self setFrame:CGRectMake(0, 320, 200, _viewArray.count * 50)];
}

#pragma mark - LVGiftAnimationDelegate
- (void)onZHGiftAnimationhide:(NSString *)strId
{
    int view_tag = 0;
    ZHGiftAnimation *viewAnimation;
    for (ZHGiftAnimation *view in _viewArray) {
        if ([strId isEqualToString:view.strId]) {
            view_tag = (int)view.tag;
            viewAnimation = view;
            [view removeFromSuperview];
        }
    }
    [_viewArray removeObject:viewAnimation];
    for (ZHGiftAnimation *view in _viewArray) {
        if (view.tag > view_tag) {
            view.tag = view.tag - 1;
        }
        [view setAnumationFrame:CGRectMake(15, view.tag * 50, 200, 50)];
    }
    if (_cacheArray.count > 0) {
        for (int i = 0; i < _cacheArray.count; i++) {
            ZHMessageInfo *info = _cacheArray[i];
            BOOL isView = NO;
            NSString *strId = [NSString stringWithFormat:@"%d-%d-%d",info.uid,info.togiftUid,info.gid];
            for (ZHGiftAnimation *view in _viewArray) {
                if ([strId isEqualToString:view.strId]) {
                    [view message:info];
                    [_cacheArray removeObject:info];
                    isView = YES;
                }
            }
            if (isView == NO) {
                if (_viewArray.count >= 3) {
                    continue ;
                } else {
                    ZHGiftAnimation *view = [[ZHGiftAnimation alloc]initWithFrame:CGRectMake(15, _viewArray.count * 50, 200, 50)];
                    view.delegate = self;
                    view.tag = _viewArray.count;
                    [view message:info];
                    [self addSubview:view];
                    [_viewArray addObject:view];
                    [_cacheArray removeObject:info];
                    [self setFrame:CGRectMake(0, 320, 200, _viewArray.count * 50)];
                }
            }
        }
    }
}
@end
