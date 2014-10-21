//
//  ViewController.m
//  NotificationDispatcherSample
//
//  Created by mironal on 2014/10/21.
//  Copyright (c) 2014年 mironal. All rights reserved.
//

#import "ViewController.h"

#import "HogeNotificator.h"
#import "HogeNotificationDispatcher.h"

@interface ViewController () <HogeNotificationDispatcherDelegate>

@property (weak, nonatomic) IBOutlet UILabel *label;

@property (nonatomic) HogeNotificationDispatcher *dispatcher;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _dispatcher = [HogeNotificationDispatcher.alloc initWithNotificator:HogeNotificator.sharedNotificator];
    _dispatcher.delegate = self;
}

- (IBAction)didPushButton:(id)sender {
    
    [HogeNotificator.sharedNotificator requestNotification];
}

#pragma mark - HogeNotificationDispatcherDelegate

- (void)safe_dispatcher:(HogeNotificationDispatcher *)dispatcher didChangeHogeHoge:(NSString *)hogehgoe {
    
    _label.text = hogehgoe;
}

- (void)unsafe_dispatcher:(HogeNotificationDispatcher *)dispatcher didFail:(NSError *)error {
    
    // memo: どのスレッドから実行されるかわからないので main スレッドで実行
    dispatch_async(dispatch_get_main_queue(), ^{
        _label.text = error.description;
    });
}

@end
