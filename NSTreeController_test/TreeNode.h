//
//  TreeNode.h
//  NSTreeController_test
//
//  Created by Gregory Casamento on 3/2/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TreeNode : NSObject <NSCopying>

@property (nonatomic, strong) NSString *value;
@property (nonatomic, strong) NSMutableArray *children;
@property (nonatomic) BOOL leaf;
@property (nonatomic) NSUInteger count;
@property (nonatomic) BOOL isEnabled;

- (instancetype)initWithValue:(NSString *)value;

@end

NS_ASSUME_NONNULL_END
