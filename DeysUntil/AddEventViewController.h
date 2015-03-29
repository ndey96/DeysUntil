//
//  AddEventViewController.h
//  DeysUntil
//
//  Created by Nolan Dey on 2015-03-28.
//  Copyright (c) 2015 Joe Yang Productions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Event.h"
#import "EventzTableViewController.h"

@interface AddEventViewController : UIViewController

@property Event *event;

- (IBAction)setNotification:(Event *)notifEvent;

- (NSDate *)dateWithZeroSeconds:(NSDate *)date;

@end
