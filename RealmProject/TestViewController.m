//
//  TestViewController.m
//  RealmProject
//
//  Created by 蜂巢网络科技 on 2017/4/20.
//  Copyright © 2017年 fc. All rights reserved.
//

#import "TestViewController.h"
#import "AreaForDataEntity.h"
#import <Realm/Realm.h>
@interface TestViewController ()
@property (nonatomic,strong) RLMRealm *realm;
@end

@implementation TestViewController


- (NSString*) copyFile2Documents:(NSString*)fileName
{
    NSFileManager*fileManager =[NSFileManager defaultManager];
    NSError*error;
    NSArray*paths =NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    NSString*documentsDirectory =[paths objectAtIndex:0];
    
    NSString*destPath =[documentsDirectory stringByAppendingPathComponent:fileName];
    
    //  如果目标目录也就是(Documents)目录没有数据库文件的时候，才会复制一份，否则不复制
    if(![fileManager fileExistsAtPath:destPath]){
        NSString* sourcePath =[[NSBundle mainBundle] pathForResource:@"default" ofType:@"realm"];
        [fileManager copyItemAtPath:sourcePath toPath:destPath error:&error];
        NSLog(@"拷贝");
    }else{
        NSLog(@"没拷贝");
    }
    return destPath;
}


- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.title = @"测试数据库";

    // 将本地数据库拷贝到document中，然后在进行数据读取
    [self copyFile2Documents:@"default.realm"];
    
    RLMResults *results =  [AreaForDataEntity allObjects];


 
    
    for (AreaForDataEntity *area in results) {
        NSLog(@"%@",area.ShortName);
    }
}

@end
