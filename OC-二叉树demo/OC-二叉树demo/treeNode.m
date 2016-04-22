//
//  treeNode.m
//  OC-二叉树demo
//
//  Created by qingyun on 16/4/20.
//  Copyright © 2016年 张小东. All rights reserved.
//

#import "treeNode.h"
BOOL i=NO;
@interface treeNode ()
@property(nonatomic,strong)treeNode *leftFeeder;
@property(nonatomic,strong)treeNode *rightFeeder;
@property(nonatomic,assign)treeNode *rootFeeder;
@end

@implementation treeNode
#pragma mark - 初始化
-(instancetype)initWithNum:(int)num andTreeRoot:(treeNode *)treeRoot
{
    _num=num;
    [self treeLink:treeRoot];
    return self;
}
#pragma mark - 二叉树关系创建
-(void)treeLink:(treeNode *)tree
{
    if (self.num>=tree.num) {
        if (tree.rightFeeder) {
            [self treeLink:tree.rightFeeder];
        }else{
            tree.rightFeeder=self;
            self.rootFeeder=tree;
        }
    }else{
        if (tree.leftFeeder) {
            [self treeLink:tree.leftFeeder];
        }else{
            tree.leftFeeder=self;
            self.rootFeeder=tree;
        }
    }
}
#pragma mark - 左旋
#pragma mark - 右旋
#pragma mark - 计算树高
-(int)treeHeight
{
    int l,r;
    if (self==nil) {
        return 0;
    }else{
        l=[self.leftFeeder treeHeight];
        r=[self.rightFeeder treeHeight];
        return l>r?(l+1):(r+1);
    }
}
#pragma mark - 查找二叉树结点
-(void)findTreePoint:(int)n
{
    [self findPoint:n];
    if (i==NO) {
        NSLog(@"没找到%d",n);
    }
}
-(void)findPoint:(int)n
{
    if (self.num==n) {
        [treeNode NSLogTree:self];
        i=YES;
    }else{
        [self.leftFeeder findPoint:n];
        [self.rightFeeder findPoint:n];
    }
}
#pragma mark - 删除二叉树结点
-(void)deleTreePoint
{
    if ([self isEqual:self.rootFeeder.leftFeeder]) {
        self.rootFeeder.leftFeeder=nil;
    }
    if ([self isEqual:self.rootFeeder.rightFeeder]) {
        self.rootFeeder.rightFeeder=nil;
    }
    if (self.rightFeeder||self.leftFeeder) {
        [self.leftFeeder treeLink:self.rootFeeder];
        [self.rightFeeder treeLink:self.rootFeeder];
    }
    self.rightFeeder=nil;
    self.leftFeeder=nil;
    self.rootFeeder=nil;
}
#pragma mark - 打印二叉树
+(void)NSLogTree:(treeNode *)tree
{
    if (tree) {
        [self NSLogTree:tree.leftFeeder];
        NSLog(@"%@",tree);
        [self NSLogTree:tree.rightFeeder];
    }
}
#pragma mark - 重写打印方法
-(NSString *)description
{
    return [NSString stringWithFormat:@"\t%d",self.num];
}
@end
