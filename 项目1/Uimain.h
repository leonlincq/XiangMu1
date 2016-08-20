//
//  Uimain.h
//  项目1
//
//  Created by Leonlincq on 16/8/11.
//  Copyright © 2016年 Leonlincq. All rights reserved.
//

#import "Ui.h"

@interface Uimain : Ui

#define ReturnMainTime  RETURNTIME

@property (nonatomic,assign) NSInteger countByTimer;
@property (nonatomic,retain) NSTimer *myTick;


typedef NSUInteger uimain_SuperSign;
enum
{
    uimain_SuperSign_name       = 0x00,
    uimain_SuperSign_password   = 0x01,
};

typedef NSUInteger uimain_CommonSign;
enum
{
    uimain_CommonSign_name      = 0x00,
    uimain_CommonSign_password  = 0x01,
};

typedef NSUInteger uimain_Reg;
enum
{
    uimain_Reg_name       = 0x00,
    uimain_Reg_password   = 0x01,
    uimain_Reg_realname   = 0x02,
    uimain_Reg_email      = 0x03,
    uimain_Reg_phonenum   = 0x04,
    uimain_Reg_member     = 0x05,
    uimain_Reg_question1  = 0x06,
    uimain_Reg_answer1    = 0x07,
    uimain_Reg_question2  = 0x08,
    uimain_Reg_answer2    = 0x09,
    uimain_Reg_question3  = 0x0A,
    uimain_Reg_answer3    = 0x0B,
    uimain_Reg_returnmain = 0x0C,
    uimain_Reg_ok         = 0x0D,
    
    uimain_Reg_money      = 0x0E,
    uimain_Reg_payword    = 0x0F,
    uimain_Reg_address    = 0x10,
};

typedef NSUInteger uimain_Choose;
enum
{
    uimain_Choose_inputname         = 0xFF,

    uimain_Choose_method            = 0x00,
    uimain_Choose_phone             = 0x01,
    uimain_Choose_email             = 0x02,
    uimain_Choose_question          = 0x03,
    uimain_Choose_question1         = 0x04,
    uimain_Choose_question2         = 0x05,
    uimain_Choose_question3         = 0x06,
    
    uimain_Choose_printfpassword    = 0x07,
    uimain_Choose_returnmain        = 0x08,
};

/** 初始化定时器 */
-(instancetype)initWithTimer;
/** 主界面接口 */
-(void)uiMainInterface;
/** 主界面显示 */
-(void)uiMainHome;
/** 超级用户登录 */
-(void)uiMainSuperUserSign;
/** 普通用户登录 */
-(void)uiMaincCommonUserSign;
/** 主界面注册新用户 */
-(void)uiMainRegisterNewUser;
/** 主界面找回密码 */
-(void)uiMainFoundPassWord;

@end
