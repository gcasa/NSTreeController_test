//
//  TreeNode.m
//  NSTreeController_test
//
//  Created by Gregory Casamento on 3/2/23.
//

#import "TreeNode.h"

@implementation TreeNode

- (instancetype) initWithValue:(NSString *)value
{
    self = [super init];
    if (self) {
        _value = value;
        _children = [NSMutableArray array];
        _leaf = NO;
    }
    return self;
}

- (instancetype) copyWithZone:(NSZone *)zone
{
    TreeNode *copy = [[TreeNode alloc] init];
    
    copy.value = self.value;
    copy.children = [NSMutableArray arrayWithArray: self.children];
    copy.leaf = self.leaf;
    
    return copy;
}

- (NSString *) description
{
  return [NSString stringWithFormat: @"%@ = <%@, %@, %@>",
		   [super description], _value, _children, (_leaf?@"YES":@"NO")];
}

@end
