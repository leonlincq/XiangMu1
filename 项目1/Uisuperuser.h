//
//  Uisuperuser.h
//  项目1
//
//  Created by Leonlincq on 16/8/11.
//  Copyright © 2016年 Leonlincq. All rights reserved.
//

#import "Ui.h"

@interface Uisuperuser : Ui

#define ReturuSperUserTime  RETURNTIME

@property (nonatomic,assign) NSInteger countByTimer;
@property (nonatomic,retain) NSTimer *myTick;

//===========================================
typedef NSUInteger uisuper_Seek;
enum
{
    uisuper_Seek_makechoose = 0x00,
    uisuper_Seek_chooseall  = 0x01,
    uisuper_Seek_chooseone  = 0x02,
};

//===========================================
typedef NSUInteger uisuper_Updata;
enum
{
    uisuper_Updata_name     = 0x00,
    uisuper_Updata_realname = 0x01,
    uisuper_Updata_password = 0x02,
};
//===========================================
typedef NSUInteger uisuper_Delete;
enum
{
    uisuper_Delete_name     = 0x00,
    uisuper_Delete_all      = 0x01,
    uisuper_Delete_one      = 0x02,
    uisuper_Delete_password = 0x03,
    uisuper_Delete_sureorno = 0x04,
    uisuper_Delete_yes      = 0x05,
    uisuper_Delete_no       = 0x06
};

typedef NSUInteger uisuper_Delete_choose;
enum
{
    uisuper_Delete_choosenil = 0x00,
    uisuper_Delete_chooseall = 0x01,
    uisuper_Delete_chooseone = 0x02,
};
//===========================================
typedef NSUInteger uisuper_CleanProPassword;
enum
{
    uisuper_CleanProPassword_name     = 0x00,
    uisuper_CleanProPassword_all      = 0x01,
    uisuper_CleanProPassword_one      = 0x02,
    uisuper_CleanProPassword_password = 0x03,
    uisuper_CleanProPassword_sureorno = 0x04,
    uisuper_CleanProPassword_yes      = 0x05,
    uisuper_CleanProPassword_no       = 0x06
    
};
//===========================================



/** 初始化定时器 */
-(instancetype)initWithTimer;
/** 超级用户接口 */
-(void)uiSuperUserInterface;
/** 超级用户界面 */
-(void)uiSuperUserHome;
/** 查看用户信息 */
-(void)uiSuperUserSeekUserData;
/** 修改用户信息 */
-(void)uiSuperUserUpUserData;
/** 删除用户信息 */
-(void)uiSuperUserDeleUserData;
/** 用户资金操作 */
-(void)uiSuperUserOperaUserMoney;
/** 商品操作 */
-(void)uiSuperUserOperaWares;
/** 订单操作 */
-(void)uiSuperUserOperaOrder;
/** 添加用户 */
-(void)uiSuperUserAddUser;
/** 密保库清0 */
-(void)uiSuperUserCleProPassWord;
/** 资金历史记录清除 */
-(void)uiSuperUserClemoneyhistory;
/** 查看用户密保 */
-(void)uiSuperUserSeekProPassWord;



@end
