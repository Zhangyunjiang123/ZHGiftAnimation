//
//  ZHMessageInfo.h
//  ZHGiftAnimation
//
//  Created by 张云江 on 2018/11/26.
//  Copyright © 2018年 张云江. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZHMessageInfo : NSObject

@property(nonatomic,assign)int           uid;          //发送消息的玩家
@property(nonatomic,assign)int           gid;          //礼物id
@property(nonatomic,assign)int           gcount;       //礼物数量
@property(nonatomic,assign)int           togiftUid;    //送礼送给的玩家
@property(nonatomic,copy)NSString        *userName;    //发送消息的玩家

@end

NS_ASSUME_NONNULL_END
