//
//  AppDelegate.m
//  NSTreeController_test
//
//  Created by Gregory Casamento on 2/28/23.
//

#import "AppDelegate.h"
#import "TreeNode.h"

@interface AppDelegate ()

@property (strong) IBOutlet NSWindow *window;
@property (strong) IBOutlet NSTreeController *treeController;
@property (strong) NSArray *nodes;

@end

@implementation AppDelegate

- (NSArray *) buildNodes
{
  TreeNode *node = [[TreeNode alloc] init];
  node.value = @"Root";
  node.leaf = NO;
  NSArray *array = [NSArray arrayWithObject: node];
  TreeNode *child = [[TreeNode alloc] init];
  child.value = @"Child 0";
  child.leaf = YES;
  node.children = [NSMutableArray arrayWithObject: child];
  node.count = [node.children count];
  
  return array;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
  // Insert code here to initialize your application
  // self.treeController.childrenKeyPath = @"childNodes";
  // self.treeController.leafKeyPath = @"leaf";
  
  NSTreeNode *testNode = [[NSTreeNode alloc] init];
  NSTreeController *testController = [[NSTreeController alloc] initWithContent: testNode];
  NSString *countPath = [testController countKeyPathForNode:testNode];
  NSString *childPath = [testController childrenKeyPathForNode:testNode];
  NSString *leafPath = [testController leafKeyPathForNode:testNode];
  
  NSLog(@"countPath = %@", countPath);
  NSLog(@"childPath = %@", childPath);
  NSLog(@"leafPath = %@", leafPath);
  
  self.nodes = [self buildNodes];
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


- (BOOL)applicationSupportsSecureRestorableState:(NSApplication *)app {
    return YES;
}


@end
