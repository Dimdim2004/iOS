//
//  Model.h
//  lazyload
//
//  Created by wjc on 2024/8/29.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Model : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSArray<NSString *> *items;
@property (nonatomic, assign) BOOL collapsed;

- (instancetype)initWithName:(NSString *)name items:(NSArray<NSString *> *)items collapsed:(BOOL)collapsed;

@end

NS_ASSUME_NONNULL_END
