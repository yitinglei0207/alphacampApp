//
//  ClassTableViewController.m
//  0329AlphaCampAPP
//
//  Created by Jason Lei on 2015/3/30.
//  Copyright (c) 2015年 AlphaCamp. All rights reserved.
//

#import "ClassTableViewController.h"

@interface ClassTableViewController ()

@end

@implementation ClassTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:@"選擇課程" style:UIBarButtonItemStylePlain target:self action:@selector(void)];
    self.navigationItem.rightBarButtonItem = anotherButton;
    
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
    return @"測試沙箱Bootcamp";
}

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
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
        NSLog(@"I have been initialized. Row = %li", (long)indexPath.row);
    }
    
    if ((long)indexPath.row == 0) {
        cell.textLabel.text = @"Week 1:認識AlphaCamp";
        NSLog(@"I have been initialized. Row = %li", (long)indexPath.row);
    }
    else
    {
        cell.textLabel.text = @"Week 2:認識創業";
        NSLog(@"I have been initialized. Row = %li", (long)indexPath.row);
    }
    return cell;
}





#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.}




@end
