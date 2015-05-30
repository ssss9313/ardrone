//
//  ViewController.m
//  ardrone
//
//  Created by Ivan on 2015/5/22.
//  Copyright (c) 2015年 Aptan. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *urlString = @"http://192.168.1.2:5555";
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:urlRequest];
    // _button.hidden = YES;
    

    
    
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter]
     addObserver:self selector:@selector(orientationChanged:)
     name:UIDeviceOrientationDidChangeNotification
     object:[UIDevice currentDevice]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) orientationChanged:(NSNotification *)note{
    UIDevice *device = [UIDevice currentDevice];
    ViewController2 *view2 = [[ViewController2 alloc]init];
    //ViewController *view = [[ViewController alloc]init];
    
    
    switch(device.orientation)
    {
        case UIDeviceOrientationPortrait:
            [self dismissModalViewControllerAnimated:NO];
            break;
        case UIDeviceOrientationPortraitUpsideDown:
            //_button.hidden = YES;
            break;
        case UIDeviceOrientationLandscapeLeft:
            NSLog (@"this is a test1");
        [self presentViewController:view2 animated:NO completion:nil];
            break;
        case UIDeviceOrientationLandscapeRight:
            NSLog (@"this is a test2");
            [self presentViewController:view2 animated:NO completion:nil];
            break;
            
        default:
            break;
    };
}
@end
