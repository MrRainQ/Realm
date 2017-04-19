//
//  Post.m
//  RealmProject
//
//  Created by 蜂巢网络科技 on 2017/4/19.
//  Copyright © 2017年 fc. All rights reserved.
//

#import "Post.h"
#import "User.h"
@implementation Post

// 不可空属性，决定属性是否可以为nil
+ (NSArray<NSString *> *)requiredProperties
{
    
    return @[@"title"];
    
    // 添加到数据库是title必须有值
}


// 忽略属性
+ (NSArray<NSString *> *)ignoredProperties
{
    return @[];

}

//// 反向关系
//+ (NSDictionary<NSString *,RLMPropertyDescriptor *> *)linkingObjectsProperties
//{
//    return @{
//             @"author" :[RLMPropertyDescriptor descriptorWithClass:User.class propertyName:@"posts"]
//             };
//}

// 默认值
+ (NSDictionary *)defaultPropertyValues
{
    return @{
             @"look" :@(0)
             };
}

// 索引属性 支持NSString，NSNumber（包括常量）NSDate
+ (NSArray<NSString *> *)indexedProperties
{
    return @[@"title",@"timestamp"];
}

// 主键 唯一性
+ (NSString *)primaryKey
{
    return @"identifer";
}

@end
