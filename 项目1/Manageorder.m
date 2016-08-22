//
//  Manageorder.m
//  项目1
//
//  Created by Leonlincq on 16/8/11.
//  Copyright © 2016年 Leonlincq. All rights reserved.
//

#import "Manageorder.h"

@implementation Manageorder

-(void)printfOrderbuyer
{
    const char *printfdata;
    printfdata = [self.orderbuyer UTF8String];
    if (printfdata == nil)
    {
        printf("买家：无");
    }
    else
    {
        printf("买家：%s",printfdata);
    }
}

-(void)printfOrdernumb
{
    if (self.ordernumb == 0)
    {
        printf("订单编号：0");
    }
    else
    {
        printf("订单编号：%ld",self.ordernumb);
    }
}

-(void)printfOrdersta
{
    if (self.ordersta == nil)
    {
        printf("状态：无");
    }
    else if([self.ordersta isEqualToString:Create] )
    {
        printf("状态：创立订单并成功付款(等待卖家发货)");
    }
    else if([self.ordersta isEqualToString:SendWare] )
    {
        printf("状态：卖家已发货");
    }
    else if([self.ordersta isEqualToString:SureWare] )
    {
        printf("状态：确认收货并评价（已完成订单）");
    }
    else if([self.ordersta isEqualToString:Cancel] )
    {
        printf("状态：已取消订单");
    }
    else if([self.ordersta isEqualToString:RequestRefund] )
    {
        printf("状态：请求退款(等待卖家确认)");
    }
//    else if([self.ordersta isEqualToString:AgreeRefund] )
//    {
//        printf("状态：卖家同意退款");
//    }
    else if([self.ordersta isEqualToString:RefundOK] )
    {
        printf("状态：退款完成");
    }
}

-(void)printfOrderware
{
    const char *printfdata;
    printfdata = [self.orderware UTF8String];
    if (printfdata == nil)
    {
        printf("商品名：无");
    }
    else
    {
        printf("商品名：%s",printfdata);
    }
}

-(void)printfOrdersaler
{
    const char *printfdata;
    printfdata = [self.ordersaler UTF8String];
    if (printfdata == nil)
    {
        printf("卖家：无");
    }
    else
    {
        printf("卖家：%s",printfdata);
    }
}

-(void)printfOrdermoney
{
    if (self.ordermoney == 0)
    {
        printf("单价：0");
    }
    else
    {
        printf("单价：%ld",self.ordermoney);
    }
}

-(void)printfOrderquantity
{
    if (self.orderquantity == 0)
    {
        printf("数量：0");
    }
    else
    {
        printf("数量：%ld",self.orderquantity);
    }
}

-(void)printfOrderallmoney
{
    if (self.orderallmoney == 0)
    {
        printf("总价：0");
    }
    else
    {
        printf("总价：%ld",self.orderallmoney);
    }
}

-(void)printfOrderaddress
{
    const char *printfdata;
    printfdata = [self.orderaddress UTF8String];
    if (printfdata == nil)
    {
        printf("地址：无");
    }
    else
    {
        printf("地址：%s",printfdata);
    }
}

-(void)printfAllData
{
    printf("0️⃣");
    [self printfOrderbuyer];
    printf(" ,");
    
    printf("1️⃣");
    [self printfOrdernumb];
    printf(" ,");
    
    printf("2️⃣");
    [self printfOrdersta];
    printf(" ,");
    
    printf("3️⃣");
    [self printfOrderware];
    printf(" ,");
    
    printf("4️⃣");
    [self printfOrdersaler];
    printf(" ,");
    
    printf("5️⃣");
    [self printfOrdermoney];
    printf(" ,");
    
    printf("6️⃣");
    [self printfOrderquantity];
    printf(" ,");
    
    printf("7️⃣");
    [self printfOrderallmoney];
    printf(" ,");
    
    printf("8️⃣");
    [self printfOrderaddress];
     printf("\n");
}

- (id)copyWithZone:(nullable NSZone *)zone
{
    Manageorder *newop = [[Manageorder alloc]init];
    
    newop.orderbuyer    = [_orderbuyer mutableCopy];
    newop.ordernumb     = _ordernumb;
    newop.ordersta      = [_ordersta mutableCopy];
    newop.orderware     = [_orderware mutableCopy];
    newop.ordersaler    = [_ordersaler mutableCopy];
    newop.ordermoney    = _ordermoney;
    newop.orderquantity = _orderquantity;
    newop.orderallmoney = _orderallmoney;
     newop.orderaddress = [_orderaddress mutableCopy];
    
    return newop;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"买家:%@ ,订单编号:%ld ,状态:%@ ,商品名:%@ ,卖家:%@ ,单价:%ld ,数量:%ld ,总价:%ld ,地址:%@ 。",_orderbuyer,_ordernumb,[self returnOrdersta],_orderware,_ordersaler,_ordermoney,_orderquantity,_orderallmoney,_orderaddress];
}


-(NSString *)returnOrdersta
{
    if ([_ordersta isEqualToString:Create])
    {
        return @"创立订单并成功付款(等待卖家发货)";
    }
    else if ([_ordersta isEqualToString:SendWare])
    {
        return @"卖家已发货";
    }
    else if ([_ordersta isEqualToString:SureWare])
    {
        return @"确认收货并评价（已完成订单）";
    }
    else if ([_ordersta isEqualToString:Cancel])
    {
        return @"已取消订单";
    }
    else if ([_ordersta isEqualToString:RequestRefund])
    {
        return @"请求退款(等待卖家确认)";
    }
//    else if ([_ordersta isEqualToString:AgreeRefund])
//    {
//        return @"卖家同意退款";
//    }
    else if ([_ordersta isEqualToString:RefundOK])
    {
        return @"退款完成";
    }
    
    return @"无";
}

@end
