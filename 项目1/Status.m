//
//  Status.m
//  项目1
//
//  Created by Leonlincq on 16/8/10.
//  Copyright © 2016年 Leonlincq. All rights reserved.
//

#import "Status.h"

@implementation Status


static Status *Mystatus = nil;

//==========================
//      状态初始化
//==========================
+(instancetype)statusShallOneData
{
    if (Mystatus == nil)
    {
        Mystatus = [[Status alloc]initStatu];
    }
    return Mystatus;
}

//==========================
//      状态初始化
//==========================
-(instancetype)initStatu
{
    self = [super init];
    if (self)
    {
        _StaBefore = MainInterface;
        _StaNow    = MainInterface;
    }
    return self;
}

//==========================
//      状态更改
//==========================
-(void)StatuChange:(LCQSTATUS)newstatus
{
    Mystatus.StaBefore = Mystatus.StaNow;
    Mystatus.StaNow = newstatus;
    
#if TEST == 1
    NSLog(@"StaBefore == %lx,StaNow == %lx",Mystatus.StaBefore,Mystatus.StaNow);
#endif
}

//==========================
//      状态码查看
//==========================
-(void)lookStatu
{
    NSLog(@"错误码 = 0x%lx%lx",Mystatus.StaBefore,Mystatus.StaNow);
}

//==========================
//      建表
//==========================
-(void)initTable
{
    //创建用户信息表，先这样，以后可能要把所有的表格初始化封装起来
    Operateuserdatas *MySqlP            = [[Operateuserdatas alloc]init];
    [MySqlP creatTable];
    
    //创建资金表
    Operatemoney *MyMoneyP              = [[Operatemoney alloc]init];
    [MyMoneyP creatTableForOpMoney];
    
    //创建商品表
    Operatewares *MyWaresP              = [[Operatewares alloc]init];
    [MyWaresP creatTableForWare];
    
    //创建购物车表
    Operateshopcar *MyShopcarP          = [[Operateshopcar alloc]init];
    [MyShopcarP creatTableForShopCar];
    
    //创建订单表
    Operateorder *MyOrderP              = [[Operateorder alloc]init];
    [MyOrderP creatTableForOrder];
    
    //创建评价表
    Operateevaluation *MyEvaluationP    = [[Operateevaluation alloc]init];
    [MyEvaluationP creatTableForEvaluation];
    
    //创建买卖表
    Operatebuyandsale *MyBuyandsaleP    = [[Operatebuyandsale alloc]init];
    [MyBuyandsaleP creatTableForOpBuyAndSale];
}




@end
