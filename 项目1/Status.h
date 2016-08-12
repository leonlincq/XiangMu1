//
//  Status.h
//  项目1
//
//  Created by Leonlincq on 16/8/10.
//  Copyright © 2016年 Leonlincq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Status : NSObject

//========================================================
#define TEST        0       //调试模式

#define CHOOSE_UI   0xF0    //选择功能模块

#define ERROR0x01 @"（错误代码0x01：含有字符或字母）"
#define ERROR0x02 @"（错误代码0x02：操作序号不在指定范围内）"


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
    C_upPasswordData  = 0x05,     //修改密码
    C_buyWares        = 0x06,     //购买商品
    C_operaOrder      = 0x07,     //订单操作
    C_shopCar         = 0x08,     //购物车
    C_returnWelcome   = 0x09      //返回欢迎界面
};
//========================================================

typedef NSUInteger LCQSTATUS;
@property (nonatomic,assign) LCQSTATUS StaBefore;
@property (nonatomic,assign) LCQSTATUS StaNow;

/** 初始化状态为主界面 */
+(instancetype)statusShallOneData;
/** 初始化状态为主界面 */
-(instancetype)initStatu;
/** 状态更改 */
-(void)StatuChange:(LCQSTATUS)newstatus;

/** 状态码查看 */
-(void)lookStatu;

@end
