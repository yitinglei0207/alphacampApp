//
//  EventButton.h
//  0329AlphaCampAPP
//
//  Created by Jason Lei on 2015/4/29.
//  Copyright (c) 2015年 AlphaCamp. All rights reserved.
//

#import <Parse/Parse.h>
#import <UIKit/UIKit.h>

@interface EventButton : UIButton

@property (nonatomic, strong) PFObject *event;

@end
