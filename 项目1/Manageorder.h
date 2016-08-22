//
//  Manageorder.h
//  项目1
//
//  Created by Leonlincq on 16/8/11.
//  Copyright © 2016年 Leonlincq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Manageorder : NSObject<NSCopying>

#define Create          @"Create"           //创立订单并付款
#define SendWare        @"SendWare"         //已发货
#define SureWare        @"SureWare"         //确认收货并评价（完成）
#define Cancel          @"Cancel"           //取消订单？(销毁)（只能在卖家未发货）
#define RequestRefund   @"RequestRefund"    //请求退款
#define RefundOK        @"RefundOK"         //退款完成

@property (nonatomic,copy)      NSString    *orderbuyer;    //订单买家          --关联
@property (nonatomic,assign)    NSInteger   ordernumb;      //订单编号
@property (nonatomic,copy)      NSString    *ordersta;      //订单操作/状态
@property (nonatomic,copy)      NSString    *orderware;     //订单商品          --关联
@property (nonatomic,copy)      NSString    *ordersaler;    //订单卖家          --关联
@property (nonatomic,assign)    NSInteger   ordermoney;     //订单商品金额
@property (nonatomic,assign)    NSInteger   orderquantity;  //订单商品数量
@property (nonatomic,assign)    NSInteger   orderallmoney;  //订单总金额
@property (nonatomic,copy)      NSString    *orderaddress;  //订单收货地址

-(void)printfOrderbuyer;
-(void)printfOrdernumb;
-(void)printfOrdersta;
-(void)printfOrderware;
-(void)printfOrdersaler;
-(void)printfOrdermoney;
-(void)printfOrderquantity;
-(void)printfOrderallmoney;
-(void)printfOrderaddress;
-(void)printfAllData;

@end
