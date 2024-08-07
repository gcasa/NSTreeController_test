//
//  AppDelegate.h
//  NSTreeController_test
//
//  Created by Gregory Casamento on 2/28/23.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate, NSOutlineViewDelegate>

- (IBAction) reload: (id)sender;
- (IBAction) add: (id)sender;
- (IBAction) addChild: (id)sender;
- (IBAction) addIndex: (id)sender;
- (IBAction) remove: (id)sender;
- (IBAction) removeIndex: (id)sender;

@end

