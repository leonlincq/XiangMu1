//
//  Managewares.m
//  项目1
//
//  Created by Leonlincq on 16/8/11.
//  Copyright © 2016年 Leonlincq. All rights reserved.
//

#import "Managewares.h"

@implementation Managewares

-(void)printfWarebypeople
{
    const char *printfdata;
    printfdata = [self.warebypeople UTF8String];
    if (printfdata == nil)
    {
        printf("卖家：无");
    }
    else
    {
        printf("卖家：%s",printfdata);
    }
}

-(void)printfWareflag
{
    if (self.wareflag == nil)
    {
        printf("状态：无");
    }
    else if([self.wareflag isEqualToString:UpWare] )
    {
        printf("状态：上架");
    }
    else if([self.wareflag isEqualToString:DownWare] )
    {
        printf("状态：下架");
    }
}
-(void)printfWarename
{
    const char *printfdata;
    printfdata = [self.warename UTF8String];
    if (printfdata == nil)
    {
        printf("商品名：无");
    }
    else
    {
        printf("商品名：%s",printfdata);
    }
}

-(void)printfWareclass
{
    if (self.wareflag == nil)
    {
        printf("分类：无");
    }
    else if([self.wareflag isEqualToString:IT] )
    {
        printf("分类：数码");
    }
    else if([self.wareflag isEqualToString:EAT] )
    {
        printf("分类：食物");
    }
    else if([self.wareflag isEqualToString:LIFE] )
    {
        printf("分类：生活");
    }
    else if([self.wareflag isEqualToString:STUDENTTOOL] )
    {
        printf("分类：学习用品");
    }
    else if([self.wareflag isEqualToString:OTHER] )
    {
        printf("分类：其他");
    }
}
-(void)printfWareprice
{
    if (self.wareprice == 0)
    {
        printf("单价：0");
    }
    else
    {
        printf("单价：%ld",self.wareprice);
    }
}
-(void)printfWaresum
{
    if (self.waresum == 0)
    {
        printf("数量：0");
    }
    else
    {
        printf("数量：%ld",self.waresum);
    }
}
-(void)printfAllData
{
    printf("0️⃣");
    [self printfWarebypeople];
    printf(" ,");
    
    printf("1️⃣");
    [self printfWareflag];
    printf(" ,");
    
    printf("2️⃣");
    [self printfWarename];
    printf(" ,");
    
    printf("3️⃣");
    [self printfWareclass];
    printf(" ,");
    
    printf("4️⃣");
    [self printfWareprice];
    printf(" ,");
    
    printf("5️⃣");
    [self printfWaresum];
    printf("\n");
}

- (id)copyWithZone:(nullable NSZone *)zone
{
    Managewares *newop = [[Managewares alloc]init];
    
    newop.warebypeople      = [_warebypeople mutableCopy];
    newop.wareflag          = [_wareflag mutableCopy];
    newop.warename          = [_warename mutableCopy];
    newop.wareclass         = [_wareclass mutableCopy];
    newop.wareprice         = _wareprice;
    newop.waresum           = _waresum;
    
    return newop;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"卖家:%@ ,状态:%@ ,商品名:%@ ,分类:%@ ,单价:%ld ,数量:%ld 。",_warebypeople,_wareflag,_warename,_wareclass,_wareprice,_waresum];
}

@end
