//
//  Uimain.m
//  项目1
//
//  Created by Leonlincq on 16/8/11.
//  Copyright © 2016年 Leonlincq. All rights reserved.
//

#import "Uimain.h"

@implementation Uimain

-(instancetype)initWithTimer
{
    self = [super init];
    if (self)
    {
        _myTick = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(oneSecTick:) userInfo:nil repeats:YES];
        [_myTick setFireDate:[NSDate distantFuture]];
        _countByTimer = ReturnMainTime;
    }
    return self;
}


//==========================
//      定时器控制
//==========================
-(void)oneSecTick:(NSTimer*)temptimer
{
    Status *MyStatuP = [Status statusShallOneData];
    
    switch (MyStatuP.StaNow)
    {
        case ( MainInterface | M_home ):
            printf("🕐%ld秒后返回主界面...\n",_countByTimer--);
            break;
        
        case ( SuperUser | S_home ):
            printf("🕐%ld秒后进入超级用户界面...\n",_countByTimer--);
            break;
            
        case ( CommonUser | C_home ):
            printf("🕐%ld秒后返回普通用户界面...\n",_countByTimer--);
            break;
            
        default:
            break;
    }

    if(_countByTimer == 0)
    {
        printf("======================================\n");
        [_myTick setFireDate:[NSDate distantFuture]];
    }
}

//==========================
//      进入等待定时器
//==========================
-(void)enterWaitTimer
{
    _countByTimer = ReturnMainTime;
    [_myTick setFireDate:[NSDate distantPast]];
    NSDate *date = [NSDate dateWithTimeIntervalSinceNow:ReturnMainTime];
    [[NSRunLoop currentRunLoop] runUntilDate:date];
}

//==========================
//      开机主界面接口
//==========================
-(void)uiMainInterface
{
    Status *MyStatuP = [Status statusShallOneData];
    
    switch (MyStatuP.StaNow)
    {
        case (MainInterface | M_home):              //欢迎界面首页
            [self uiMainHome];
            break;
            
        case (MainInterface | M_superUserSign):     //超级用户界面
            [self uiMainSuperUserSign];
            break;
        case (MainInterface | M_commonUserSign):    //普通用户界面
            [self uiMaincCommonUserSign];
            break;
            
        case (MainInterface | M_registerNewUser):   //注册用户
            [self uiMainRegisterNewUser];
            break;
            
        case (MainInterface | M_foundPassWord):    //找回密码
            [self uiMainFoundPassWord];
            break;
            
        //不应该出现的状态
        case (MainInterface | M_returnWelcome):     //返回欢迎界面
        default:
            [super uiError];
            break;
    }
}

//==========================
//      开机主界面显示
//==========================
-(void)uiMainHome
{
    Status *MyStatuP                = [Status statusShallOneData];      //更改主方法状态
    Manageuserdatas *olduserdata    = [[Manageuserdatas alloc]init];    //找到数据并保存
    LCQResultKeyRule temp_namestatu = LCQResultKeyRule_Nil;             //按键状态
    
    printf("         🌳在线销售系统欢迎您🌳         \n");
    printf("======================================\n");
    printf("*           🐴1.超级管理登录           *\n");
    printf("*           🐑2.普通用户登录           *\n");
    printf("*           🐧3.注册新的用户           *\n");
    printf("*           🐶4.找回用户密码           *\n");
    printf("*           🐘5.返回欢迎界面           *\n");
    printf("======================================\n");
    
    while (1)
    {
        printf("▶️请输入操作序号(1~5):");
        temp_namestatu = [super seekRule:LCQKeyRule_Numb AndJudgeSaveUser:&olduserdata];
        if (temp_namestatu == LCQResultKeyRule_OK)
        {
            int tempjudge = [olduserdata.member intValue];
            switch ( tempjudge )
            {
                case M_superUserSign:
                    [MyStatuP StatuChange:(MainInterface | tempjudge)]; //超级管理员界面+首页
                    return;
                    
                case M_commonUserSign:
                    [MyStatuP StatuChange:(MainInterface | tempjudge)]; //普通用户界面+首页
                    return;
                    
                case M_registerNewUser:
                    [MyStatuP StatuChange:(MainInterface | tempjudge)]; //欢迎界面+注册新用户
                    return;
                    
                case M_foundPassWord:
                    [MyStatuP StatuChange:(MainInterface | tempjudge)]; //欢迎界面+找回密码
                    return;
                    
                case M_returnWelcome:
                    [MyStatuP StatuChange:(MainInterface | M_home)];    //返回主界面
                    return;
                    
                default:
                    printf("%s",ERROR0x01_ILLEGAL_NUM);
                    break;
            }//判断数字
        }
    }//结束while
}

//==========================
//      超级用户登录
//==========================
-(void)uiMainSuperUserSign
{
    Status *MyStatuP                = [Status statusShallOneData];      //更改主方法状态
    uimain_SuperSign tempstatu      = uimain_SuperSign_name;            //该方法的状态
    Manageuserdatas *olduserdata    = [[Manageuserdatas alloc]init];    //找到数据并保存
    LCQResultKeyRule temp_namestatu = LCQResultKeyRule_Nil;             //按键状态
    
    printf("=========================================\n");
    
    while (1)
    {
        switch (tempstatu)
        {
            case uimain_SuperSign_name:
                printf("▶️请输入超级用户名(6-30位，只能是数字、字母、下划线)(🔙可输入'...'取消登录🔙)：\n");
                temp_namestatu = [super seekRule:LCQKeyRule_Admin AndJudgeSaveUser:&olduserdata];
                if (temp_namestatu == LCQResultKeyRule_OK)
                {
                    tempstatu = uimain_CommonSign_password;
                    printf("=========================================\n");
                }
                break;
                
            case uimain_SuperSign_password:
                printf("▶️请输入密码(🔙可输入'...'取消登录🔙)：\n");
                temp_namestatu = [super seekRule:LCQKeyRule_Admin AndJudgeSaveUser:&olduserdata];
                if (temp_namestatu == LCQResultKeyRule_OK)
                {
                    printf("=========================================\n");
                    [MyStatuP StatuChange:(SuperUser | S_home)];        //超级管理员界面+首页
                    [self enterWaitTimer];
                    return;
                }
                break;
                
            default:
                break;
        }
        //这里的状态是底层UI.m检测到'...'，想切回主界面，但困在while出不去
        if (MyStatuP.StaNow == (MainInterface | M_home))
        {
            [self enterWaitTimer];
            break;
        }
    }
    
}

//==========================
//      普通用户登录
//==========================
-(void)uiMaincCommonUserSign
{
    Status *MyStatuP                = [Status statusShallOneData];      //更改主方法状态
    Manageuserdatas *newuser        = [[Manageuserdatas alloc]init];    //要保存的实例
    uimain_CommonSign tempstatu     = uimain_CommonSign_name;           //该方法的状态
    Manageuserdatas *olduserdata    = [[Manageuserdatas alloc]init];    //找到数据并保存
    LCQResultKeyRule temp_namestatu = LCQResultKeyRule_Nil;             //按键状态
    
    printf("=========================================\n");
    
    while (1)
    {
        switch (tempstatu)
        {
            case uimain_CommonSign_name:
                printf("▶️请输入用户名(6-30位，只能是数字、字母、下划线)(🔙可输入'...'取消注册🔙)：\n");                
                temp_namestatu = [super seekRule:LCQKeyRule_Name AndJudgeSaveUser:&olduserdata];
                if (temp_namestatu == LCQResultKeyRule_NoFound)
                {
                    printf("%s",ERROR0x05_NO_FOUND_USER);
                }
                else if(temp_namestatu == LCQResultKeyRule_Found)
                {
                    newuser.password = olduserdata.password;
                    tempstatu = uimain_SuperSign_password;
                    printf("=========================================\n");
                }
                break;
                
            case uimain_SuperSign_password:
                printf("▶️请输入密码(🔙可输入'...'取消登录🔙)：\n");
                temp_namestatu = [super seekRule:LCQKeyRule_PassWord AndJudgeSaveUser:&olduserdata];
                if (temp_namestatu == LCQResultKeyRule_OK)
                {
                    if ( newuser.password == olduserdata.password )
                    {
                        printf("=========================================\n");
                        [MyStatuP StatuChange:(CommonUser | C_home)];        //超级管理员界面+首页
                        [self enterWaitTimer];
                        return;
                    }
                }
                break;
                
            default:
                break;
        }
        //这里的状态是底层UI.m检测到'...'，想切回主界面，但困在while出不去
        if (MyStatuP.StaNow == (MainInterface | M_home))
        {
            [self enterWaitTimer];
            break;
        }
    }
}


//==========================
//      开机主界面注册新用户
//==========================
-(void)uiMainRegisterNewUser
{
    Status *MyStatuP                = [Status statusShallOneData];      //更改主方法状态
    Manageuserdatas *newuser        = [[Manageuserdatas alloc]init];    //要保存的实例
    Operateuserdatas *newop         = [[Operateuserdatas alloc]init];   //文件操作
    uimain_Reg tempstatu            = uimain_Reg_name;                  //该方法的状态
    Manageuserdatas *olduserdata    = [[Manageuserdatas alloc]init];    //找到数据并保存
    LCQResultKeyRule temp_namestatu = LCQResultKeyRule_Nil;             //按键状态
    
    printf("=========================================\n");

    while (1)
    {
        switch (tempstatu)
        {
            case uimain_Reg_name:                //输入用户
                printf("▶️请输入用户名(6-30位，只能是数字、字母、下划线)(🔙可输入'...'取消注册🔙)：\n");
                temp_namestatu = [super seekRule:LCQKeyRule_Name AndJudgeSaveUser:&olduserdata];
                if (temp_namestatu == LCQResultKeyRule_Found)
                {
                    printf("%s",ERROR0x04_REPE_NAME);
                }
                else if(temp_namestatu == LCQResultKeyRule_NoFound)
                {
                    newuser.name = olduserdata.name;
                    tempstatu = uimain_Reg_password;
                    printf("=========================================\n");
                }
                break;
                
            case uimain_Reg_password:                //输入密码
                printf("▶️请输入密码(6-30位)(🔙可输入'...'取消注册🔙)：\n");
                temp_namestatu = [super seekRule:LCQKeyRule_PassWord AndJudgeSaveUser:&olduserdata];
                if (temp_namestatu == LCQResultKeyRule_OK)
                {
                    newuser.password = olduserdata.password;
                    tempstatu = uimain_Reg_realname;
                    printf("=========================================\n");
                }
                break;
                
            case uimain_Reg_realname:                //输入真名
                printf("▶️请输入真名(6-30位英文字母)(🔙可输入'...'取消注册🔙)：\n");
                temp_namestatu = [super seekRule:LCQKeyRule_RealName AndJudgeSaveUser:&olduserdata];
                if (temp_namestatu == LCQResultKeyRule_OK)
                {
                    newuser.realname = olduserdata.realname;
                    tempstatu = uimain_Reg_email;
                    printf("=========================================\n");
                }
                break;
                
            case uimain_Reg_email:                //输入邮箱
                printf("▶️请输入邮箱地址(🔙可输入'...'取消注册🔙)：\n");
                temp_namestatu = [super seekRule:LCQKeyRule_Email AndJudgeSaveUser:&olduserdata];
                if (temp_namestatu == LCQResultKeyRule_OK)
                {
                    newuser.email = olduserdata.email;
                    tempstatu = uimain_Reg_phonenum;
                    printf("=========================================\n");
                }
                break;

            case uimain_Reg_phonenum:                //输入电话
                printf("▶️请输入电话号码(只能是13开头)或座机号码(座机可不加区号，加区号得用-隔开)(🔙可输入'...'取消注册🔙)：\n");
                temp_namestatu = [super seekRule:LCQKeyRule_Phonenum AndJudgeSaveUser:&olduserdata];
                if (temp_namestatu == LCQResultKeyRule_OK)
                {
                    newuser.phonenum = olduserdata.phonenum;
                    tempstatu = uimain_Reg_member;
                    printf("=========================================\n");
                }
                break;
                
            case uimain_Reg_member:               //输入会员
                newuser.member = @"1级会员";
                tempstatu = uimain_Reg_question1;
                break;
                
            case uimain_Reg_question1:
                newuser.question1 = @QUESTION_FRIST;
                tempstatu = uimain_Reg_answer1;
                break;

            case uimain_Reg_answer1:             //输入密保1答案
                printf("▶️第一个密保问题：%s\n",QUESTION_FRIST);
                printf("▶️请输入第一个密保答案(🔙可输入'...'取消注册🔙)：\n");
                temp_namestatu = [super seekRule:LCQKeyRule_Answer1 AndJudgeSaveUser:&olduserdata];
                if (temp_namestatu == LCQResultKeyRule_OK)
                {
                    newuser.answer1 = olduserdata.answer1;
                    tempstatu = uimain_Reg_question2;
                    printf("=========================================\n");
                }
                break;

            case uimain_Reg_question2:
                newuser.question2 = @QUESTION_SECON;
                tempstatu = uimain_Reg_answer2;
                break;
                
            case uimain_Reg_answer2:               //输入密保2答案
                printf("▶️第二个密保问题：%s\n",QUESTION_SECON);
                printf("▶️请输入第二个密保答案(🔙可输入'...'取消注册🔙)：\n");
                temp_namestatu = [super seekRule:LCQKeyRule_Answer2 AndJudgeSaveUser:&olduserdata];
                if (temp_namestatu == LCQResultKeyRule_OK)
                {
                    newuser.answer2 = olduserdata.answer2;
                    tempstatu = uimain_Reg_question3;
                    printf("=========================================\n");
                }
                break;
                
            case uimain_Reg_question3:
                newuser.question3 = @QUESTION_THREE;
                tempstatu = uimain_Reg_answer3;
                break;
                
            case uimain_Reg_answer3:               //输入密保3答案
                printf("▶️第三个密保问题：%s\n",QUESTION_THREE);
                printf("▶️请输入第三个密保答案(🔙可输入'...'取消注册🔙)：\n");
                temp_namestatu = [super seekRule:LCQKeyRule_Answer3 AndJudgeSaveUser:&olduserdata];
                if (temp_namestatu == LCQResultKeyRule_OK)
                {
                    newuser.answer3 = olduserdata.answer3;
                    tempstatu = uimain_Reg_ok;
                    printf("=========================================\n");
                }
                break;
                
            case uimain_Reg_ok:
                [newop addUser:newuser];
                printf("✅注册成功，信息如下:\n");
                [newuser printfAllData];
                [super uiReturnUpUi:(MainInterface | M_home)];
                return;
                
            default:
                break;
        }
        //这里的状态是底层UI.m检测到'...'，想切回主界面，但困在while出不去
        if (MyStatuP.StaNow == (MainInterface | M_home))
        {
            [self enterWaitTimer];
            break;
        }
    }
}

//==========================
//      开机主界面找回密码
//==========================
-(void)uiMainFoundPassWord
{
    Status *MyStatuP                = [Status statusShallOneData];      //更改主方法状态
    Manageuserdatas *newuser        = [[Manageuserdatas alloc]init];    //要保存的实例
    uimain_Choose pristatu          = uimain_Choose_inputname;          //该方法的状态
    Manageuserdatas *olduserdata    = [[Manageuserdatas alloc]init];    //找到数据并保存
    LCQResultKeyRule temp_namestatu = 0;

    
    printf("=========================================\n");
    
    //输入用户名
    while (1)
    {
        switch (pristatu)
        {
            case uimain_Choose_inputname:
                printf("▶️请输入您的用户名(6-30位，只能是数字、字母、下划线)(🔙可输入'...'取消找回密码🔙)：\n");
                temp_namestatu = [super seekRule:LCQKeyRule_Name AndJudgeSaveUser:&olduserdata];
                if (temp_namestatu == LCQResultKeyRule_Found)
                {
                    newuser = [olduserdata copy];
                    pristatu = uimain_Choose_method;
                    printf("=========================================\n");
                }
                else if(temp_namestatu == LCQResultKeyRule_NoFound)
                {
                    printf("%s",ERROR0x05_NO_FOUND_USER);
                }
                break;
                
            case uimain_Choose_method:
                printf("         ▶️1.手机找回密码\n");
                printf("         ▶️2.Email找回密码\n");
                printf("         ▶️3.密保找回密码\n");
                printf("▶️请选择找回密码方式序号(1-3)(🔙可输入'...'取消找回密码🔙):");
                printf("=========================================\n");

                temp_namestatu = [super seekRule:LCQKeyRule_Numb AndJudgeSaveUser:&olduserdata];
                if (temp_namestatu == LCQResultKeyRule_OK)
                {
                    int tempjudge = [olduserdata.member intValue];
                    switch (tempjudge)
                    {
                        case (uimain_Choose_phone-uimain_Choose_method):
                            pristatu = uimain_Choose_phone;
                            printf("=========================================\n");
                            break;
                            
                        case (uimain_Choose_email-uimain_Choose_method):
                            pristatu = uimain_Choose_email;
                            printf("=========================================\n");
                            break;
                            
                        case (uimain_Choose_question-uimain_Choose_method):
                            pristatu = uimain_Choose_question;
                            printf("=========================================\n");
                            break;
                        default:
                            printf("%s",ERROR0x01_ILLEGAL_NUM);
                            break;
                    }
                }
                break;
                
            case uimain_Choose_phone:
                if(newuser.phonenum != nil)   //是否有手机号码
                {
                    printf("▶️已发送验证码到手机,请输入验证码(🔙可输入'...'取消找回密码🔙)：");
                    temp_namestatu = [super seekRule:LCQKeyRule_TestCode AndJudgeSaveUser:&olduserdata];
                    if (temp_namestatu == LCQResultKeyRule_OK)
                    {
                        pristatu = uimain_Choose_printfpassword;
                    }
                }
                else
                {
                    printf("❎您注册时没有留下手机号码，请选择其他方式\n");
                    pristatu = uimain_Choose_method;
                    printf("=========================================\n");
                }
                break;
                
            case uimain_Choose_email:
                if(newuser.email != nil)   //是否有Email
                {
                    printf("▶️已发送验证码到邮箱,请输入验证码(🔙可输入'...'取消找回密码🔙)：");
                    temp_namestatu = [super seekRule:LCQKeyRule_TestCode AndJudgeSaveUser:&olduserdata];
                    if (temp_namestatu == LCQResultKeyRule_OK)
                    {
                        pristatu = uimain_Choose_printfpassword;
                    }
                }
                else
                {
                    printf("❎您注册时没有留下Email，请选择其他方式\n");
                    pristatu = uimain_Choose_method;
                    printf("=========================================\n");
                }
                break;
                
            case uimain_Choose_question:
                printf("         ▶️1.问题1:%s?\n",QUESTION_FRIST);
                printf("         ▶️2.问题2:%s?\n",QUESTION_SECON);
                printf("         ▶️3.问题3:%s?\n",QUESTION_THREE);
                printf("▶️请选择密保序号(1-3)(🔙可输入'...'取消找回密码🔙):");
                temp_namestatu = [super seekRule:LCQKeyRule_Numb AndJudgeSaveUser:&olduserdata];
                if (temp_namestatu == LCQResultKeyRule_OK)
                {
                    int tempjudge = [olduserdata.member intValue];
                    switch (tempjudge)
                    {
                        case (uimain_Choose_question1-uimain_Choose_question):
                            pristatu = uimain_Choose_question1;
                            printf("=========================================\n");
                            break;
                            
                        case (uimain_Choose_question2-uimain_Choose_question):
                            pristatu = uimain_Choose_question2;
                            printf("=========================================\n");
                            break;
                            
                        case (uimain_Choose_question3-uimain_Choose_question):
                            pristatu = uimain_Choose_question3;
                            printf("=========================================\n");
                            break;
                        default:
                            printf("%s",ERROR0x01_ILLEGAL_NUM);
                            break;
                    }
                }
                break;
                
            case uimain_Choose_question1:
                if (newuser.answer1 != nil)          //判断是否有留下密保
                {
                    printf("▶️1.问题1:%s?\n",QUESTION_FRIST);
                    printf("▶️请输入密保答案(🔙可输入'...'取消找回密码🔙):");
                    temp_namestatu = [super seekRule:LCQKeyRule_Answer1 AndJudgeSaveUser:&olduserdata];
                    if (temp_namestatu == LCQResultKeyRule_OK)
                    {
                        if([olduserdata.answer1 isEqualToString:newuser.answer1] == YES )       //比对密保答案
                        {
                            pristatu = uimain_Choose_printfpassword;
                        }
                        else
                        {
                            printf("%s",ERROR0x07_ILLEGAL_PRO_PASSWORD);
                            pristatu = uimain_Choose_method;
                            printf("=========================================\n");
                        }
                    }
                }
                else
                {
                    printf("❎您注册时没有留下密保1，请选择其他方式\n");
                    pristatu = uimain_Choose_method;
                    printf("=========================================\n");
                }
                break;

            case uimain_Choose_question2:
                if (newuser.answer2 != nil)          //判断是否有留下密保
                {
                    printf("▶️2.问题2:%s?\n",QUESTION_SECON);
                    printf("▶️请输入密保答案(🔙可输入'...'取消找回密码🔙):");
                    temp_namestatu = [super seekRule:LCQKeyRule_Answer2 AndJudgeSaveUser:&olduserdata];
                    if (temp_namestatu == LCQResultKeyRule_OK)
                    {
                        if([olduserdata.answer2 isEqualToString:newuser.answer2] == YES )       //比对密保答案
                        {
                            pristatu = uimain_Choose_printfpassword;
                        }
                        else
                        {
                            printf("%s",ERROR0x07_ILLEGAL_PRO_PASSWORD);
                            pristatu = uimain_Choose_method;
                            printf("=========================================\n");
                        }
                    }
                }
                else
                {
                    printf("❎您注册时没有留下密保2，请选择其他方式\n");
                    pristatu = uimain_Choose_method;
                    printf("=========================================\n");
                }
                break;
                
            case uimain_Choose_question3:
                if (newuser.answer3 != nil)          //判断是否有留下密保
                {
                    printf("▶️3.问题3:%s?\n",QUESTION_THREE);
                    printf("▶️请输入密保答案(🔙可输入'...'取消找回密码🔙):");
                    temp_namestatu = [super seekRule:LCQKeyRule_Answer3 AndJudgeSaveUser:&olduserdata];
                    if (temp_namestatu == LCQResultKeyRule_OK)
                    {
                        if([olduserdata.answer3 isEqualToString:newuser.answer3] == YES )       //比对密保答案
                        {
                            pristatu = uimain_Choose_printfpassword;
                        }
                        else
                        {
                            printf("%s",ERROR0x07_ILLEGAL_PRO_PASSWORD);
                            pristatu = uimain_Choose_method;
                            printf("=========================================\n");
                        }
                    }
                }
                else
                {
                    printf("❎您注册时没有留下密保3，请选择其他方式\n");
                    pristatu = uimain_Choose_method;
                    printf("=========================================\n");
                }
                break;
                
            case uimain_Choose_printfpassword:
                printf("====================================\n");
                printf("✅你的");
                [newuser printfPassword];       //输出密码
                printf("\n");
                [super uiReturnUpUi:(MainInterface | M_home)];
                return;
 
            default:
                break;
        }
        //这里的状态是底层UI.m检测到'...'，想切回主界面，但困在while出不去
        if(MyStatuP.StaNow == (MainInterface | M_home))
        {
            [self enterWaitTimer];
            break;
        }
    }
}

@end
