//
//  Uicommonuser.h
//  项目1
//
//  Created by Leonlincq on 16/8/11.
//  Copyright © 2016年 Leonlincq. All rights reserved.
//

#import "Ui.h"

@interface Uicommonuser : Ui

#define ReturuCommonUserTime  RETURNTIME

@property (nonatomic,assign) NSInteger countByTimer;
@property (nonatomic,retain) NSTimer *myTick;

/** 初始化定时器 */
-(instancetype)initWithTimer;
/** 普通用户接口 */
-(void)uiCommonUserInterface;
/** 普通管理界面 */
-(void)uiCommonUserHome;	
/** 用户存款 */
-(void)uiCommonUserUserDeposit;
/** 用户取款 */
-(void)uiCommonUserUserDrawMoney;
/** 查看用户资金走向 */
-(void)uiCommonUserLookMoneyGo;
/** 用户转账 */
-(void)uiCommonUserUsertGiro;
/** 修改密码 */
-(void)uiCommonUserUpPasswordData;
/** 购买商品 */
-(void)uiCommonUserBuyWares;
/** 订单操作 */
-(void)uiCommonUserOperaOrder;
/** 购物车 */
-(void)uiCommonUserShopCar;

@end
