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


typedef NSUInteger uicommon_Deposit;
enum
{
    uicommon_Deposit_money      = 0x00,
    uicommon_Deposit_password   = 0x01,
    uicommon_Deposit_ok         = 0x02,

};

typedef NSUInteger uicommon_Updata;
enum
{
    uicommon_Updata_choose      = 0x00,
    
    uicommon_Updata_password    = 0x01,
    uicommon_Updata_realname    = 0x02,
    uicommon_Updata_email       = 0x03,
    uicommon_Updata_phonenum    = 0x04,
    uicommon_Updata_answer1     = 0x05,
    uicommon_Updata_answer2     = 0x06,
    uicommon_Updata_answer3     = 0x07,
    
    uicommon_Updata_name        = 0x08, //登录户不能随意更改
    uicommon_Updata_member      = 0x09, //用户不能自己更改

    uicommon_Updata_question1   = 0x0A, //密保问题暂时不能自定义
    uicommon_Updata_question2   = 0x0B,
    uicommon_Updata_question3   = 0x0C,
};




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
-(void)uiCommonUserUpData;
/** 购买商品 */
-(void)uiCommonUserBuyWares;
/** 订单操作 */
-(void)uiCommonUserOperaOrder;
/** 购物车 */
-(void)uiCommonUserShopCar;

@end
