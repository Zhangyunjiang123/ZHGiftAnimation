//
//  ViewController.m
//  ZHGiftAnimation
//
//  Created by 张云江 on 2018/11/26.
//  Copyright © 2018年 张云江. All rights reserved.
//

#import "ViewController.h"
#import "ZHMessageInfo.h"
#import "ZHGiftShow.h"

@interface ViewController ()
{
    ZHGiftShow *_giftShow;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _giftShow = [[ZHGiftShow alloc] initWithFrame:CGRectMake(0, 320, 200, 0)];
    [self.view addSubview:_giftShow];
    
    [self sendMessage];
    [self sendMessage1];
    [self sendMessage2];
    
    [NSTimer scheduledTimerWithTimeInterval:0.5
                                     target:self
                                   selector:@selector(sendMessage)
                                   userInfo:nil
                                    repeats:YES];
    
    [NSTimer scheduledTimerWithTimeInterval:6
                                     target:self
                                   selector:@selector(sendMessage1)
                                   userInfo:nil
                                    repeats:YES];
    
    [NSTimer scheduledTimerWithTimeInterval:8
                                     target:self
                                   selector:@selector(sendMessage2)
                                   userInfo:nil
                                    repeats:YES];
    
    [NSTimer scheduledTimerWithTimeInterval:10
                                     target:self
                                   selector:@selector(sendMessage2)
                                   userInfo:nil
                                    repeats:YES];
    
    [NSTimer scheduledTimerWithTimeInterval:12
                                     target:self
                                   selector:@selector(sendMessage1)
                                   userInfo:nil
                                    repeats:YES];
}

- (void)sendMessage
{
    ZHMessageInfo *messageinfo = [[ZHMessageInfo alloc] init];
    messageinfo.uid = 111111;
    messageinfo.userName = @"大佬";
    messageinfo.gid = 20001;
    messageinfo.togiftUid = 222222;
    messageinfo.gcount = 1;
    [_giftShow message:messageinfo];
}

- (void)sendMessage1
{
    ZHMessageInfo *messageinfo = [[ZHMessageInfo alloc] init];
    messageinfo.uid = 111112;
    messageinfo.userName = @"大佬2";
    messageinfo.gid = 20007;
    messageinfo.togiftUid = 222222;
    messageinfo.gcount = 1;
    [_giftShow message:messageinfo];
}

- (void)sendMessage2
{
    ZHMessageInfo *messageinfo = [[ZHMessageInfo alloc] init];
    messageinfo.uid = 111113;
    messageinfo.userName = @"大佬2";
    messageinfo.gid = 20009;
    messageinfo.togiftUid = 222222;
    messageinfo.gcount = 1;
    [_giftShow message:messageinfo];
}
@end
