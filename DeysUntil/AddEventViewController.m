//
//  AddEventViewController.m
//  DeysUntil
//
//  Created by Nolan Dey on 2015-03-28.
//  Copyright (c) 2015 Joe Yang Productions. All rights reserved.
//

#import "AddEventViewController.h"

@interface AddEventViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textFromTextBox;
@property (weak, nonatomic) IBOutlet UIDatePicker *dateFromPicker;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;
@end

@implementation AddEventViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSDate *)dateWithZeroSeconds:(NSDate *)date
{
    NSTimeInterval time = floor([date timeIntervalSinceReferenceDate] / 60.0) * 60.0;
    return  [NSDate dateWithTimeIntervalSinceReferenceDate:time];
}

- (void)setNotification:(Event *)notifEvent{
    UILocalNotification  *localNotification = [[UILocalNotification alloc] init];
    NSDate *flooredDateTime = [self dateWithZeroSeconds:(notifEvent.eventDate)];
    
    
    localNotification.fireDate = flooredDateTime;
    localNotification.alertBody = [NSString stringWithFormat:@"Event %@ is happening NOW!", notifEvent.eventName];
    localNotification.soundName = UILocalNotificationDefaultSoundName;
    localNotification.applicationIconBadgeNumber = 1;
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if (sender != self.saveButton) return;
    if (self.textFromTextBox.text.length > 0) {
        self.event = [[Event alloc] init];
        self.event.eventName = self.textFromTextBox.text;
        self.event.eventDate = self.dateFromPicker.date;
        NSLog(@"%@", self.event.eventName);
        NSLog(@"%@", [self dateWithZeroSeconds:(self.event.eventDate)]);
    
        if ([UIApplication instancesRespondToSelector:@selector(registerUserNotificationSettings:)]) {
            [[UIApplication sharedApplication] registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert|UIUserNotificationTypeSound|UIUserNotificationTypeBadge categories:nil]];
            [self setNotification:(self.event)];
        }
    }
    
}


@end
