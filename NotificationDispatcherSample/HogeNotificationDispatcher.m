//
//  HogeNotificationDispatcher.m
//  NotificationDispatcherSample
//
//  Created by mironal on 2014/10/21.
//  Copyright (c) 2014年 mironal. All rights reserved.
//

#import "HogeNotificationDispatcher.h"

#import "HogeNotificator.h"

@implementation HogeNotificationDispatcher

- (instancetype)initWithNotificator:(HogeNotificator *)notificatorOrNil {
    self = [super init];
    if (self) {
        _notificator = notificatorOrNil;
        
        NSNotificationCenter *c = NSNotificationCenter.defaultCenter;
        
        [c addObserver:self
              selector:@selector(safe_didChangeHogehoge:)
                  name:kHogeNotificator_safe_DidChangeHogeHogeNotification
                object:_notificator];
        
        [c addObserver:self
              selector:@selector(unsafe_didFail:)
                  name:kHogeNotificator_unsafe_HogeHogeDidFailNotification
                object:_notificator];

    }
    return self;
}

- (void)dealloc {
    [NSNotificationCenter.defaultCenter removeObserver:self];
}

#pragma mark - Notification

- (void)safe_didChangeHogehoge:(NSNotification *)note {
    
    NSString *hogehoge = note.userInfo[kHogeNotificatorHogeHogeUserInfoKey];
    
    [self.delegate safe_dispatcher:self didChangeHogeHoge:hogehoge];
}

- (void)unsafe_didFail:(NSNotification *)note {
    
    NSError *error = note.userInfo[kHogeNotificatorErrorUserInfoKey];
    
    [self.delegate unsafe_dispatcher:self didFail:error];
}

@end
