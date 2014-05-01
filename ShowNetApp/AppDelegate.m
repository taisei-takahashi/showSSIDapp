//
//  AppDelegate.m
//  ShowSSIDapp
//
//  Created by uncensored on 2014/04/26.
//  Copyright (c) 2014年 Taisei. All rights reserved.
//

#import "AppDelegate.h"
#import <Foundation/Foundation.h>
#import <CoreWLAN/CoreWLAN.h>


@interface AppDelegate ()
@property (weak) IBOutlet NSMenu *statusMenu;
@end


@implementation AppDelegate

    NSStatusItem *_statusItem;

- (void)setupStatusItem
{
    NSStatusBar *systemStatusBar = [NSStatusBar systemStatusBar];
    _statusItem = [systemStatusBar statusItemWithLength:NSVariableStatusItemLength];
    [_statusItem setHighlightMode:YES];
    
    //read the ssid from ssidgetter method///////////////////////////////////////////////
      NSString *s1 = @"⌘";
     [_statusItem setTitle: [NSString stringWithFormat:@"%@ %@",s1,[self ssidgetter]]];

    
    [NSTimer scheduledTimerWithTimeInterval:4.0f target:self selector:@selector(hoge:) userInfo:nil repeats:YES];

    
    //////////////////////////////////////////////////////////////////////////////////////
    
    [_statusItem setImage:[NSImage imageNamed:@"StatusBarIconTemplate"]];
    [_statusItem setMenu:self.statusMenu];
}

- (void)hoge:(NSTimer *)timer
{
    NSString *s1 = @"⌘";
    [_statusItem setTitle: [NSString stringWithFormat:@"%@ %@",s1,[self ssidgetter]]];

}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    [self setupStatusItem];

}

- (NSString*) ssidgetter
{
    
    @autoreleasepool {
        
    CWInterface *wif = [CWInterface interface];
    
//    NSLog(@"SSID: %@", wif.ssid);
        
    return wif.ssid;
    
        
    }
}


@end
