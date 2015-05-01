//
//  LoginViewController.m
//  0329AlphaCampAPP
//
//  Created by Jason Lei on 2015/4/30.
//  Copyright (c) 2015年 AlphaCamp. All rights reserved.
//

#import "LoginViewController.h"
#import <Parse/Parse.h>
#import <AFNetworking.h>
#import "ApiKey.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *emailText;
@property (weak, nonatomic) IBOutlet UITextField *passwordText;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (strong,nonatomic) NSString *authToken;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) networkingStart{
    //AFNetworking manager initialize
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    //set login parameters
    NSDictionary *loginParameters = @{
                                      @"email": self.emailText.text,
                                      @"password": self.passwordText.text,
                                      @"api_key": api_key
                                      };
    //POST
    [manager POST:@"https://dojo.alphacamp.co/api/v1/login" parameters:loginParameters  success:^(AFHTTPRequestOperation *operation, id responseObject){
        //if logged in jump to main view
        UITabBarController *tabBarView = [self.storyboard instantiateViewControllerWithIdentifier:@"tabBarController"];
        [tabBarView setSelectedIndex:0];
        [self presentViewController:tabBarView animated:YES completion:nil];
        //receive the token
        self.authToken = [NSString stringWithFormat:(@"%@",responseObject[@"auth_token"])];
        
    }
          failure:^(AFHTTPRequestOperation *operation, NSError *error) {
              
          }];
    
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
