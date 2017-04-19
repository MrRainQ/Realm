//
//  User.m
//  RealmProject
//
//  Created by 蜂巢网络科技 on 2017/4/19.
//  Copyright © 2017年 fc. All rights reserved.
//

#import "User.h"

@implementation User

// 反向关系
+ (NSDictionary<NSString *,RLMPropertyDescriptor *> *)linkingObjectsProperties
{
    return @{
             @"posts": [RLMPropertyDescriptor descriptorWithClass:Post.class propertyName:@"author"]
             };
}


@end
