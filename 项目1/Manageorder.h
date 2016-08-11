//
//  Manageorder.h
//  项目1
//
//  Created by Leonlincq on 16/8/11.
//  Copyright © 2016年 Leonlincq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Manageorder : NSObject

//用户订单表

//更新标记位？ | 用户名 | 订单编号 | 订单操作/状态 | 商品编号n |...

@property (nonatomic,assign)    NSUInteger  orderflag;  //更新标记位?
@property (nonatomic,copy)      NSString    *name;      //用户名       --关联
@property (nonatomic,assign)    NSUInteger  *ordernum;  //订单编号
@property (nonatomic,assign)    NSUInteger  *ordersta;  //订单操作/状态
@property (nonatomic,assign)    NSUInteger  *warenum;   //商品编号



@end
