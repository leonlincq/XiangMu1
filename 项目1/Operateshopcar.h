//
//  Operateshopcar.h
//  项目1
//
//  Created by Leonlincq on 16/8/11.
//  Copyright © 2016年 Leonlincq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Manageshopcar.h"
#import "Operateuserdatas.h"

@interface Operateshopcar : NSObject

typedef NSUInteger  LCQChooseUpShopCardata;
enum
{
    LCQChooseUpShopCardata_shopcarname      = 0x00,
    LCQChooseUpShopCardata_shopcarsaler     = 0x01,
    LCQChooseUpShopCardata_shopcarmoney     = 0x02,
    LCQChooseUpShopCardata_shopcarquantity  = 0x03,
    LCQChooseUpShopCardata_shopcarallmoney  = 0x04,
};

/** 创建表格 */
-(FILESTATUS)creatTableForShopCar;
/** 添加信息   shopcardata:添加新的物品到购物车 */
-(FILESTATUS)addToShopCar:(Manageshopcar *)shopcardata;
/** 选择用户   name:选择的用户，nil代表全选  array:读取出来保存的数组 */
-(FILESTATUS)selectShopCarByWho:(NSString*)buyer andWare:(NSString*)ware andSaveArray:(NSMutableArray**)array;
/** 删除用户   name:选择的用户 */
-(FILESTATUS)deletShopCarByWho:(NSString *)shopcarbuyer andWare:(NSString *)shopcarname;
/** 更新用户   waredata:用户信息表   who:更新为上架还是下架 */
-(FILESTATUS)upShopCarData:(Manageshopcar *)shopcardata withStatu:(LCQChooseUpShopCardata)statu;

@end
