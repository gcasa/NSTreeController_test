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
@property (strong) IBOutlet NSOutlineView *ov;

@property (strong) NSArray *nodes;
@property NSMutableArray *selectionIndexPaths;

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

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification 
{
    self.nodes = [self buildNodes];
    NSString *cn = [self.treeController.arrangedObjects className];
    NSString *sc = NSStringFromClass([[self.treeController.arrangedObjects class] superclass]);
    NSLog(@"arrangedObjects = %@, className = %@, superClass = %@",
          self.treeController.arrangedObjects, cn, sc);
    NSLog(@"representedObject = %@" /*, value = %@" */, self.treeController.arrangedObjects.representedObject); // ,
          // self.treeController.arrangedObjects.representedObject.value);
    NSLog(@"objectClassName = %@", [self.treeController objectClass]);
    NSLog(@"newObject = %@", [self.treeController newObject]);
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
    NSLog(@"representedObject = %@", self.treeController.arrangedObjects.representedObject);
    NSLog(@"childNodes = %@", self.treeController.arrangedObjects.childNodes);
}

- (IBAction) addChild: (id)sender
{
  if ([self.treeController.selectedObjects count] > 0)
    {
      id node = [self.treeController.selectedObjects objectAtIndex: 0];
      NSLog(@"Selected %@", self.treeController.selectionIndexPath);
      NSString *ckp = [self.treeController childrenKeyPathForNode: node];
      NSLog(@"Count key path = %@", ckp);
      [self.treeController addChild: sender];
    }
}

- (IBAction) addIndex: (id)sender
{
    NSUInteger indexes[2] = {0,0};
    NSIndexPath *path = [NSIndexPath indexPathWithIndexes: indexes length: 2];
    TreeNode *node = [[TreeNode alloc] init];
    
    node.value = @"Test";
    [self.treeController insertObject: node atArrangedObjectIndexPath: path];
}

- (IBAction) remove: (id)sender
{
    [self.treeController remove: sender];
}

- (IBAction) removeIndex: (id)sender
{
    NSUInteger indexes[2] = {0,1};
    NSIndexPath *path = [NSIndexPath indexPathWithIndexes: indexes length: 2];
    [self.treeController removeObjectAtArrangedObjectIndexPath: path];
}

- (void)outlineViewSelectionDidChange:(NSNotification *)notification
{
    NSLog(@"selectionIndexPaths = %@", self.selectionIndexPaths);
    NSLog(@"selectedObjects = %@", [self.treeController selectedObjects]);
}

@end
