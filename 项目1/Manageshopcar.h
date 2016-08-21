//
//  Manageshopcar.h
//  项目1
//
//  Created by Leonlincq on 16/8/11.
//  Copyright © 2016年 Leonlincq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Manageshopcar : NSObject

//用户购物车表

// 用户名 | 商品编号n | ...

@property (nonatomic,copy)      NSString    *shopcarbypeople;   //用户名       --关联
@property (nonatomic,copy)      NSString    *shopcarname;       //商品名称
@property (nonatomic,copy)      NSString    *shopcarsaler;      //商品来源
@property (nonatomic,assign)    NSInteger   shopcarmoney;       //商品金额
@property (nonatomic,assign)    NSInteger   shopcarquantity;    //商品数量
@property (nonatomic,assign)    NSInteger   shopcarallmoney;    //商品总金额

-(void)printfShopcarbypeople;
-(void)printfShopcarname;
-(void)printfShopcarsaler;
-(void)printfShopcarmoney;
-(void)printfShopcarquantity;
-(void)printfShopcarallmoney;
-(void)printfAllData;

@end
