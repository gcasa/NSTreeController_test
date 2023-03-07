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
    }
    return self;
}

@end
