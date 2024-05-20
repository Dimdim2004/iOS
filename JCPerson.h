//
//  JCPerson.h
//  test1
//
//  Created by wjc on 2024/5/12.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JCPerson : NSObject
@property (nonatomic, copy) NSString* name;
@property (nonatomic, assign) int age;
-(void)sayHello;
@end

NS_ASSUME_NONNULL_END
