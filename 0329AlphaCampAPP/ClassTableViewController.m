//
//  ClassTableViewController.m
//  0329AlphaCampAPP
//
//  Created by Jason Lei on 2015/3/30.
//  Copyright (c) 2015年 AlphaCamp. All rights reserved.
//

#import "ClassTableViewController.h"
#import <AFNetworking/AFNetworking.h>
#import "ApiKey.h"

@interface ClassTableViewController ()<UITableViewDataSource, UITableViewDelegate,
UIActionSheetDelegate>
@property(strong,nonatomic) NSArray *couseArray;
@property(strong,nonatomic) NSArray *sectionArray;
@property(strong,nonatomic) NSString *classTitle;
@property (weak, nonatomic) IBOutlet UITableView *classTable;

@end

@implementation ClassTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //    UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:@"選擇課程" style:UIBarButtonItemStylePlain target:self action:@selector(void)];
    //    self.navigationItem.rightBarButtonItem = anotherButton;
    //
    [self getAPIdata];
    
}

- (void) getAPIdata{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *authToken = [NSString stringWithFormat:@"%@",[userDefault stringForKey:@"auth_token"]];
    
    NSDictionary *userParameters = @{
                                     @"api_key": api_key,
                                     @"auth_token": authToken
                                     };
    [manager GET:@"https://dojo.alphacamp.co/api/v1/courses" parameters:userParameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        _couseArray = responseObject[@"courses"];
        _classTitle = [NSString stringWithFormat:@"%@", _couseArray[1][@"name"]];
        NSString *courseID = [NSString stringWithFormat:@"%@", _couseArray[1][@"id"]];
        NSString *sectionURL = [NSString stringWithFormat:@"https://dojo.alphacamp.co/api/v1/courses/%@",courseID];
        
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        
        NSDictionary *userParameter = @{
                                        @"api_key": api_key,
                                        @"auth_token": authToken
                                        };
        [manager GET:sectionURL parameters:userParameter success:^(AFHTTPRequestOperation *operation, id responseObject) {
            _sectionArray = responseObject[@"syllabus"];
            [_classTable reloadData];
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"Get Section Error: %@", error);
        }];
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Get course Error: %@", error);
    }];
    
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [[self navigationController] setNavigationBarHidden:NO animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return _classTitle;
}

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
    return _sectionArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellIdentifier = @"CodeTableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        cell.backgroundColor =[UIColor clearColor];
        cell.textLabel.textColor = [UIColor grayColor];
        cell.textLabel.font =[UIFont systemFontOfSize:15];
        cell.detailTextLabel.textColor = [UIColor lightGrayColor];
        
    } else {
        NSLog(@"I have been initialize. Row = %li", (long)indexPath.row);
    }
    cell.textLabel.text= [NSString stringWithFormat:@"%@",self.sectionArray[indexPath.row][@"section"][@"name"]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 44.0;
}

- (IBAction)couseSelect:(id)sender {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *authToken = [NSString stringWithFormat:@"%@",[userDefault stringForKey:@"auth_token"]];
    
    NSDictionary *userParameters = @{
                                     @"api_key": api_key,
                                     @"auth_token": authToken
                                     };
    
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
// Get the new view controller using [segue destinationViewController].
// Pass the selected object to the new view controller.}




@end
