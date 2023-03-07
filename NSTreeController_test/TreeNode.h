//
//  TreeNode.h
//  NSTreeController_test
//
//  Created by Gregory Casamento on 3/2/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TreeNode : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSMutableArray *children;

- (instancetype)initWithName:(NSString *)name;

@end

NS_ASSUME_NONNULL_END
