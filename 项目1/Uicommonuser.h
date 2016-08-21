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


//==========================================
typedef NSUInteger uicommon_Deposit;
enum
{
    uicommon_Deposit_money      = 0x00,
    uicommon_Deposit_payword    = 0x01,
    uicommon_Deposit_ok         = 0x02,

};
//==========================================
typedef NSUInteger uicommon_DrawMoney;
enum
{
    uicommon_DrawMoney_money      = 0x00,
    uicommon_DrawMoney_payword   = 0x01,
    uicommon_DrawMoney_ok         = 0x02,
    
};
//==========================================
typedef NSUInteger uicommon_LookMoneyGo;
enum
{
    uicommon_LookMoneyGo_choose     = 0x00,
    uicommon_LookMoneyGo_all        = 0x01,
    uicommon_LookMoneyGo_deposit    = 0x02,
    uicommon_LookMoneyGo_drawmoney  = 0x03,
    uicommon_LookMoneyGo_transfers  = 0x04,
    uicommon_LookMoneyGo_buy        = 0x05,
    uicommon_LookMoneyGo_ok         = 0x06,
    
};
//==========================================
typedef NSUInteger uicommon_UsertGiro;
enum
{
    uicommon_UsertGiro_money        = 0x00,
    uicommon_UsertGiro_who          = 0x01,
    uicommon_UsertGiro_payword      = 0x02,
    uicommon_UsertGiro_ok           = 0x03,
};


//==========================================
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
    uicommon_Updata_payword     = 0x08,
    uicommon_Updata_address     = 0x09,
    
    
    uicommon_Updata_name        = 0x0D, //登录户不能随意更改
    uicommon_Updata_member      = 0x0E, //用户不能自己更改

    uicommon_Updata_question1   = 0x0A, //密保问题暂时不能自定义
    uicommon_Updata_question2   = 0x0B,
    uicommon_Updata_question3   = 0x0C,
};
//==========================================
typedef NSUInteger uicommon_OperaWares;
enum
{
    uicommon_OperaWares_choose          = 0x00,
    uicommon_OperaWares_upware          = 0x01,
    uicommon_OperaWares_downware        = 0x02,
    uicommon_OperaWares_searchware      = 0x03,
    
    uicommon_OperaWares_updownedware    = 0x04,
    uicommon_OperaWares_updownedwarenumb= 0xF1,
    uicommon_OperaWares_upwarename      = 0x05,
    uicommon_OperaWares_upwareclass     = 0x06,
    uicommon_OperaWares_upwareprice     = 0x07,
    uicommon_OperaWares_upwaresum       = 0x08,
    
    uicommon_OperaWares_searchclass     = 0X09,
    
    uicommon_OperaWares_searchchoose    = 0X0A,
    
    uicommon_OperaWares_searchname      = 0x0F,
    uicommon_OperaWares_searchshopcar   = 0x10,
    
    uicommon_OperaWares_opwareok        = 0xFF,

};

enum
{
    uicommon_OperaWares_nil         = 0x00,
    uicommon_OperaWares_IT          = 0x01,
    uicommon_OperaWares_EAT         = 0x02,
    uicommon_OperaWares_LIFE        = 0x03,
    uicommon_OperaWares_STUDENTTOOL = 0x04,
    uicommon_OperaWares_OTHER       = 0x05,
};


//==========================================


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
/** 商品操作 */
-(void)uiCommonUserOperaWares;
/** 订单操作 */
-(void)uiCommonUserOperaOrder;
/** 购物车 */
-(void)uiCommonUserShopCar;

@end
