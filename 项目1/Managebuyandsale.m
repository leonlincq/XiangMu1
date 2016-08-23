//
//  Managebuyandsale.m
//  项目1
//
//  Created by etcxm on 16/8/23.
//  Copyright © 2016年 etc. All rights reserved.
//

#import "Managebuyandsale.h"

@implementation Managebuyandsale

-(void)printfBASopname
{
    const char *printfdata;
    printfdata = [self.basopname UTF8String];
    if (printfdata == nil)
    {
        printf("操作用户：无");
    }
    else
    {
        printf("操作用户：%s",printfdata);
    }
}

-(void)printfBASallmoney
{
    if (self.basallmoney == 0)
    {
        printf("操作后剩余总金额：0");
    }
    else
    {
        printf("操作后剩余总金额：%ld",self.basallmoney);
    }
}

-(void)printfBASordernumb
{
    if (self.basordernumb == 0)
    {
        printf("订单号：0");
    }
    else
    {
        printf("订单号：%ld",self.basordernumb);
    }
}

-(void)printfBASopaction
{
    if (self.basopaction == nil)
    {
        printf("操作：无");
    }
    else if ([self.basopaction isEqualToString:BuyerToAdmin])
    {
        printf("操作：钱汇给管理者➡️");
    }
    else if ([self.basopaction isEqualToString:BuyerToSaler])
    {
        printf("操作：钱汇给卖家➡️");
    }
    else if ([self.basopaction isEqualToString:SalerSuccess])
    {
        printf("操作：成功卖出商品⬅️");
    }
    else if ([self.basopaction isEqualToString:CancelByBuyer])
    {
        printf("操作：取消订单钱回给买家⬅️");
    }
    else if ([self.basopaction isEqualToString:RefundByBuyer])
    {
        printf("操作：退款钱回给买家⬅️");
    }
}

-(void)printfBASopmoney
{
    if (self.basopmoney == 0)
    {
        printf("操作金额：0");
    }
    else
    {
        printf("操作金额：%ld",self.basopmoney);
    }
}
-(void)printfBASopmoneytopeople
{
    const char *printfdata;
    printfdata = [self.basopmoneytopeople UTF8String];
    
    if (printfdata == nil)
    {
        printf("对象：无");
    }
    else
    {
        printf("对象：%s",printfdata);
    }
}

-(void)printfBASoptime
{
    const char *printfdata;
    printfdata = [self.basoptime UTF8String];
    
    if (printfdata == nil)
    {
        printf("操作时间：0");
    }
    else
    {
        printf("操作时间：%s",printfdata);
    }
}

-(void)printfAllData
{
    printf("0️⃣");
    [self printfBASopname];
    printf(" ,");
    
    printf("1️⃣");
    [self printfBASallmoney];
    printf(" ,");
    
    printf("2️⃣");
    [self printfBASordernumb];
    printf(" ,");
    
    printf("3️⃣");
    [self printfBASopaction];
    printf(" ,");
    
    printf("4️⃣");
    [self printfBASopmoney];
    printf(" ,");
    
    printf("5️⃣");
    [self printfBASopmoneytopeople];
    printf(" ,");
    
    printf("6️⃣");
    [self printfBASoptime];
    printf("\n");
}

- (id)copyWithZone:(nullable NSZone *)zone
{
    Managebuyandsale *newop = [[Managebuyandsale alloc]init];
    
    newop.basopname             = [_basopname mutableCopy];
    newop.basallmoney           = _basallmoney;
    newop.basordernumb          = _basordernumb;
    newop.basopaction           = [_basopaction mutableCopy];
    newop.basopmoney            = _basopmoney;
    newop.basopmoneytopeople    = [_basopmoneytopeople mutableCopy];
    newop.basoptime             = [_basoptime mutableCopy];
    
    return newop;
}


@end
