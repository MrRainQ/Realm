//
//  User.h
//  RealmProject
//
//  Created by 蜂巢网络科技 on 2017/4/19.
//  Copyright © 2017年 fc. All rights reserved.
//

#import <Realm/Realm.h>
#import "Post.h"
@interface User : RLMObject

@property NSString *nickname;

// To-Many 对多 关系
//@property RLMArray <Post *><Post> *posts;
@property (readonly) RLMLinkingObjects *posts;

@end
