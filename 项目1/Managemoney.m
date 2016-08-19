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
        printf("接收者：无");
    }
    else
    {
        printf("接收者：%s",printfdata);
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
    [self printfOpmoney];
    printf(" ,");
    
    printf("3️⃣");
    [self printfOpmoneytopeople];
    printf(" ,");
    
    printf("4️⃣");
    [self printfOptime];
    printf(" ,");
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"操作用户:%@ ,总资金:%ld ,操作金额:%ld ,接收者:%@ ,操作时间:%@ 。",_opname,_allmoney,_opmoney,_opmoneytopeople,_optime];
}

@end
