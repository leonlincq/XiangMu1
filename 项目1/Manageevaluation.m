//
//  Managecollect.m
//  项目1
//
//  Created by Leonlincq on 16/8/11.
//  Copyright © 2016年 Leonlincq. All rights reserved.
//

#import "Manageevaluation.h"

@implementation Manageevaluation

-(void)printfEvaluationBySaler
{
    const char *printfdata;
    printfdata = [self.evaluationBySaler UTF8String];
    if (printfdata == nil)
    {
        printf("卖家：无");
    }
    else
    {
        printf("卖家：%s",printfdata);
    }
}

-(void)printfEvaluationByWare
{
    const char *printfdata;
    printfdata = [self.evaluationByWare UTF8String];
    if (printfdata == nil)
    {
        printf("商品名：无");
    }
    else
    {
        printf("商品名：%s",printfdata);
    }
}

-(void)printfEvaluationByBuyer
{
    const char *printfdata;
    printfdata = [self.evaluationByBuyer UTF8String];
    if (printfdata == nil)
    {
        printf("买家：无");
    }
    else
    {
        printf("买家：%s",printfdata);
    }
}

-(void)printfEvaluationByLevel
{
    const char *printfdata;
    printfdata = [self.evaluationByLevel UTF8String];
    if (printfdata == nil)
    {
        printf("评价等级：无");
    }
    else
    {
        printf("评价等级：%s",printfdata);
    }
}

-(void)printfEvaluationByPoint
{
    const char *printfdata;
    printfdata = [self.evaluationByPoint UTF8String];
    if (printfdata == nil)
    {
        printf("评价分数：无");
    }
    else
    {
        printf("评价分数：%s",printfdata);
    }
}

-(void)printfAllData
{
    printf("0️⃣");
    [self printfEvaluationBySaler];
    printf(" ,");
    
    printf("1️⃣");
    [self printfEvaluationByWare];
    printf(" ,");
    
    printf("2️⃣");
    [self printfEvaluationByBuyer];
    printf(" ,");
    
    printf("3️⃣");
    [self printfEvaluationByLevel];
    printf(" ,");
    
    printf("4️⃣");
    [self printfEvaluationByPoint];
    printf("\n");
}

- (id)copyWithZone:(nullable NSZone *)zone
{
    Manageevaluation *newop = [[Manageevaluation alloc]init];
    
    newop.evaluationBySaler     = [_evaluationBySaler mutableCopy];
    newop.evaluationByWare      = [_evaluationByWare  mutableCopy];
    newop.evaluationByBuyer     = [_evaluationByBuyer mutableCopy];
    newop.evaluationByLevel     = [_evaluationByLevel mutableCopy];
    newop.evaluationByPoint     = [_evaluationByPoint mutableCopy];

    return newop;
}


@end
