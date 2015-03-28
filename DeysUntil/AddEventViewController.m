//
//  AddEventViewController.m
//  DeysUntil
//
//  Created by Nolan Dey on 2015-03-28.
//  Copyright (c) 2015 Joe Yang Productions. All rights reserved.
//

#import "AddEventViewController.h"

@interface AddEventViewController ()
@property (weak, nonatomic) IBOutlet UITextField *eventText;
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


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if (sender != self.saveButton) return;
    if (self.eventText.text.length > 0) {
        self.event = [[Event alloc] init];
        self.event.eventName = self.eventText.text;
        //self.event.eventData =
    }
}


@end
