//
//  HogeNotificator.h
//  NotificationDispatcherSample
//
//  Created by mironal on 2014/10/21.
//  Copyright (c) 2014年 mironal. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 
 _safe_ ってついてるのはメインスレッドで通知が飛んでくる.
 _unsafe_ ってついてるのはどこのスレッドから通知が飛んでくるかわからない
 
 */
#pragma mark Notification



/**
 
 HogeHoge な通知
 
 userInfo:
 
 - kHogeNotificatorHogeHogeUserInfoKey

 
 */
#define kHogeNotificator_safe_DidChangeHogeHogeNotification @"kHogeNotificator_safe_DidChangeHogeHogeNotification"


/**
 
 FooBar な通知
 
 userInfo:

  - kHogeNotificatorErrorUserInfoKey
 
 */
#define kHogeNotificator_unsafe_HogeHogeDidFailNotification @"kHogeNotificator_unsafe_HogeHogeDidFailNotification"

#pragma mark - UserInfo

/**
 
 NSString
 
 */
#define kHogeNotificatorHogeHogeUserInfoKey @"kHogeNotificatorHogeHogeUserInfoKey"

/**
 
 NSError
 
 */
#define kHogeNotificatorErrorUserInfoKey @"kHogeNotificatorErrorUserInfoKey"

@interface HogeNotificator : NSObject

/**
 
 XXXX な処理を要求する.
 
 変更されたら kHogeNotificator_safe_DidChangeHogeHogeNotification が通知される
 
 失敗したら kHogeNotificator_unsafe_HogeHogeDidFailNotification が通知される
 
 */
- (void)requestNotification;

#pragma mark -

+ (instancetype)sharedNotificator;

@end
