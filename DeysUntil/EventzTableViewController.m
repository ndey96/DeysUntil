//
//  EventzTableViewController.m
//  DeysUntil
//
//  Created by Nolan Dey on 2015-03-28.
//  Copyright (c) 2015 Joe Yang Productions. All rights reserved.
//

#import "EventzTableViewController.h"

@interface EventzTableViewController ()

@end

@implementation EventzTableViewController


- (IBAction)unwindToList:(UIStoryboardSegue *)segue{
    AddEventViewController *source = [segue sourceViewController];
    Event *swagEvent = source.event;
    if (swagEvent != nil) {
        [self.eventz addObject:swagEvent];
        [self.tableView reloadData];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.eventz = [[NSMutableArray alloc] init];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    NSTimer *timer;
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                             target:self
                                           selector:@selector(updateCountdownOnVisibleCells:)
                                           userInfo:nil
                                            repeats:YES];

}

- (void)viewDidAppear:(BOOL)animated {
    // (Re)start the timer
    
}

- (void)viewDidDisappear:(BOOL)animated {
    // cancel the timer
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.eventz count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EventCell" forIndexPath:indexPath];
    Event *event = [self.eventz objectAtIndex:indexPath.row];
    cell.textLabel.text = event.eventName;
    [self updateCountdownOnVisibleCells:[self.tableView visibleCells]];
    
    return cell;
}
    

- (void) updateCountdownOnVisibleCells:(NSTimer*)timer {
    //Get the time left until the specified date
   
    //access visible cells without passing it
    //Event *event = [self.eventz objectAtIndex:eventNumber];
    //NSDate *date = event.eventDate;
    
    NSArray *visibleCells = [self.tableView visibleCells];
    
    for (UITableViewCell *cell in visibleCells)
    {
        NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
        Event *event = [self.eventz objectAtIndex:indexPath.row];
        NSInteger time = event.eventDate.timeIntervalSinceNow;
        if (time>0){
            NSInteger seconds = time % 60;
            NSInteger minutes = (time / 60) % 60;
            NSInteger hours = (time / 3600) % 24;
            NSInteger days = (time / 86400);
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%02li:%02li:%02li:%02li", (long)days, (long)hours, (long)minutes, (long)seconds];
        }else{
            cell.detailTextLabel.text = @"FINISHED";
        }
        
        
    }
    
    //Update the label with the remaining time
    
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
