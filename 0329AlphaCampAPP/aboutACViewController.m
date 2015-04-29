//
//  aboutACViewController.m
//  0329AlphaCampAPP
//
//  Created by Jason Lei on 2015/3/30.
//  Copyright (c) 2015年 AlphaCamp. All rights reserved.
//

#import "aboutACViewController.h"

@interface aboutACViewController ()

@end

@implementation aboutACViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    b1.layer.cornerRadius = 4.0;
//    UIImage* img = [UIImage imageNamed:@"NaviLogo"];
//    
//    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:img];
//    
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"NaviLogo"]];
    
    self.navigationItem.titleView = [[UIView alloc] initWithFrame:CGRectMake(0,0,122,22)];
    [self.navigationItem.titleView addSubview:imageView];
    
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

@end
