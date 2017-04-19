//
//  ViewController.m
//  RealmProject
//
//  Created by rocq on 2017/4/19.
//  Copyright © 2017年 fc. All rights reserved.
//

#import "ViewController.h"
#import <Realm/Realm.h>
#import "Post.h"
#import "User.h"
@interface ViewController ()

@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    /*
    Post *post = [[Post alloc]initWithValue:@{@"title":@"untitled"}];
    User *user = [[User alloc]init];
    
    post.author = user;
    
    RLMRealm *r = [RLMRealm defaultRealm];
    
    [r transactionWithBlock:^{
       
        [r addObject:post];
        [r addObject:user];
        
        NSLog(@"%@",user.posts);
    }];
    */
    
    // 数据的增删改查

    Post *post = [[Post alloc]initWithValue:@{@"title":@"untitled"}];
    post.identifer = [[NSDate date] description];
    
    RLMRealm *r = [RLMRealm defaultRealm];
    
    // 增
    [r transactionWithBlock:^{
        
        // 写入事物
        [r addObject:post];
        
    }];
    
    
    // 删
    [r transactionWithBlock:^{
//        [r deleteObject:post];
//        [r deleteAllObjects];
    }];
    
    // 改
    
    // 直接更新
    [r transactionWithBlock:^{
        post.timestamp = [NSDate date];
    }];

    
    // 通过主键更新
    Post *postNew = [[Post alloc]init];
    postNew.title= @"newTitle";
    postNew.identifer = @"1";
    postNew.timestamp = [NSDate date];
    [r transactionWithBlock:^{
        [r addOrUpdateObject:postNew];
    }];
    
    
    // 查
    RLMResults *results =  [Post objectsWhere:@"title == %@",@"untitled"];
    Post *postBeFound = [results firstObject];
    [r transactionWithBlock:^{
        post.title = @"Test for Change";
    }];
    
    NSLog(@"%@",postBeFound);

    // 批量修改
    RLMResults *allPosts = [Post allObjects];
    
    [r transactionWithBlock:^{
        [allPosts setValue:[NSDate date] forKey:@"timestamp"];
    }];
    
    NSLog(@"%@",allPosts);
    
    
    // 综合查询
    // 检索范围 浏览量大于100的帖子
    RLMResults *postThatViewsBiggerThan100 = [Post objectsWhere:@"look > 100"];

    // 检索浏览量 10 到 100的帖子，有多种方法

    RLMResults *postBetween10to100 = [Post objectsWhere:@"look > 10 AND look < 100"];
    
    RLMResults *postBetween10to100_2 = [Post objectsWhere:@"look BETWEEN {10,100}"];
    
    
    // 检索标题中含有‘Test’的帖子[c]不区分大小写
    RLMResults *postThatHasTest = [Post objectsWhere:@"title CONTAINS[c] 'Test'"];
    
    // 评论大于10，浏览大于100的
    RLMResults *results_2 = [Post objectsWhere:@"comments.@count > 10"];
    RLMResults *final = [results_2 objectsWhere:@"look > 100"];
    
    // 结果排序
    // 按时间戳
    [final sortedResultsUsingProperty:@"timestamp" ascending:NO];
    
    
    // 分页
    // Realm没有分页功能
    // 惯性加载
    
    
}




@end
