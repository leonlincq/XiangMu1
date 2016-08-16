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

// 分类 | 商品编号 | 商品名 | 金额 | 评价用户n | 评价分数n | ...

@property (nonatomic,copy)      NSString    *wareclass; //分类
@property (nonatomic,copy)      NSString    *warenum;   //商品编号
@property (nonatomic,copy)      NSString    *warename;  //商品名
@property (nonatomic,copy)      NSString    *wareprice; //金额
@property (nonatomic,copy)      NSString    *wareuser;  //评价用户
@property (nonatomic,copy)      NSString    *warejudge; //评价分数


@end
