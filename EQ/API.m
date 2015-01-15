//
//  API.m
//  EQ
//
//  Created by YangYuxin on 15/1/15.
//  Copyright (c) 2015年 YYX. All rights reserved.
//

#import "API.h"
#import <AFHTTPRequestOperation.h>
#import <AFHTTPRequestOperationManager.h>

static API* _sharedInstance = nil;

@implementation API

//单例
+ (API*) sharedInstance{
    if (_sharedInstance == nil) {
        _sharedInstance = [[API alloc] init];
    }
    return _sharedInstance;
}

//通过商场id获取餐厅信息
-(int)getResInfo:(NSString *)mallId
{
    NSString * URLtemp=@"http://192.168.1.101:9993/ClientRequest/getResInfo.php?";
    URLtemp =[URLtemp stringByAppendingString:[NSString stringWithFormat:@"mall_id=%@",mallId]];
    URLtemp =[URLtemp stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString: URLtemp]];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"Success: %@", operation.responseString);
        
        NSString *requestTmp = [NSString stringWithString:operation.responseString];
        NSData *resData = [[NSData alloc] initWithData:[requestTmp dataUsingEncoding:NSUTF8StringEncoding]];
        NSDictionary *resultDic = [NSJSONSerialization JSONObjectWithData:resData options:NSJSONReadingMutableLeaves error:nil];
        NSMutableArray * res=[resultDic mutableCopy];;
        NSLog(@"%@",res);


        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Failure: %@", error);
        
    }];
    
    [operation start];
    
    return 0;
}

//通过餐厅id获取餐厅公告
-(int)getResNoice:(NSString *)resId
{
    NSString * URLtemp=@"http://192.168.1.101:9993/ClientRequest/getMenu.php?";
    URLtemp =[URLtemp stringByAppendingString:[NSString stringWithFormat:@"mall_id=%@",resId]];
    URLtemp =[URLtemp stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString: URLtemp]];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"Success: %@", operation.responseString);
        
        NSString *requestTmp = [NSString stringWithString:operation.responseString];
        NSData *resData = [[NSData alloc] initWithData:[requestTmp dataUsingEncoding:NSUTF8StringEncoding]];
        NSDictionary *resultDic = [NSJSONSerialization JSONObjectWithData:resData options:NSJSONReadingMutableLeaves error:nil];
        NSLog(@"%@",resultDic);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Failure: %@", error);
        
    }];
    
    [operation start];
    
    return 0;
}

//通过餐厅id获取餐厅菜单
-(int)getResMenu:(NSString *)resId
{
    NSString * URLtemp=@"http://192.168.1.101:9993/ClientRequest/getNotice.php?";
    URLtemp =[URLtemp stringByAppendingString:[NSString stringWithFormat:@"mall_id=%@",resId]];
    URLtemp =[URLtemp stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString: URLtemp]];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"Success: %@", operation.responseString);
        
        NSString *requestTmp = [NSString stringWithString:operation.responseString];
        NSData *resData = [[NSData alloc] initWithData:[requestTmp dataUsingEncoding:NSUTF8StringEncoding]];
        NSDictionary *resultDic = [NSJSONSerialization JSONObjectWithData:resData options:NSJSONReadingMutableLeaves error:nil];
        NSLog(@"%@",resultDic);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Failure: %@", error);
        
    }];
    
    [operation start];
    
    return 0;
}

@end
