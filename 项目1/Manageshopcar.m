//
//  Manageshopcar.m
//  项目1
//
//  Created by Leonlincq on 16/8/11.
//  Copyright © 2016年 Leonlincq. All rights reserved.
//

#import "Manageshopcar.h"

@implementation Manageshopcar

-(void)printfShopcarbypeople;
{
    const char *printfdata;
    printfdata = [self.shopcarbypeople UTF8String];
    if (printfdata == nil)
    {
        printf("买家：无");
    }
    else
    {
        printf("买家：%s",printfdata);
    }
}

-(void)printfShopcarname
{
    const char *printfdata;
    printfdata = [self.shopcarname UTF8String];
    if (printfdata == nil)
    {
        printf("商品名：无");
    }
    else
    {
        printf("商品名：%s",printfdata);
    }
}

-(void)printfShopcarsaler
{
    const char *printfdata;
    printfdata = [self.shopcarsaler UTF8String];
    if (printfdata == nil)
    {
        printf("卖家：无");
    }
    else
    {
        printf("卖家：%s",printfdata);
    }
}

-(void)printfShopcarmoney
{
    if (self.shopcarmoney == 0)
    {
        printf("单价：0");
    }
    else
    {
        printf("单价：%ld",self.shopcarmoney);
    }
}

-(void)printfShopcarquantity
{
    if (self.shopcarquantity == 0)
    {
        printf("数量：0");
    }
    else
    {
        printf("数量：%ld",self.shopcarquantity);
    }
}

-(void)printfShopcarallmoney
{
    if (self.shopcarallmoney == 0)
    {
        printf("总价：0");
    }
    else
    {
        printf("总价：%ld",self.shopcarallmoney);
    }
}

-(void)printfAllData
{
    printf("0️⃣");
    [self printfShopcarbypeople];
    printf(" ,");
    
    printf("1️⃣");
    [self printfShopcarname];
    printf(" ,");
    
    printf("2️⃣");
    [self printfShopcarsaler];
    printf(" ,");
    
    printf("3️⃣");
    [self printfShopcarmoney];
    printf(" ,");
    
    printf("4️⃣");
    [self printfShopcarquantity];
    printf(" ,");
    
    printf("5️⃣");
    [self printfShopcarallmoney];
    printf("\n");
}

- (id)copyWithZone:(nullable NSZone *)zone
{
    Manageshopcar *newop = [[Manageshopcar alloc]init];
    
    newop.shopcarbypeople   = [_shopcarbypeople mutableCopy];
    newop.shopcarname       = [_shopcarname mutableCopy];
    newop.shopcarsaler      = [_shopcarsaler mutableCopy];
    newop.shopcarmoney      = _shopcarmoney;
    newop.shopcarquantity   = _shopcarquantity;
    newop.shopcarallmoney   = _shopcarallmoney;
    
    return newop;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"买家:%@ ,商品名:%@ ,卖家:%@ ,单价:%ld ,数量:%ld ,总价:%ld 。",_shopcarbypeople,_shopcarname,_shopcarsaler,_shopcarmoney,_shopcarquantity,_shopcarallmoney];
}

@end
