//
//  main.m
//  test1
//
//  Created by wjc on 2024/5/12.
//

#import <Foundation/Foundation.h>
#import "JCPerson.h"
#import "JCCricle.h"
#import "JCRectangle.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        JCPerson *a = [[JCPerson alloc] init];
        a.name = @"aa";
        a.age = 2;
        JCPerson *copy = [a copy];
        NSLog(@"%@", copy.name);
        NSLog(@"%d", copy.age);
    }
    return 0;
}
