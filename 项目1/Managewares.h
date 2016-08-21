//
//  Managewares.h
//  项目1
//
//  Created by Leonlincq on 16/8/11.
//  Copyright © 2016年 Leonlincq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Managewares : NSObject<NSCopying>

#define IT          @"IT"
#define EAT         @"EAT"
#define LIFE        @"LIFE"
#define STUDENTTOOL @"STUDENTTOOL"

#define OTHER       @"OTHER"

#define UpWare      @"UpWare"
#define DownWare    @"DownWare"



//商品信息表
// 姓名 | 上架状态 | 商品名 | 商品分类 | 金额 | 数量 |
//          上架
//          下架


@property (nonatomic,copy)      NSString    *warebypeople;  //谁的商品          --关联
@property (nonatomic,copy)      NSString    *wareflag;      //上架还是下架
@property (nonatomic,copy)      NSString    *warename;      //商品名           --主键
@property (nonatomic,copy)      NSString    *wareclass;     //商品分类
@property (nonatomic,assign)    NSInteger   wareprice;      //金额
@property (nonatomic,assign)    NSInteger   waresum;        //商品数量

-(void)printfWarebypeople;
-(void)printfWareflag;
-(void)printfWarename;
-(void)printfWareclass;
-(void)printfWareprice;
-(void)printfWaresum;
-(void)printfAllData;

@end
