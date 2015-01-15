//
//  API.h
//  EQ
//
//  Created by YangYuxin on 15/1/15.
//  Copyright (c) 2015年 YYX. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface API : NSObject
+ (API*) sharedInstance;
-(int)getResInfo:(NSString *)mallId;
-(int)getResNoice:(NSString *)resId;
-(int)getResMenu:(NSString *)resId;
@end
