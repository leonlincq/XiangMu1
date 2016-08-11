//
//  Managewares.h
//  项目1
//
//  Created by Leonlincq on 16/8/11.
//  Copyright © 2016年 Leonlincq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Managewares : NSObject

//商品信息表

//更新标记位 | 分类 | 商品编号 | 商品名 | 金额 | 评价用户n | 评价分数n | ...

@property (nonatomic,assign)    NSUInteger  wareflag;   //更新标记位?
@property (nonatomic,copy)      NSString    *wareclass; //分类
@property (nonatomic,assign)    NSUInteger  warenum;    //商品编号
@property (nonatomic,copy)      NSString    *warename;  //商品名
@property (nonatomic,assign)    NSUInteger  wareprice;  //金额
@property (nonatomic,copy)      NSString    *wareuser;  //评价用户
@property (nonatomic,copy)      NSString    *warejudge; //评价分数


@end
