//
//  EventzTableViewController.h
//  DeysUntil
//
//  Created by Nolan Dey on 2015-03-28.
//  Copyright (c) 2015 Joe Yang Productions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Event.h"
#import <Foundation/Foundation.h>
#import "AddEventViewController.h"


@interface EventzTableViewController : UITableViewController

@property (strong, nonatomic) NSMutableArray *eventz;

- (void) loadTestData;
- (void) updateCountdownOnVisibleCells:(NSUInteger)eventNumber;
- (IBAction)unwindToList:(UIStoryboardSegue *)segue;

@end
