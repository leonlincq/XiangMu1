//
//  Uicommonuser.h
//  项目1
//
//  Created by Leonlincq on 16/8/11.
//  Copyright © 2016年 Leonlincq. All rights reserved.
//

#import "Ui.h"

@interface Uicommonuser : Ui

/** 普通用户接口 */
-(void)uiCommonUserInterface:(Status**)tempstatu;
/** 普通管理界面 */
-(void)uiCommonUserHome:(Status**)tempstatu;	
/** 用户存款 */
-(void)uiCommonUserUserDeposit:(Status**)tempstatu;
/** 用户取款 */
-(void)uiCommonUserUserDrawMoney:(Status**)tempstatu;
/** 查看用户资金走向 */
-(void)uiCommonUserLookMoneyGo:(Status**)tempstatu;
/** 用户转账 */
-(void)uiCommonUserUsertGiro:(Status**)tempstatu;
/** 修改密码 */
-(void)uiCommonUserUpPasswordData:(Status**)tempstatu;
/** 购买商品 */
-(void)uiCommonUserBuyWares:(Status**)tempstatu;
/** 订单操作 */
-(void)uiCommonUserOperaOrder:(Status**)tempstatu;
/** 购物车 */
-(void)uiCommonUserShopCar:(Status**)tempstatu;

@end
