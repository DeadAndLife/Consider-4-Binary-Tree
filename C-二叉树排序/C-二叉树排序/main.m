//
//  main.m
//  C-二叉树排序
//
//  Created by qingyun on 16/4/19.
//  Copyright © 2016年 张小东. All rights reserved.
//

#import <Foundation/Foundation.h>
#pragma mark - 定义二叉树结点
typedef struct _TREE_NODE
{
    int data;
    struct _TREE_NODE* parent;
    struct _TREE_NODE* left_child;
    struct _TREE_NODE* right_child;
}TREE_NODE;
#pragma mark - 创建二叉树结点
TREE_NODE* create_tree_node(int data)
{
    TREE_NODE* pTreeNode = NULL;
    pTreeNode = (TREE_NODE*)malloc(sizeof(TREE_NODE));
    assert(NULL != pTreeNode);//assert是宏，而不是函数  是代码执行之前必须具备的特性，这里可简单理解为if判断。
    
    memset(pTreeNode, 0, sizeof(TREE_NODE));//memset函数原型(void *s,int ch,size_t n);将s所指向的某一块内存中的前n个 字节的内容全部设置为ch指定的ASCII值， 第一个值为指定的内存地址，块的大小由第三个参数指定，这个函数通常为新申请的内存做初始化工作， 其返回值为指向s的指针。
    //注意：sizeof()中不能用pTreeNode(对象),否则可能导致指针降级。
    pTreeNode->data = data;
    return pTreeNode;
}
#pragma mark - 查找数据
TREE_NODE* find_data_in_tree_node(const TREE_NODE* pTreeNode, int data)
{
    if(NULL == pTreeNode){
        return NULL;
    }
    if(data == pTreeNode->data){
        return (TREE_NODE*)pTreeNode;
    }else if(data < pTreeNode->data){
        return find_data_in_tree_node(pTreeNode->left_child, data);
    }else{
        return find_data_in_tree_node(pTreeNode->right_child, data);
    }
}
#pragma mark - 数据统计
int count_node_number_in_tree(const TREE_NODE* pTreeNode)
{
    if(NULL == pTreeNode){
        return 0;
    }else{
    return 1 + count_node_number_in_tree(pTreeNode->left_child)
    + count_node_number_in_tree(pTreeNode->right_child);
    }
}
#pragma mark - 打印结点数据
void print_all_node_data(const TREE_NODE* pTreeNode)
{
    if(pTreeNode){
        print_all_node_data(pTreeNode->left_child);
        printf("%d\n", pTreeNode->data);
        print_all_node_data(pTreeNode->right_child);
    }
}
#pragma mark - 统计树的高度
int calculate_height_of_tree(const TREE_NODE* pTreeNode)
{
    int left, right;
    if(NULL == pTreeNode){
        return 0;
    }else{
    left = calculate_height_of_tree(pTreeNode->left_child);
    right = calculate_height_of_tree(pTreeNode->right_child);
    return (left > right) ? (left + 1) : (right + 1);
    }
}
int main()
{
    struct _TREE_NODE *treeRoot = create_tree_node(45);
    treeRoot->left_child = create_tree_node(24);
    treeRoot->right_child = create_tree_node(55);
    treeRoot->left_child->left_child = create_tree_node(12);
    treeRoot->left_child->right_child = create_tree_node(37);
    treeRoot->right_child->left_child = create_tree_node(53);
    treeRoot->right_child->right_child = create_tree_node(60);
    treeRoot->left_child->right_child->left_child = create_tree_node(28);
    treeRoot->left_child->right_child->right_child = create_tree_node(40);
    treeRoot->right_child->right_child->right_child = create_tree_node(70);
    print_all_node_data(treeRoot);
    printf("树高%d\n",calculate_height_of_tree(treeRoot));
}