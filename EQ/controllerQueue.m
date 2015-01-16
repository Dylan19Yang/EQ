//
//  controllerQueue.m
//  EQ
//
//  Created by YangYuxin on 15/1/15.
//  Copyright (c) 2015年 YYX. All rights reserved.
//

#import "controllerQueue.h"
#import "cellQueue.h"
#import "UIImageView+AFNetworking.h"


@interface controllerQueue ()
{
    NSMutableArray* mallInfo;
}

@end

@implementation controllerQueue

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    mallInfo=[[NSMutableArray alloc] init];
    mallInfo=[API sharedInstance].mallInfo;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return mallInfo.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *TableSampleIdentifier = @"cellqueue";
    UINib* nib = [UINib nibWithNibName:@"cellQueue" bundle:Nil];
    [tableView registerNib:nib forCellReuseIdentifier:TableSampleIdentifier];
    cellQueue *cell = [tableView dequeueReusableCellWithIdentifier:
                          TableSampleIdentifier];
    if (cell == nil) {
        cell = [[cellQueue alloc]
                initWithStyle:UITableViewCellStyleValue1
                reuseIdentifier:TableSampleIdentifier];
    }
    NSMutableArray* temp=mallInfo[indexPath.row];
    cell.labelName.text=temp[3];
    cell.labelInfo.text=temp[5];
    NSString* tempURL=[NSString stringWithFormat:@"http://%@:9993/%@",[API sharedInstance].IP,temp[4]];
    [cell.picRes setImageWithURL:[NSURL URLWithString:tempURL]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
@end
