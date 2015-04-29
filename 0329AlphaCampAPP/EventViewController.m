//
//  EventViewController.m
//  0329AlphaCampAPP
//
//  Created by Jason Lei on 2015/4/11.
//  Copyright (c) 2015年 AlphaCamp. All rights reserved.
//

#import "EventViewController.h"
#import "EventContentTableViewCell.h"
#import <Parse/Parse.h>
#import "EventButton.h"

@interface EventViewController ()
@property (strong, nonatomic)UIScrollView   *eventScrollView;
@property (strong, nonatomic)NSMutableArray *URLArray;
@property (strong, nonatomic)NSDictionary   *contentDict;

@end

@implementation EventViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self startQuery];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)startQuery{
    //query for number of events
    PFQuery *eventQuery = [PFQuery queryWithClassName:@"Event"];
    NSInteger eventNumber = [eventQuery countObjects];
    
    //setup the scrollView
    _eventScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height)];
    _eventScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 100+420*eventNumber);
    _eventScrollView.backgroundColor = [UIColor orangeColor];
    
    [self.view addSubview:_eventScrollView];
    
    //setup views and put it on to scrollView
    [eventQuery findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error){
        if (!error) {
            //set up all events
            for (int i = 0; i<eventNumber; i++) {
                
                //set view y position
                int y = 30 + i*420;
                
                //set view size
                UIView *eventView = [[UIView alloc] initWithFrame:CGRectMake(10, y, self.view.frame.size.width-20, 400)];
                
                //set image
                UIImageView *eventImage = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, self.view.frame.size.width-30, 150)];
                [eventImage setContentMode:UIViewContentModeScaleToFill];
                [eventImage setBackgroundColor:[UIColor grayColor]];
                
                //get image from parse
                PFFile *parseImageFile = objects[i][@"image"];
                NSLog(@"date string: %@", objects[i][@"image"]);
                [parseImageFile getDataInBackgroundWithBlock:^(NSData *imageData, NSError *error){
                    if (!error) {
                        UIImage *image = [UIImage imageWithData:imageData];
                        eventImage.image = image;
                    }
                    else{
                        NSLog(@"load image error: %@", [error debugDescription]);
                    }
                }];
                
                
                //define titlelabel size
                UILabel * titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 160, self.view.frame.size.width-30, 50)];
                titleLabel.lineBreakMode =NSLineBreakByWordWrapping;
                titleLabel.numberOfLines = 0;
                titleLabel.text=objects[i][@"eventName"];
                titleLabel.font=[UIFont fontWithName:@"Helvetica" size:20];
                
                //define dateLabel
                UILabel *dateLabel =[[UILabel alloc]initWithFrame:CGRectMake(10, 205, 300, 30)];
                dateLabel.text =[NSString stringWithFormat:@"Date：%@",objects[i][@"dateString"]] ;
                dateLabel.textColor =[UIColor colorWithRed:255/255.0 green:102/255.0 blue:0/255.0 alpha:1];
                dateLabel.font =[UIFont fontWithName:@"Helvetica" size:16];
                
                //define detailTextView
                UITextView *detailTextView =[[UITextView alloc] initWithFrame:CGRectMake(5, 230, self.view.frame.size.width-30, 110)];
                
                detailTextView.text= objects[i][@"content"];
                
                //define button
                EventButton * moreInfoButton =[[EventButton alloc]initWithFrame:CGRectMake((eventView.frame.size.width-180)/2, 350, 180, 40)];
                moreInfoButton.event=objects[i];
                [moreInfoButton setTitle:@"More" forState:UIControlStateNormal];
                [moreInfoButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                moreInfoButton.backgroundColor = [UIColor colorWithRed:255/255.0 green:102/255.0 blue:0/255.0 alpha:1];
                moreInfoButton.layer.cornerRadius =5.0f;
                
                
                [moreInfoButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
                
                
                // add to view
                [eventView addSubview:eventImage];
                [eventView addSubview:titleLabel];
                [eventView addSubview:dateLabel];
                [eventView addSubview:detailTextView];
                [eventView addSubview:moreInfoButton];
                eventView.backgroundColor = [UIColor whiteColor];
                
                // add to scrollView
                [_eventScrollView addSubview:eventView];

            }
            
            
        }else {
            // Log details of the failure
            NSLog(@"Parse event query Error: %@ %@", error, [error userInfo]);
        }
    }];
    
}

-(void)buttonPressed: (id)sender {
//    EventButton *button =(EventButton *) sender;
//    // use button event to find URL
//    NSString *URL = [NSString stringWithFormat:@"%@", button.event[@"eventURL"]];
//    
//    
//    EventDetailViewController *eventDetailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"eventDetailViewController"];
//    
//    // Setup mapping URL
//    eventDetailVC.eventDetailURL=URL;
//    
//    [self.navigationController pushViewController:eventDetailVC animated:YES];
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
