//
//  Ui.m
//  项目1
//
//  Created by Leonlincq on 16/8/10.
//  Copyright © 2016年 Leonlincq. All rights reserved.
//

#import "Ui.h"

@implementation Ui

//==========================
//      错误界面
//==========================
-(void)uiError
{
    NSLog(@"=========================");
    NSLog(@"*     异常状态,请重启      *");
    NSLog(@"=========================");
    [super lookStatu];
    while (1);
}

@end
