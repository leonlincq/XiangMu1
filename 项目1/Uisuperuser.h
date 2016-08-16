//
//  Uisuperuser.h
//  项目1
//
//  Created by Leonlincq on 16/8/11.
//  Copyright © 2016年 Leonlincq. All rights reserved.
//

#import "Ui.h"

@interface Uisuperuser : Ui

@property (nonatomic,assign) NSInteger countByTimer;
@property (nonatomic,retain) NSTimer *myTick;

enum
{
    seekmakechoose          = 0x00,
    seekchooseall           = 0x01,
    seekchooseone           = 0x02,
    seekchoosereturnmain    = 0x03
};


enum
{
    updataname          = 0x00,
    updatarealname      = 0x01,
    updatareturnmain    = 0x02,
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
