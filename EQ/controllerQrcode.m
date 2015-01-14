//
//  controllerQrcode.m
//  EQ
//
//  Created by YangYuxin on 14/12/30.
//  Copyright (c) 2014年 YYX. All rights reserved.
//

#import "controllerQrcode.h"
#import "controllerSecondTabBar.h"


@interface controllerQrcode ()

@end

@implementation controllerQrcode

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self readQrcode];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)readQrcode
{
    AVCaptureDevice* device=[AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    NSError* error=nil;
    
    AVCaptureDeviceInput* input=[AVCaptureDeviceInput deviceInputWithDevice:device error:&error];
    if (error) {
        NSLog(@"No camera");
        return;
    }
    
    AVCaptureMetadataOutput* output=[[AVCaptureMetadataOutput alloc] init];
    [output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    [output setMetadataObjectsDelegate:self queue:dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0)];
    
    AVCaptureSession* session=[[AVCaptureSession alloc] init];
    session=[[AVCaptureSession alloc] init];
    [session addInput:input];
    [session addOutput:output];
    
    AVCaptureVideoPreviewLayer* preview=[[AVCaptureVideoPreviewLayer alloc] init];
    [output setMetadataObjectTypes:@[AVMetadataObjectTypeQRCode]];
    preview=[AVCaptureVideoPreviewLayer layerWithSession:session];
    [preview setVideoGravity:AVLayerVideoGravityResizeAspectFill];
    [preview setFrame:self.view.bounds];
    [self.view.layer insertSublayer:preview atIndex:0];
    self.previewLayer=preview;
    
    [session startRunning];
    self.session=session;

}

-(void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection
{
    [self.session stopRunning];
    [self.previewLayer removeFromSuperlayer];
    
    NSLog(@"%@",metadataObjects);
    if (metadataObjects.count>0) {
        AVMetadataMachineReadableCodeObject* obj=metadataObjects[0];
        NSLog(@"%@",obj.stringValue);
        if(true)
        {
            controllerSecondTabBar* Vc;
            Vc = [self.storyboard instantiateViewControllerWithIdentifier:@"secondtabbar"];
            [Vc setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
            [self presentViewController:Vc animated:YES completion:nil] ;
        }
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
