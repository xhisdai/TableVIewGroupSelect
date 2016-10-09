//
//  ViewController.m
//  TextDemo
//
//  Created by huhaifeng on 16/10/8.
//  Copyright © 2016年 huhaifeng. All rights reserved.
//

#import "ViewController.h"
#import "PollMessageController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self PushMessVC];
    });
}

- (void)PushMessVC{
    PollMessageController * VC =[[PollMessageController alloc]init];
    [self.navigationController pushViewController:VC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
