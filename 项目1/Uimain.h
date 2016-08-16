//
//  Uimain.h
//  项目1
//
//  Created by Leonlincq on 16/8/11.
//  Copyright © 2016年 Leonlincq. All rights reserved.
//

#import "Ui.h"

@interface Uimain : Ui

@property (nonatomic,assign) NSInteger countByTimer;
@property (nonatomic,retain) NSTimer *myTick;

enum
{
    register_name       = 0x00,
    register_password   = 0x01,
    register_realname   = 0x02,
    register_email      = 0x03,
    register_phonenum   = 0x04,
    register_member     = 0x05,
    register_question1  = 0x06,
    register_answer1    = 0x07,
    register_question2  = 0x08,
    register_answer2    = 0x09,
    register_question3  = 0x0A,
    register_answer3    = 0x0B,
    register_returnmain = 0x0C,
    register_ok         = 0x0D
};


enum
{
    choose_inputname    = 0xFF,

    choose_method       = 0x00,
    choose_phone        = 0x01,
    choose_email        = 0x02,
    choose_question     = 0x03,
    choose_question1    = 0x04,
    choose_question2    = 0x05,
    choose_question3    = 0x06,
    
    outputpassword      = 0x07,
    choose_returnmain   = 0x08,
};

/** 初始化定时器 */
-(instancetype)initWithTimer;
/** 主界面接口 */
-(void)uiMainInterface;
/** 主界面显示 */
-(void)uiMainHome;
/** 主界面注册新用户 */
-(void)uiMainRegisterNewUser;
/** 主界面找回密码 */
-(void)uiMainFoundPassWord;

@end
