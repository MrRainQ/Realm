//
//  Post.h
//  RealmProject
//
//  Created by 蜂巢网络科技 on 2017/4/19.
//  Copyright © 2017年 fc. All rights reserved.
//

#import <Realm/Realm.h>
RLM_ARRAY_TYPE(Post);
@class User;
@interface Post : RLMObject

// id
@property NSString *identifer;


// title 标题
@property NSString *title;

// author To-One 关系 对一关系
@property User *author;
//@property (readonly) RLMLinkingObjects *author;


// 时间戳
@property NSDate *timestamp;

// 内容
@property NSData *content;

// 浏览量 int long long long
@property NSInteger look;
//@property NSNumber <RLMInt>* look;

// 回帖 对多关系
@property RLMArray <Post *><Post> *comments;

// 置顶
//@property BOOL isTop;
@property NSNumber <RLMBool> *isTop;

// 常量在realm数据库中是不能为空的，没有设置初始值，就会抛出异常
// 不支持的类型 CGFloat ，请使用 float ， double




@end
