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

// 用户名 | 总资金 | 资金流向 | 操作时间 |...

@property (nonatomic,copy)      NSString    *opname;            //用户名       --关联
@property (nonatomic,assign)    NSInteger   allmoney;           //总资金
@property (nonatomic,assign)    NSInteger   opmoney;            //资金流向 (存、取、转)
@property (nonatomic,copy)      NSString    *opmoneytopeople;   //资金流向谁
@property (nonatomic,copy)      NSString    *optime;            //操作时间



-(void)printfOpname;
-(void)printfAllmoney;
-(void)printfOpmoney;
-(void)printfOpmoneytopeople;
//-(void)printfOptime;
-(void)printfAllData;

@end
