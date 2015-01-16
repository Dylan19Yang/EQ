//
//  controllerMyQueue.m
//  EQ
//
//  Created by YangYuxin on 15/1/16.
//  Copyright (c) 2015年 YYX. All rights reserved.
//

#import "controllerMyQueue.h"
#import "CellMyQueue.h"

@interface controllerMyQueue ()

@end

@implementation controllerMyQueue

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (IBAction)buttonRefresh:(id)sender {
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [API sharedInstance].nowQueueArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *TableSampleIdentifier = @"cellmyqueue";
    UINib* nib = [UINib nibWithNibName:@"cellMyQueue" bundle:Nil];
    [tableView registerNib:nib forCellReuseIdentifier:TableSampleIdentifier];
    CellMyQueue *cell = [tableView dequeueReusableCellWithIdentifier:
                       TableSampleIdentifier];
    if (cell == nil) {
        cell = [[CellMyQueue alloc]
                initWithStyle:UITableViewCellStyleValue1
                reuseIdentifier:TableSampleIdentifier];
    }
    NSMutableDictionary* tempnow=([API sharedInstance].nowQueueArray)[indexPath.row];
    NSMutableDictionary* temp=([API sharedInstance].queueArray)[indexPath.row];
    NSString* resid=[temp valueForKey:@"res_id"];
    NSMutableArray* res=[[NSMutableArray alloc] init];
    NSMutableArray* mall=[API sharedInstance].mallInfo;
    for (int i=0; i<mall.count; i++) {
        if(mall[i][0]==resid)
            res=mall[i];
    }
    cell.labelName.text=[temp valueForKey:@"name"];
    cell.labelNumber.text=[temp valueForKey:@"max"];
    int num=[[tempnow valueForKey:@"min"] intValue]-[[tempnow valueForKey:@"min"] intValue];
    NSString* mes;
    if (num==0) {
        mes=@"您为当前第一位，请立即赶往餐厅。";
    }
    else if(num<5)
    {
        NSString* time;
        if ([[temp valueForKey:@"table_type"] isEqual:@"2"]) {
            time=res[15];
        }
        else if ([[temp valueForKey:@"table_type"] isEqual:@"4"]) {
            time=res[16];
        }
        else if ([[temp valueForKey:@"table_type"] isEqual:@"6"]) {
            time=res[17];
        }
        else if ([[temp valueForKey:@"table_type"] isEqual:@"8"]) {
            time=res[18];
        }
        NSInteger* pos=num*[time intValue];
        mes=[NSString stringWithFormat:@"%d分钟",pos];
    }
    return cell;
    
}
@end
