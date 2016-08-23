//
//  Managebuyandsale.h
//  项目1
//
//  Created by etcxm on 16/8/23.
//  Copyright © 2016年 etc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Managebuyandsale : NSObject<NSCopying>

#define Admin       @"Admin"            //管理员

#define BuyerToAdmin  @"BuyerToAdmin"   //钱到管理者手里

#define BuyerToSaler  @"BuyerToSaler"   //钱到卖家手里
#define SalerSuccess  @"SalerSuccess"   //销售成功

#define CancelByBuyer @"CancelByBuyer"  //取消给卖家

#define RefundByBuyer @"RefundByBuyer"  //退款给卖家



@property (nonatomic,copy)      NSString    *basopname;             //用户名               --关联
@property (nonatomic,assign)    NSInteger   basallmoney;           //总资金
@property (nonatomic,assign)    NSInteger   basordernumb;          //订单号
@property (nonatomic,copy)      NSString    *basopaction;          //资金操作 (到第三方、卖家、退款)
@property (nonatomic,assign)    NSInteger   basopmoney;            //资金
@property (nonatomic,copy)      NSString    *basopmoneytopeople;   //对象                --关联
@property (nonatomic,copy)      NSString    *basoptime;            //操作时间



-(void)printfBASopname;
-(void)printfBASallmoney;
-(void)printfBASordernumb;
-(void)printfBASopaction;
-(void)printfBASopmoney;
-(void)printfBASopmoneytopeople;
-(void)printfBASoptime;
-(void)printfAllData;

@end
