//
//  HogeNotificator.m
//  NotificationDispatcherSample
//
//  Created by mironal on 2014/10/21.
//  Copyright (c) 2014年 mironal. All rights reserved.
//

#import "HogeNotificator.h"

@implementation HogeNotificator

- (void)requestNotification {
    
    NSNotificationCenter *c = NSNotificationCenter.defaultCenter;
    
    if (arc4random_uniform(2) == 0) {
        
        // memo: 必ずメインスレッドでの実行を保証
        dispatch_async(dispatch_get_main_queue(), ^{

            [c postNotificationName:kHogeNotificator_safe_DidChangeHogeHogeNotification
                             object:self
                           userInfo:@{kHogeNotificatorHogeHogeUserInfoKey: @"(っ＞ω＜c)"}];
        });
        
    } else {
        
        // memo: 実行したスレッドで通知が飛ぶので安全ではないので _unsafe_
        
        NSError *error = [NSError errorWithDomain:@"Hoge" code:9999 userInfo:nil];
        
        [c postNotificationName:kHogeNotificator_unsafe_HogeHogeDidFailNotification
                         object:self
                       userInfo:@{kHogeNotificatorErrorUserInfoKey: error}];
    }
}

#pragma mark - 

+ (instancetype)sharedNotificator {
    
    static HogeNotificator *n = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        n = HogeNotificator.new;
    });
    
    return n;
}

@end
