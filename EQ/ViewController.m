//
//  ViewController.m
//  EQ
//
//  Created by YangYuxin on 14/12/29.
//  Copyright (c) 2014年 YYX. All rights reserved.
//

#import "ViewController.h"
#import "CellLogin.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *TableSampleIdentifier = @"celllogin";
    UINib* nib = [UINib nibWithNibName:@"CellLogin" bundle:Nil];
    [tableView registerNib:nib forCellReuseIdentifier:TableSampleIdentifier];
    CellLogin *cell = [tableView dequeueReusableCellWithIdentifier:
                          TableSampleIdentifier];
        cell = [[CellLogin alloc]
                initWithStyle:UITableViewCellStyleValue1
                reuseIdentifier:TableSampleIdentifier];    
    
    return cell;
}

@end
