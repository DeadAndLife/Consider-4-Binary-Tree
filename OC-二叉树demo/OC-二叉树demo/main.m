//
//  main.m
//  OC-二叉树demo
//
//  Created by qingyun on 16/4/20.
//  Copyright © 2016年 张小东. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "treeNode.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        treeNode *treeRoot=[treeNode new];
        treeRoot.num=55;
        treeNode *t1=[[treeNode alloc] initWithNum:22 andTreeRoot:treeRoot];
        treeNode *t2=[[treeNode alloc] initWithNum:23 andTreeRoot:treeRoot];
        treeNode *t3=[[treeNode alloc] initWithNum:60 andTreeRoot:treeRoot];
        treeNode *t4=[[treeNode alloc] initWithNum:49 andTreeRoot:treeRoot];
        treeNode *t5=[[treeNode alloc] initWithNum:33 andTreeRoot:treeRoot];
        treeNode *t6=[[treeNode alloc] initWithNum:70 andTreeRoot:treeRoot];
        treeNode *t7=[[treeNode alloc] initWithNum:59 andTreeRoot:treeRoot];
        treeNode *t8=[[treeNode alloc] initWithNum:57 andTreeRoot:treeRoot];
        treeNode *t9=[[treeNode alloc] initWithNum:27 andTreeRoot:treeRoot];
        treeNode *t10=[[treeNode alloc] initWithNum:42 andTreeRoot:treeRoot];
        treeNode *t11=[[treeNode alloc] initWithNum:75 andTreeRoot:treeRoot];
        
        NSLog(@"~~~~~树干~~~~~");
        [treeNode NSLogTree:treeRoot];
        NSLog(@"~~~~~t1~~~~~");
        [treeNode NSLogTree:t1];
        NSLog(@"~~~~~t2~~~~~");
        [treeNode NSLogTree:t2];
        NSLog(@"~~~~~t3~~~~~");
        [treeNode NSLogTree:t3];
        NSLog(@"~~~~~t4~~~~~");
        [treeNode NSLogTree:t4];
        NSLog(@"~~~~~t5~~~~~");
        [treeNode NSLogTree:t5];
        NSLog(@"~~~~~t6~~~~~");
        [treeNode NSLogTree:t6];
        NSLog(@"~~~~~t7~~~~~");
        [treeNode NSLogTree:t7];
        NSLog(@"~~~~~t8~~~~~");
        [treeNode NSLogTree:t8];
        NSLog(@"~~~~~t9~~~~~");
        [treeNode NSLogTree:t9];
        NSLog(@"~~~~~t10~~~~~");
        [treeNode NSLogTree:t10];
        NSLog(@"~~~~~t11~~~~~");
        [treeNode NSLogTree:t11];
        
        [t3 deleTreePoint];
        NSLog(@"~~~~~树干~~~~~");
        [treeNode NSLogTree:treeRoot];
        
        NSLog(@"~~~~~查找~~~~~");
        [treeRoot findTreePoint:44];
        
        NSLog(@"~~~~~树高~~~~~");
        NSLog(@"%d",[treeRoot treeHeight]);
    }
    return 0;
}
