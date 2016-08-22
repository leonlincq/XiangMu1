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
    uicommon_OperaWares_updownedwarenumb= 0x05,
    uicommon_OperaWares_upwarename      = 0x06,
    uicommon_OperaWares_upwareclass     = 0x07,
    uicommon_OperaWares_upwareprice     = 0x08,
    uicommon_OperaWares_upwaresum       = 0x09,
    
    uicommon_OperaWares_searchclass     = 0X0A,
    uicommon_OperaWares_searchchoose    = 0X0B,
    uicommon_OperaWares_searchname      = 0x0C,
    uicommon_OperaWares_searchshopcar   = 0x0D,
    
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
typedef NSUInteger uicommon_OperaOrder;
enum
{
    uicommon_OperaOrder_seek                = 0x00,     //查看订单信息
    uicommon_OperaOrder_choose              = 0x01,     //选择序号
    
    uicommon_OperaOrder_lookcreateorder     = 0x02,     //查看已创建订单
    uicommon_OperaOrder_looksendware        = 0x03,     //查看已发货订单
    uicommon_OperaOrder_lookcsureware       = 0x04,     //查看确认收货订单
    uicommon_OperaOrder_lookcancel          = 0x05,     //查看取消订单
    uicommon_OperaOrder_lookrequestrefund   = 0x06,     //查看请求退款订单
    uicommon_OperaOrder_lookagreerefund     = 0x07,     //查看卖家同意退款订单
    uicommon_OperaOrder_lookrefundok        = 0x08,     //查看已退款完成订单
    
    uicommon_OperaOrder_OK                  = 0xFF,     //订单操作完成
};
//==========================================

typedef NSUInteger uicommon_ShopCar;
enum
{
    uicommon_ShopCar_seek           = 0x00,         //打印出该用户所有购物车信息
    uicommon_ShopCar_choose         = 0x01,         //选择序号
    uicommon_ShopCar_surenumb       = 0x02,         //该购物车数量，判断卖家的数量。
    uicommon_ShopCar_newnumb        = 0x03,         //新的数量
    uicommon_ShopCar_sureaddress    = 0x04,         //该用户地址
    uicommon_ShopCar_newaddress     = 0x05,         //新的用户地址
    uicommon_ShopCar_payword        = 0x06,         //支付密码
    uicommon_ShopCar_buildorder     = 0x07,         //卖家的数量-1。=0要下架
    uicommon_ShopCar_toorderok      = 0x08,         //创立订单成功
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
