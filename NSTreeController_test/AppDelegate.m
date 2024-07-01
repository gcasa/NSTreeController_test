//
//  AppDelegate.m
//  NSTreeController_test
//
//  Created by Gregory Casamento on 2/28/23.
//

#import "AppDelegate.h"
#import "TreeNode.h"
#import <objc/runtime.h>

/**
*  Gets a list of all methods on a class (or metaclass)
*  and dumps some properties of each
*
*  @param clz the class or metaclass to investigate
*/
void DumpObjcMethods(Class clz) {

   unsigned int methodCount = 0;
   Method *methods = class_copyMethodList(clz, &methodCount);

   printf("Found %d methods on '%s'\n", methodCount, class_getName(clz));

   for (unsigned int i = 0; i < methodCount; i++) {
       Method method = methods[i];

       printf("\t'%s' has method named '%s' of encoding '%s'\n",
              class_getName(clz),
              sel_getName(method_getName(method)),
              method_getTypeEncoding(method));

       /**
        *  Or do whatever you need here...
        */
   }

   free(methods);
}

@interface AppDelegate ()

@property (strong) IBOutlet NSWindow *window;
@property (strong) IBOutlet NSTreeController *treeController;
@property (strong) NSArray *nodes;
@property (strong) IBOutlet NSOutlineView *ov;

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
    child.leaf = NO;
    node.children = [NSMutableArray arrayWithObject: child];
    node.count = [node.children count];

    TreeNode *newChild0 = [[TreeNode alloc] init];
    newChild0.value = @"Subchild 0";
    newChild0.leaf = YES;
    child.children = [NSMutableArray arrayWithObject: newChild0];
    child.count = [child.children count];
    newChild0.count = 0;
    
    return array;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
  // Insert code here to initialize your application
  // self.treeController.childrenKeyPath = @"childNodes";
  // self.treeController.leafKeyPath = @"leaf";
  
  //NSTreeNode *testNode = [[NSTreeNode alloc] init];
  //NSTreeController *testController = [[NSTreeController alloc] initWithContent: testNode];
  //NSString *countPath = [self.treeController countKeyPathForNode:testNode];
  //NSString *childPath = [self.treeController childrenKeyPathForNode:testNode];
  //NSString *leafPath = [self.treeController leafKeyPathForNode:testNode];
  
  //NSLog(@"countPath = %@", countPath);
  //NSLog(@"childPath = %@", childPath);
  //NSLog(@"leafPath = %@", leafPath);
  
  self.nodes = [self buildNodes];
    NSString *cn = [self.treeController.arrangedObjects className];
    NSString *sc = NSStringFromClass([[self.treeController.arrangedObjects class] superclass]);
    NSLog(@"arrangedObjects = %@, className = %@, superClass = %@",
          self.treeController.arrangedObjects, cn, sc);
    NSLog(@"representedObject = %@" /*, value = %@" */, self.treeController.arrangedObjects.representedObject); // ,
          // self.treeController.arrangedObjects.representedObject.value);
    DumpObjcMethods([self.treeController.arrangedObjects class]);
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


- (BOOL)applicationSupportsSecureRestorableState:(NSApplication *)app {
    return YES;
}

- (IBAction) reload: (id)sender
{
    [self.ov reloadData];
}

- (IBAction) add: (id)sender
{
    [self.treeController add: sender];
}

@end
