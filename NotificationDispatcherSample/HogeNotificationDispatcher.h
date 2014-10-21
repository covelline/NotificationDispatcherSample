//
//  HogeNotificationDispatcher.h
//  NotificationDispatcherSample
//
//  Created by mironal on 2014/10/21.
//  Copyright (c) 2014年 mironal. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HogeNotificator;
@class HogeNotificationDispatcher;

@protocol HogeNotificationDispatcherDelegate <NSObject>

- (void)safe_dispatcher:(HogeNotificationDispatcher *)dispatcher didChangeHogeHoge:(NSString *)hogehgoe;

- (void)unsafe_dispatcher:(HogeNotificationDispatcher *)dispatcher didFail:(NSError *)error;

@end

@interface HogeNotificationDispatcher : NSObject

@property (nonatomic, weak) id <HogeNotificationDispatcherDelegate> delegate;

@property (nonatomic, readonly) HogeNotificator *notificator;

- (instancetype)initWithNotificator:(HogeNotificator *)notificatorOrNil;

@end
