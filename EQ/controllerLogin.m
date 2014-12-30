//
//  controllerLogin.m
//  EQ
//
//  Created by YangYuxin on 14/12/30.
//  Copyright (c) 2014年 YYX. All rights reserved.
//

#import "controllerLogin.h"

@interface controllerLogin ()

@end

@implementation controllerLogin

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.viewPhoneTrue.hidden=true;
    self.viewPwdTrue.hidden=true;
    self.buttonLoginTrue.hidden=true;
    self.buttonRegTrue.hidden=true;
    [self.textPhone setValue:[UIColor grayColor] forKeyPath:@"_placeholderLabel.textColor"];
    [self.textPwd setValue:[UIColor grayColor] forKeyPath:@"_placeholderLabel.textColor"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [NSThread sleepForTimeInterval:0.4];
    CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
    animation.toValue=[NSNumber numberWithInt:-100];
    animation.duration=0.4;
    animation.removedOnCompletion=NO;
    animation.fillMode=kCAFillModeForwards;
    CABasicAnimation *animationAlpha=[CABasicAnimation animationWithKeyPath:@"opacity"];
    animationAlpha.toValue=[NSNumber numberWithInt:1];
    animationAlpha.duration=0.4;
    animationAlpha.removedOnCompletion=YES;
    animationAlpha.fillMode=kCAFillModeForwards;
    
    [self.imgLogo.layer addAnimation:animation forKey:@"animationMove"];
    [self.viewPhone.layer addAnimation:animation forKey:@"animationMove"];
    [self.viewPwd.layer addAnimation:animation forKey:@"animationMove"];
    [self.buttonLogin.layer addAnimation:animation forKey:@"animationMove"];
    [self.buttonReg.layer addAnimation:animation forKey:@"animationMove"];
    [self.viewPhone.layer addAnimation:animationAlpha forKey:@"animationAlpha"];
    [self.viewPwd.layer addAnimation:animationAlpha forKey:@"animationAlpha"];
    [self.buttonLogin.layer addAnimation:animationAlpha forKey:@"animationAlpha"];
    [self.buttonReg.layer addAnimation:animationAlpha forKey:@"animationAlpha"];
    }


-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [NSThread sleepForTimeInterval:0.4];
    self.viewPhoneTrue.hidden=false;
    self.viewPwdTrue.hidden=false;
    self.buttonLoginTrue.hidden=false;
    self.buttonRegTrue.hidden=false;


    

    
}







/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)buttonLoginDown:(id)sender {
}

- (IBAction)buttonRegDown:(id)sender {
}
@end
