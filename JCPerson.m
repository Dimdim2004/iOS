//
//  JCPerson.m
//  test1
//
//  Created by wjc on 2024/5/12.
//

#import "JCPerson.h"

@implementation JCPerson
-(void)sayHello {
    NSLog(@"%@ 你好啊！",self.name);
}
-(id)copyWithZone : (NSZone*) zone {
    JCPerson* copy = [[[self class] allocWithZone:zone] init];
    copy.name = _name;
    copy.age = _age;
    return copy;
}
@end
