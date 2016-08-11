//
//  Status.m
//  项目1
//
//  Created by Leonlincq on 16/8/10.
//  Copyright © 2016年 Leonlincq. All rights reserved.
//

#import "Status.h"

@implementation Status

//==========================
//      状态初始化
//==========================
-(instancetype)initStatu
{
    self = [super init];
    if (self)
    {
        _StaBefore = MainInterface;
        _StaNow    = MainInterface;
    }
    return self;
}

//==========================
//      状态更改
//==========================
-(void)StatuChange:(LCQSTATUS)newstatus
{
    _StaBefore = _StaNow;
    _StaNow = newstatus;
    
#if TEST == 1
    NSLog(@"StaBefore == %lx,StaNow == %lx",_StaBefore,_StaNow);
#endif
}

//==========================
//      状态码查看
//==========================
-(void)lookStatu
{
    NSLog(@"错误码 = 0x%lx",(_StaBefore<<8) | (_StaNow));
}

@end
