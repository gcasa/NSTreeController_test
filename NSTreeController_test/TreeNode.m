//
//  TreeNode.m
//  NSTreeController_test
//
//  Created by Gregory Casamento on 3/2/23.
//

#import "TreeNode.h"

@implementation TreeNode

- (instancetype)initWithName:(NSString *)name {
    self = [super init];
    if (self) {
        _name = name;
        _children = [NSMutableArray array];
        _leaf = NO;
    }
    return self;
}

- (instancetype) copyWithZone:(NSZone *)zone
{
    TreeNode *copy = [[TreeNode alloc] init];
    
    copy.name = self.name;
    copy.children = [NSMutableArray arrayWithArray: self.children];
    copy.leaf = self.leaf;
    
    return copy;
}

@end
