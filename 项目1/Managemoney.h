//
//  Managemoney.h
//  项目1
//
//  Created by Leonlincq on 16/8/11.
//  Copyright © 2016年 Leonlincq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Managemoney : NSObject

//用户资金表

//更新标记位？ | 用户名 | 总资金 | 资金流向 (存、取、转)n | ...

@property (nonatomic,assign)    NSUInteger  flag;       //更新标记位?
@property (nonatomic,copy)      NSString    *name;      //用户名       --关联
@property (nonatomic,assign)    NSUInteger  allmoney;   //总资金
@property (nonatomic,assign)    NSInteger   opmoney;    //资金流向 (存、取、转)

@end
