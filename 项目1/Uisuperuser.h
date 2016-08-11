//
//  Uisuperuser.h
//  项目1
//
//  Created by Leonlincq on 16/8/11.
//  Copyright © 2016年 Leonlincq. All rights reserved.
//

#import "Ui.h"

@interface Uisuperuser : Ui

/** 超级用户接口 */
-(void)uiSuperUserInterface:(Status**)tempstatu;
/** 超级用户界面 */
-(void)uiSuperUserHome:(Status**)tempstatu;
/** 查看用户信息 */
-(void)uiSuperUserSeekUserData:(Status**)tempstatu;
/** 修改用户信息 */
-(void)uiSuperUserUpUserData:(Status**)tempstatu;
/** 删除用户信息 */
-(void)uiSuperUserDeleUserData:(Status**)tempstatu;
/** 用户资金操作 */
-(void)uiSuperUserOperaUserMoney:(Status**)tempstatu;
/** 商品操作 */
-(void)uiSuperUserOperaWares:(Status**)tempstatu;
/** 订单操作 */
-(void)uiSuperUserOperaOrder:(Status**)tempstatu;
/** 添加用户 */
-(void)uiSuperUserAddUser:(Status**)tempstatu;
/** 密保库清0 */
-(void)uiSuperUserCleProPassWord:(Status**)tempstatu;
/** 资金历史记录清除 */
-(void)uiSuperUserClemoneyhistory:(Status**)tempstatu;
/** 查看用户密保 */
-(void)uiSuperUserSeekProPassWord:(Status**)tempstatu;



@end
