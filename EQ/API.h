//
//  API.h
//  EQ
//
//  Created by YangYuxin on 15/1/15.
//  Copyright (c) 2015年 YYX. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol apiDelegate <NSObject>

@optional
-(void)getResInfoSuccess;
-(void)loginSuccess;
-(void)addQueueSuccess;

@end





@interface API : NSObject

@property(strong,nonatomic) NSMutableArray *mallInfo;
@property(strong,nonatomic) NSMutableDictionary *selfInfo;
@property(strong,nonatomic) NSMutableDictionary *queueInfo;
@property(strong,nonatomic) NSString* IP;
@property(nonatomic) BOOL isLogin;

+ (API*) sharedInstance;
-(int)getResInfo:(NSString *)mallId;
-(int)getResNoice:(NSString *)resId;
-(int)getResMenu:(NSString *)resId;
-(int)reg:(NSString* )phoneNumber :(NSString*)pwd :(NSString*)name :(NSString*)gender;
-(int)login:(NSString* )phoneNumber :(NSString*)pwd;
-(int)addQueue:(NSString*)cusId :(NSString*)resId :(NSString*)type;

@property(nonatomic,assign) id<apiDelegate> delegate;
@end
