//
//  Uisuperuser.h
//  项目1
//
//  Created by Leonlincq on 16/8/11.
//  Copyright © 2016年 Leonlincq. All rights reserved.
//

#import "Ui.h"

@interface Uisuperuser : Ui

#define ReturuSperUserTime  1

@property (nonatomic,assign) NSInteger countByTimer;
@property (nonatomic,retain) NSTimer *myTick;

typedef NSUInteger uisuper_Seek;
enum
{
    uisuper_Seek_makechoose = 0x00,
    uisuper_Seek_chooseall  = 0x01,
    uisuper_Seek_chooseone  = 0x02,
};


typedef NSUInteger uisuper_Updata;
enum
{
    uisuper_Updata_name     = 0x00,
    uisuper_Updata_realname = 0x01,
};


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
