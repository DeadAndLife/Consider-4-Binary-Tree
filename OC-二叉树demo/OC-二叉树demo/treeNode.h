//
//  treeNode.h
//  OC-二叉树demo
//
//  Created by qingyun on 16/4/20.
//  Copyright © 2016年 张小东. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface treeNode : NSObject
@property(nonatomic,assign)int num;
-(instancetype)initWithNum:(int)num andTreeRoot:(treeNode *)treeRoot;//二叉树赋值
+(void)NSLogTree:(treeNode *)tree;//打印二叉树
-(void)deleTreePoint;//删除结点
-(void)findTreePoint:(int)n;//查找结点
-(int)treeHeight;//计算树高
@end
