//
//  cellQueue.h
//  EQ
//
//  Created by YangYuxin on 15/1/16.
//  Copyright (c) 2015年 YYX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface cellQueue : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *picRes;
@property (weak, nonatomic) IBOutlet UILabel *labelName;
@property (weak, nonatomic) IBOutlet UILabel *labelInfo;
- (IBAction)queue:(id)sender;
- (IBAction)order:(id)sender;

@end
