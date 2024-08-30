//
//  Model.m
//  lazyload
//
//  Created by wjc on 2024/8/29.
//

#import "Model.h"

@implementation Model

- (instancetype)initWithName:(NSString *)name items:(NSArray<NSString *> *)items collapsed:(BOOL)collapsed {
    self = [super init];
    if (self) {
        _name = name;
        _items = items;
        _collapsed = collapsed;
    }
    return self;
}

@end
