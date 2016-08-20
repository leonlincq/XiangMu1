	//
//  Managemoney.m
//  项目1
//
//  Created by Leonlincq on 16/8/11.
//  Copyright © 2016年 Leonlincq. All rights reserved.
//

#import "Managemoney.h"

@implementation Managemoney

-(void)printfOpname
{
    const char *printfdata;
    printfdata = [self.opname UTF8String];
    if (printfdata == nil)
    {
        printf("操作用户：无");
    }
    else
    {
        printf("操作用户：%s",printfdata);
    }
}

-(void)printfAllmoney
{
    if (self.allmoney == 0)
    {
        printf("总金额：0");
    }
    else
    {
        printf("总金额：%ld",self.allmoney);
    }
}

-(void)printfOpaction
{
    if (self.opaction == nil)
    {
        printf("操作：无");
    }
    else if ([self.opaction isEqualToString:Deposit])
    {
        printf("操作：存款");
    }
    else if ([self.opaction isEqualToString:DrawMoney])
    {
        printf("操作：取款");
    }
    else if ([self.opaction isEqualToString:Transfers])
    {
        printf("操作：转账");
    }
    else if ([self.opaction isEqualToString:Buy])
    {
        printf("操作：买");
    }
}


-(void)printfOpmoney
{
    if (self.opmoney == 0)
    {
        printf("操作金额：0");
    }
    else
    {
        printf("操作金额：%ld",self.opmoney);
    }
}

-(void)printfOpmoneytopeople
{
    const char *printfdata;
    printfdata = [self.opmoneytopeople UTF8String];
    
    if (printfdata == nil)
    {
        printf("接收方：无");
    }
    else if ([self.opmoneytopeople isEqualToString:MySelf])
    {
        printf("接收方：自己");
    }
    else
    {
        printf("接收方：%s",printfdata);
    }
}

-(void)printfOptime
{
    const char *printfdata;
    printfdata = [self.optime UTF8String];

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
    [self printfOpname];
    printf(" ,");
    
    printf("1️⃣");
    [self printfAllmoney];
    printf(" ,");
    
    printf("2️⃣");
    [self printfOpaction];
    printf(" ,");
    
    printf("3️⃣");
    [self printfOpmoney];
    printf(" ,");
    
    printf("4️⃣");
    [self printfOpmoneytopeople];
    printf(" ,");

    printf("5️⃣");
    [self printfOptime];
    printf("\n");
}

- (id)copyWithZone:(nullable NSZone *)zone
{
    Managemoney *newop = [[Managemoney alloc]init];
    
    newop.opname            = [_opname mutableCopy];
    newop.allmoney          = _allmoney;
    newop.opaction          = [_opaction mutableCopy];
    newop.opmoney           = _opmoney;
    newop.opmoneytopeople   = [_opmoneytopeople mutableCopy];
    newop.optime            = [_optime mutableCopy];

    return newop;
}


- (NSString *)description
{
    return [NSString stringWithFormat:@"操作用户:%@ ,总资金:%ld ,操作:%@ ,操作金额:%ld ,接收者:%@ ,操作时间:%@ 。",_opname,_allmoney,[self returnOpaction],_opmoney,_opmoneytopeople,_optime];
}

-(NSString *)returnOpaction
{
    if ([self.opaction isEqualToString:Deposit])
    {
        return @"存款";
    }
    else if ([self.opaction isEqualToString:DrawMoney])
    {
        return @"取款";
    }
    else if ([self.opaction isEqualToString:Transfers])
    {
        return @"转账";
    }
    else if ([self.opaction isEqualToString:Buy])
    {
        return @"买";
    }
    
    return @"无";
}


@end
