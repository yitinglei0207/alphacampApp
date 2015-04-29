//
//  ClassTableViewController.h
//  0329AlphaCampAPP
//
//  Created by Jason Lei on 2015/3/30.
//  Copyright (c) 2015年 AlphaCamp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClassTableViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic)NSInteger rowNumberOfTableView;

@end
