//
//  EventContentTableViewCell.h
//  0329AlphaCampAPP
//
//  Created by Jason Lei on 2015/4/11.
//  Copyright (c) 2015年 AlphaCamp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventContentTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *eventImage;
@property (weak, nonatomic) IBOutlet UILabel *eventTitle;
@property (weak, nonatomic) IBOutlet UILabel *eventDate;
@property (weak, nonatomic) IBOutlet UILabel *eventInfo;
@property (weak, nonatomic) IBOutlet UIButton *moreButton;

@end
