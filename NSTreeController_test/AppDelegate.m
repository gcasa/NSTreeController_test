//
//  AppDelegate.m
//  NSTreeController_test
//
//  Created by Gregory Casamento on 2/28/23.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (strong) IBOutlet NSWindow *window;
@property (strong) IBOutlet NSTreeController *treeController;
@property (strong) NSArray *nodes;

@end

@implementation AppDelegate

- (NSArray *) buildNodes
{
    NSTreeNode *node = [[NSTreeNode alloc] initWithRepresentedObject: @"Root"];
    NSArray *array = [NSArray arrayWithObject: node];
    NSTreeNode *child = [[NSTreeNode alloc] initWithRepresentedObject: @"Child"];
    // node.mutableChildNodes = [NSArray arrayWithObject: child];
    return array;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    self.treeController.childrenKeyPath = @"childNodes";
    self.treeController.leafKeyPath = @"leaf";
    self.nodes = [self buildNodes];
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


- (BOOL)applicationSupportsSecureRestorableState:(NSApplication *)app {
    return YES;
}


@end
