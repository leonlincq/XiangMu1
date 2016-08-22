//
//  Status.h
//  项目1
//
//  Created by Leonlincq on 16/8/10.
//  Copyright © 2016年 Leonlincq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Operateuserdatas.h"
#import "Operatemoney.h"
#import "Operatewares.h"
#import "Operateshopcar.h"
#import "Operateorder.h"

@interface Status : NSObject

//========================================================
#define TEST        0       //调试模式

#define CHOOSE_UI   0xF0    //选择功能模块

#define RETURNTIME  2


#define ERROR0x00_NO_NUM                        "❌请重新输入（错误代码0x00：含有非法字符）❌\n"
#define ERROR0x01_ILLEGAL_NUM                   "❌请重新输入（错误代码0x01：输入的数字不在指定范围）❌\n"
#define ERROR0x02_ILLEGAL_RULE                  "❌请重新输入（错误代码0x02：输入的数据不符合规定）❌\n"
#define ERROR0x03_ILLEGAL_LENGTH                "❌请重新输入（错误代码0x03：输入的长度不符合规范，只能在6-30位）❌\n"
#define ERROR0x04_REPE_NAME                     "❌请重新输入（错误代码0x04：用户名重复）❌\n"
#define ERROR0x05_NO_FOUND_USER                 "❌请重新输入（错误代码0x05：没有查到该人）❌\n"
#define ERROR0x06_ILLEGAL_TEST                  "❌请重新输入（错误代码0x06：验证码错误）❌\n"
#define ERROR0x07_ILLEGAL_PRO_PASSWORD          "❌请重新输入（错误代码0x07：密保错误,请选择其他方式）❌\n"
#define ERROR0x08_ILLEGAL_ADMIN                 "❌请重新输入（错误代码0x08：输入错误）❌\n"
#define ERROR0x09_ILLEGAL_PASSWORD              "❌请重新输入（错误代码0x09：密码错误）❌\n"

#define ERROR0x0A_ILLEGAL_MONEYRANGE            "❌请重新输入（错误代码0x0A：输入金额超过现有金额）❌\n"
#define ERROR0x0B_ILLEGAL_PAYLENGTH             "❌请重新输入（错误代码0x0B：输入的长度不符合规范，只能是6位）❌\n"

#define ERROR0x0C_ILLEGAL_OPNAME                "❌请重新输入（错误代码0x0C：不能转给自己）❌\n"
#define ERROR0x0D_REPE_WARENAME                 "❌请重新输入（错误代码0x0D：重复的商品名(包含别人已下架的同名商品)）❌\n"
#define ERROR0x0E_NO_FOUND_WARENAME             "❌请重新输入（错误代码0x0E：没有找到此商品）❌\n"
#define ERROR0x0F_ILLEGAL_WARENUMB              "❌请重新输入（错误代码0x0F：商品数量不能为0）❌\n"
#define ERROR0x10_OVER_WARENUMB                 "❌请重新输入（错误代码0x10：超过卖家商品数量）❌\n"
#define ERROR0x11_ILLEGAL_WARENUMB              "❌请重新输入（错误代码0x11：输入的数量有误）❌\n"

#define ERROR0xFE_FILE_OPNE_ERROR               "❌错误（错误代码0xFE：打不开文档）❌\n"
#define ERROR0xFF_NO_ERROR                      "❌错误（错误代码0xFF：没有错误😂）❌\n"


typedef NSUInteger LCQSTATUS;
@property (nonatomic,assign) LCQSTATUS StaBefore;
@property (nonatomic,assign) LCQSTATUS StaNow;

//主界面（登录界面）
enum
{
    MainInterface     = 0x10,   //主界面
    M_home            = 0x00,   //主页
    M_superUserSign   = 0x01,   //超级管理登录
    M_commonUserSign  = 0x02,   //普通用户登录
    M_registerNewUser = 0x03,   //注册新的用户
    M_foundPassWord   = 0x04,   //找回密码
    M_returnWelcome   = 0x05    //返回欢迎界面
};

//超级用户界面
enum
{
    SuperUser         = 0x20,    //超级界面首页
    S_home            = 0x00,    //主页
    S_seekUserData    = 0x01,    //查看用户信息
    S_upUserData      = 0x02,    //修改用户信息
    S_deleUserData    = 0x03,    //删除用户信息
    S_operaUserMoney  = 0x04,    //用户资金操作
    S_operaWares      = 0x05,    //商品操作
    S_operaOrder      = 0x06,    //订单操作
    S_addUser         = 0x07,    //添加用户
    S_cleProPassWord  = 0x08,    //密保库清0
    S_clemoneyhistory = 0x09,    //资金历史记录清除
    S_seekProPassWord = 0x0A,    //查看用户密保
    S_returnMain      = 0x0B     //返回主界面（登录界面）
};

//普通用户界面
enum
{
    CommonUser        = 0x30,     //普通用户首页
    C_home            = 0x00,     //主页
    C_userDeposit     = 0x01,     //用户存款
    C_userDrawMoney   = 0x02,     //用户取款
    C_lookMoneyGo     = 0x03,     //查看用户资金走向
    C_usertGiro       = 0x04,     //用户转账
    C_upData          = 0x05,     //修改密码
    C_buyWares        = 0x06,     //购买商品
    C_operaOrder      = 0x07,     //订单操作
    C_shopCar         = 0x08,     //购物车
    C_returnWelcome   = 0x09      //返回欢迎界面
};





/** 初始化状态为主界面 */
+(instancetype)statusShallOneData;
/** 初始化状态为主界面 */
-(instancetype)initStatu;
/** 状态更改 */
-(void)StatuChange:(LCQSTATUS)newstatus;
/** 状态码查看 */
-(void)lookStatu;

@end
