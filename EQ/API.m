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
UIAlertView* publicAlert;

@implementation API

//单例
+ (API*) sharedInstance{
    if (_sharedInstance == nil) {
        _sharedInstance = [[API alloc] init];
        _sharedInstance.IP=@"172.13.0.50";
        _sharedInstance.isLogin=false;
    }
    return _sharedInstance;
}

//通过商场id获取餐厅信息
-(int)getResInfo:(NSString *)mallId
{
    NSString * URLtemp=[NSString stringWithFormat:@"http://%@:9993/ClientRequest/getResInfo.php?",self.IP];
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
        self.mallInfo=[resultDic mutableCopy];
        
        for(int i=0;i<self.mallInfo.count;i++)
        {
            NSMutableArray* temp=self.mallInfo[i];
            for(int j=0;j<temp.count;j++)
            {
                NSLog(@"%@",temp[j]);
            }
        }
        
        [self.delegate getResInfoSuccess];


        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Failure: %@", error);
        
    }];
    
    [operation start];
    
    return 0;
}

//通过餐厅id获取餐厅公告
-(int)getResNoice:(NSString *)resId
{
    NSString * URLtemp=[NSString stringWithFormat:@"http://%@:9993/ClientRequest/getMenu.php?",self.IP];
    URLtemp =[URLtemp stringByAppendingString:[NSString stringWithFormat:@"res_id=%@",resId]];
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
    NSString * URLtemp=[NSString stringWithFormat:@"http://%@:9993/ClientRequest/getNotice.php?",self.IP];
    URLtemp =[URLtemp stringByAppendingString:[NSString stringWithFormat:@"res_id=%@",resId]];
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

-(int)reg:(NSString* )phoneNumber :(NSString*)pwd :(NSString*)name :(NSString*)gender
{
    publicAlert=[[UIAlertView alloc] initWithTitle:nil message:@"请稍候" delegate:self cancelButtonTitle:nil otherButtonTitles: nil];
    [publicAlert show];
    NSString * URLtemp=[NSString stringWithFormat:@"http://%@:9993/ClientRequest/register.php?",self.IP];
    URLtemp =[URLtemp stringByAppendingString:[NSString stringWithFormat:@"customer_phone_number=%@",phoneNumber]];
    URLtemp =[URLtemp stringByAppendingString:[NSString stringWithFormat:@"&customer_password=%@",pwd]];
    URLtemp =[URLtemp stringByAppendingString:[NSString stringWithFormat:@"&customer_name=%@",name]];
    URLtemp =[URLtemp stringByAppendingString:[NSString stringWithFormat:@"&customer_gender=%@",gender]];
    URLtemp =[URLtemp stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString: URLtemp]];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"Success: %@", operation.responseString);
        
        [publicAlert dismissWithClickedButtonIndex:0 animated:YES];
        
        NSString *requestTmp = [NSString stringWithString:operation.responseString];
        NSData *resData = [[NSData alloc] initWithData:[requestTmp dataUsingEncoding:NSUTF8StringEncoding]];
        NSDictionary *resultDic = [NSJSONSerialization JSONObjectWithData:resData options:NSJSONReadingMutableLeaves error:nil];
        self.selfInfo=[resultDic mutableCopy];
        NSLog(@"%@",self.selfInfo);
        NSString* sta=[self.selfInfo valueForKey:@"state"];
        if ([sta isEqualToString:@"0"]) {
            publicAlert=[[UIAlertView alloc] initWithTitle:nil message:@"用户名已存在" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [publicAlert show];

        }
        else if([sta isEqualToString:@"1"])
        {
            self.isLogin=true;
            [self.delegate loginSuccess];
        }
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Failure: %@", error);
        
    }];
    
    [operation start];
    
    return 0;

}

-(int)login:(NSString* )phoneNumber :(NSString*)pwd
{
    publicAlert=[[UIAlertView alloc] initWithTitle:nil message:@"请稍候" delegate:self cancelButtonTitle:nil otherButtonTitles: nil];
    [publicAlert show];
    NSString * URLtemp=[NSString stringWithFormat:@"http://%@:9993/ClientRequest/login.php?",self.IP];
    URLtemp =[URLtemp stringByAppendingString:[NSString stringWithFormat:@"customer_phone_number=%@",phoneNumber]];
    URLtemp =[URLtemp stringByAppendingString:[NSString stringWithFormat:@"&customer_password=%@",pwd]];
    URLtemp =[URLtemp stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString: URLtemp]];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"Success: %@", operation.responseString);
        
        [publicAlert dismissWithClickedButtonIndex:0 animated:YES];
        
        NSString *requestTmp = [NSString stringWithString:operation.responseString];
        NSData *resData = [[NSData alloc] initWithData:[requestTmp dataUsingEncoding:NSUTF8StringEncoding]];
        NSDictionary *resultDic = [NSJSONSerialization JSONObjectWithData:resData options:NSJSONReadingMutableLeaves error:nil];
        self.selfInfo=[resultDic mutableCopy];
        NSLog(@"%@",self.selfInfo);
        NSString* sta=[self.selfInfo valueForKey:@"state"];
        if ([sta isEqualToString:@"00"]) {
            publicAlert=[[UIAlertView alloc] initWithTitle:nil message:@"用户名不存在" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [publicAlert show];
            
        }
        else if([sta isEqualToString:@"10"])
        {
            publicAlert=[[UIAlertView alloc] initWithTitle:nil message:@"密码错误" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [publicAlert show];
        }
        else if([sta isEqualToString:@"11"])
        {
            [self.delegate loginSuccess];
        }
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Failure: %@", error);
        
    }];
    
    [operation start];
    
    return 0;
    
}

-(int)addQueue:(NSString*)cusId :(NSString*)resId :(NSString*)type
{
    publicAlert=[[UIAlertView alloc] initWithTitle:nil message:@"请稍候" delegate:self cancelButtonTitle:nil otherButtonTitles: nil];
    [publicAlert show];
    NSString * URLtemp=[NSString stringWithFormat:@"http://%@:9993/ClientRequest/queueing_add.php?",self.IP];
    URLtemp =[URLtemp stringByAppendingString:[NSString stringWithFormat:@"customer_id=%@",cusId]];
    URLtemp =[URLtemp stringByAppendingString:[NSString stringWithFormat:@"&res_id=%@",resId]];
    URLtemp =[URLtemp stringByAppendingString:[NSString stringWithFormat:@"&table_type=%@",type]];
    URLtemp =[URLtemp stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString: URLtemp]];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"Success: %@", operation.responseString);
        
        [publicAlert dismissWithClickedButtonIndex:0 animated:YES];
        
        NSString *requestTmp = [NSString stringWithString:operation.responseString];
        NSData *resData = [[NSData alloc] initWithData:[requestTmp dataUsingEncoding:NSUTF8StringEncoding]];
        NSDictionary *resultDic = [NSJSONSerialization JSONObjectWithData:resData options:NSJSONReadingMutableLeaves error:nil];
        self.queueInfo=[resultDic mutableCopy];
        NSLog(@"%@",self.selfInfo);
        NSString* sta=[self.selfInfo valueForKey:@"state"];
        if ([sta isEqualToString:@"1"]) {
            [self.delegate addQueueSuccess];
            
        }
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Failure: %@", error);
        
    }];
    
    [operation start];
    
    return 0;

}

@end
