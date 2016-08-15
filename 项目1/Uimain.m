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
        _countByTimer = 5;
    }
    return self;
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
            
        case (MainInterface | M_registerNewUser):   //注册用户
            [self uiMainRegisterNewUser];
            break;
            
        case (MainInterface | M_foundPassWord):    //找回密码
            [self uiMainFoundPassWord];
            break;
            
            //不应该出现的状态
        case (MainInterface | M_returnWelcome):     //返回欢迎界面
        case (MainInterface | M_superUserSign):     //超级用户界面
        case (MainInterface | M_commonUserSign):    //普通用户界面
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
    Status *MyStatuP = [Status statusShallOneData];
  
    printf("         🌳在线销售系统欢迎您🌳         \n");
    printf("======================================\n");
    printf("*           🐴1.超级管理登录           *\n");
    printf("*           🐑2.普通用户登录           *\n");
    printf("*           🐧3.注册新的用户           *\n");
    printf("*           🐶4.找回用户密码           *\n");
    printf("*           🐘5.返回欢迎界面           *\n");
    printf("======================================\n");
    
    NSString *temp_data = [[NSString alloc]init];    //等待保存读取出来的键值
    BOOL temp_bool;     //合法性判断
    
    while (1)
    {
        printf("请输入操作序号(1~5):");
        
        temp_bool = [super inputDataAndSaveIn:&temp_data andJudge:onlyNumb];
        
        if (temp_bool == NO)   //不是只有数字
        {
            printf("%s",ERROR0x00_NO_NUM);
        }
        else                    //只有数字
        {
#if TEST == 1      //调试模式
            NSLog(@"读取到的按键=%@,长度=%lu",temp_data,temp_data.length);
#endif
            //数值的合法性      超过int的max会取intmax，不用担心越界
            int tempjudge = [temp_data intValue];
            
#if TEST == 1      //调试模式
            NSLog(@"转换后的数据 = %d",tempjudge);
#endif
            switch ( tempjudge )
            {
                case M_superUserSign:
                    [MyStatuP StatuChange:(SuperUser | S_home)];        //超级管理员界面+首页
                    return;
                        
                case M_commonUserSign:
                    [MyStatuP StatuChange:(CommonUser | C_home)];       //普通用户界面+首页
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
        }//只有数字的情况
    }//结束while(1)等待合法键值
}

//==========================
//      开机主界面注册新用户
//==========================
-(void)uiMainRegisterNewUser
{
    Status *MyStatuP = [Status statusShallOneData];
    
    Manageuserdatas *newuser = [[Manageuserdatas alloc]init];
    Operateuserdatas *newop = [[Operateuserdatas alloc]init];
    
    NSString *tempdata = [[NSString alloc]init];
    
    NSUInteger tempstatu = register_name;
    
    NSMutableArray *tempuser = [[NSMutableArray alloc]init];

    
    printf("=========================================\n");

    while (1)
    {
        switch (tempstatu)
        {
            case register_name:                //输入用户
                printf("请输入用户名(6-30位，只能是数字、字母、下划线)：\n");
                if ([super inputDataAndSaveIn:&tempdata andJudge:onlyNumbCharCross] == NO)
                {
                    printf("%s",ERROR0x02_ILLEGAL_CHAR_AND_NAME_LENGTH);
                }
                else
                {
                    if ([newop selectUser:tempdata andSaveArray:&tempuser] == FILEYES )
                    {
                        if(tempuser.count != 0)
                        {
                            printf("%s",ERROR0x08_REPE_NAME);
                        }
                        else
                        {
                            newuser.name = tempdata;
                            tempstatu = register_password;
                            printf("=========================================\n");
                        }
                    }
                    else
                    {
                        printf("%s",ERROR0xFE_FILE_OPNE_ERROR);
                    }
                }
                break;
                
            case register_password:                //输入密码
                printf("请输入密码(6-30位)：\n");
                if ([super inputDataAndSaveIn:&tempdata andJudge:allKeyValue] == YES && (tempdata.length>=6 && tempdata.length<=30 ))
                {
                    newuser.password = tempdata;
                    tempstatu = register_realname;
                    printf("=========================================\n");
                }
                else
                {
                    printf("%s",ERROR0x03_ILLEGAL_PASSWORD_LENGTH);
                }
                break;
                
            case register_realname:                //输入真名
                printf("请输入真名(6-30位英文字母)：\n");
                if ([super inputDataAndSaveIn:&tempdata andJudge:onlyChar] == NO)
                {
                    printf("%s",ERROR0x02_ILLEGAL_CHAR_AND_NAME_LENGTH);
                }
                else
                {
                    newuser.realname = tempdata;
                    tempstatu = register_email;
                    printf("=========================================\n");
                }
                break;
                
            case register_email:                //输入邮箱
                printf("请输入邮箱地址(或输入'...'跳过，以后再完善)：\n");
                if ([super inputDataAndSaveIn:&tempdata andJudge:onlyEmailOrPoint] == YES )
                {
                    if ( [tempdata characterAtIndex:0] == '.')
                    {
                        newuser.email = nil;
                    }
                    else
                    {
                        newuser.email = tempdata;
                    }
                    tempstatu = register_phonenum;
                    printf("=========================================\n");
                }
                else
                {
                    printf("%s",ERROR0x04_ILLEGAL_EMAIL_POINT);
                }
                break;

            case register_phonenum:                //输入电话
                printf("请输入电话号码(只能是13开头)或座机号码(座机可不加区号，加区号得用-隔开)(或输入'...'跳过，以后再完善)：\n");
                if ([super inputDataAndSaveIn:&tempdata andJudge:onlyPhoneOrPoint] == YES )
                {
                    if ( [tempdata characterAtIndex:0] == '.')
                    {
                        newuser.phonenum = nil;
                    }
                    else
                    {
                        newuser.phonenum = tempdata;
                    }
                    tempstatu = register_member;
                    printf("=========================================\n");
                }
                else
                {
                    printf("%s",ERROR0x09_ILLEGAL_PHONE_POINT);
                }
                break;
                
            case register_member:               //输入会员
                newuser.member = @"1级会员";
                tempstatu = register_question1;
                break;
                
            case register_question1:
                newuser.question1 = @QUESTION_FRIST;
                tempstatu = register_answer1;
                break;

            case register_answer1:             //输入密保1答案
                printf("*第一个密保问题：%s\n",QUESTION_FRIST);
                printf("请输入第一个密保答案(或输入'...'跳过，以后再完善)：\n");
                if ([super inputDataAndSaveIn:&tempdata andJudge:allKeyValue] == YES )
                {
                    if ( [tempdata characterAtIndex:0] == '.')
                    {
                        newuser.answer1 = nil;
                    }
                    else
                    {
                        newuser.answer1 = tempdata;
                    }
                    tempstatu = register_question2;
                    printf("=========================================\n");
                }
                else
                {
                    NSLog(@"%s",ERROR0xFF_NO_ERROR);
                }
                break;

            case register_question2:
                newuser.question2 = @QUESTION_SECON;
                tempstatu = register_answer2;
                break;
                
            case register_answer2:               //输入密保2答案
                printf("*第二个密保问题：%s\n",QUESTION_SECON);
                printf("请输入第二个密保答案(或输入'...'跳过，以后再完善)：\n");
                if ([super inputDataAndSaveIn:&tempdata andJudge:allKeyValue] == YES )
                {
                    if ( [tempdata characterAtIndex:0] == '.')
                    {
                        newuser.answer2 = nil;
                    }
                    else
                    {
                        newuser.answer2 = tempdata;
                    }
                    tempstatu = register_question3;
                    printf("=========================================\n");
                }
                else
                {
                    NSLog(@"%s",ERROR0xFF_NO_ERROR);
                }
                break;
                
            case register_question3:
                newuser.question3 = @QUESTION_THREE;
                tempstatu = register_answer3;
                break;
                
            case register_answer3:               //输入密保3答案
                printf("*第三个密保问题：%s\n",QUESTION_THREE);
                printf("请输入第三个密保答案(或输入'...'跳过，以后再完善)：\n");
                if ([super inputDataAndSaveIn:&tempdata andJudge:allKeyValue] == YES )
                {
                    if ( [tempdata characterAtIndex:0] == '.')
                    {
                        newuser.answer3 = nil;
                    }
                    else
                    {
                        newuser.answer3 = tempdata;
                    }
                    tempstatu = register_returnmain;
                    printf("=========================================\n");
                }
                else
                {
                    printf("%s",ERROR0xFF_NO_ERROR);
                }
                break;


            case register_returnmain:
            default:
                break;
        }
        if (tempstatu == register_returnmain)
        {
            break;
        }
    }
    [newop addUser:newuser];
    
    printf("注册成功，信息如下:\n");
    [newuser printfAllData];
    
    [MyStatuP StatuChange:WaitTimer];
    
    _countByTimer = 6;
    [_myTick setFireDate:[NSDate distantPast]];
}

//==========================
//      定时器控制
//==========================
-(void)oneSecTick:(NSTimer*)temptimer
{
    _countByTimer--;
    printf("%ld秒后返回主界面...\n",_countByTimer);
    
    if(_countByTimer == 0)
    {
        [_myTick setFireDate:[NSDate distantFuture]];
        Status *MyStatuP = [Status statusShallOneData];
        [MyStatuP StatuChange:(MainInterface | M_home)];
    }
}

//==========================
//      开机主界面找回密码
//==========================
-(void)uiMainFoundPassWord
{
    Status *MyStatuP = [Status statusShallOneData];
    
    Manageuserdatas *newuser = [[Manageuserdatas alloc]init];
    Operateuserdatas *newop = [[Operateuserdatas alloc]init];
    NSMutableArray *tempuser = [[NSMutableArray alloc]init];
    
    NSString *tempdata = [[NSString alloc]init];
    NSUInteger pristatu = choose_inputname;
    
    //输入用户名
    while (1)
    {
        switch (pristatu)
        {
            case choose_inputname:
                printf("请输入您的用户名(6-30位，数字、字母、下划线)（或输入'...'取消找回密码）：\n");
                if ([super inputDataAndSaveIn:&tempdata andJudge:onlyNameOrPoint] == NO)
                {
                    printf("%s",ERROR0x02_ILLEGAL_CHAR_AND_NAME_LENGTH);
                }
                else
                {
                    if ( [tempdata characterAtIndex:0] == '.')
                    {
                        pristatu = choose_returnmain;
                    }
                    else
                    {
                        if([newop selectUser:tempdata andSaveArray:&tempuser] == FILEYES)
                        {
                            if (tempuser.count != 0)
                            {
                                newuser = [tempuser[0] copy];
                                pristatu = choose_method;

                            }
                            else
                            {
                                printf("%s",ERROR0x05_NO_FOUND_NAME);
                            }
                            
                        }
                        else
                        {
                            printf("%s",ERROR0xFE_FILE_OPNE_ERROR);
                        }
                    }
                }
                break;
                
            case choose_method:
                printf("1.手机找回密码 2.Email找回密码 3.密保找回密码（或输入'...'取消找回密码）\n");
                printf("请选择找回密码方式序号（1-3）:");
                if ([super inputDataAndSaveIn:&tempdata andJudge:onlyNumbOrPoint] == NO)
                {
                    printf("%s",ERROR0x00_NO_NUM);
                }
                else
                {
                    if ( [tempdata characterAtIndex:0] == '.')
                    {
                        pristatu = choose_returnmain;
                    }
                    else
                    {
                        int tempjudge = [tempdata intValue];
                        switch (tempjudge)
                        {
                            case (choose_phone-choose_method):
                                pristatu = choose_phone;
                                break;
                                
                            case (choose_email-choose_method):
                                pristatu = choose_email;
                                break;
                                
                            case (choose_question-choose_method):
                                pristatu = choose_question;
                                break;
                            default:
                                printf("%s",ERROR0x01_ILLEGAL_NUM);                            
                                break;
                        }
                    }
                }
                break;
                
                
            case choose_phone:
                if(newuser.phonenum != nil)   //是否有手机号码
                {
                    printf("已发送验证码到手机\n");
                    printf("请输入验证码（或输入'...'取消找回密码）：");
                    if ([super inputDataAndSaveIn:&tempdata andJudge:onlyadminOrPoint] == NO)
                    {
                        printf("%s",ERROR0x06_NO_ADMIN_POINT);
                    }
                    else
                    {
                        if ( [tempdata characterAtIndex:0] == '.')
                        {
                            pristatu = choose_returnmain;
                        }
                        else
                        {
                            pristatu = outputpassword;
                        }
                    }
                }
                else
                {
                    printf("您注册时没有留下手机号码，请选择其他方式\n");
                    pristatu = choose_method;
                }
                break;
                
            case choose_email:
                if(newuser.email != nil)   //是否有Email
                {
                    printf("已发送验证码到邮箱\n");
                    printf("请输入验证码（或输入'...'取消找回密码）：");
                    if ([super inputDataAndSaveIn:&tempdata andJudge:onlyadminOrPoint] == NO)
                    {
                        printf("%s",ERROR0x06_NO_ADMIN_POINT);
                    }
                    else
                    {
                        if ( [tempdata characterAtIndex:0] == '.')
                        {
                            pristatu = choose_returnmain;
                        }
                        else
                        {
                            pristatu = outputpassword;
                        }
                    }
                }
                else
                {
                    printf("您注册时没有留下Email，请选择其他方式\n");
                    pristatu = choose_method;
                }
                break;
                
            case choose_question:
                printf("1.问题1:%s?\n",QUESTION_FRIST);
                printf("2.问题2:%s?\n",QUESTION_SECON);
                printf("3.问题3:%s?\n",QUESTION_THREE);
                printf("请选择密保序号(1-3)(或输入'...'取消找回密码):");
                if ([super inputDataAndSaveIn:&tempdata andJudge:onlyNumbOrPoint] == NO)
                {
                    printf("%s",ERROR0x00_NO_NUM);
                }
                else
                {
                    if ( [tempdata characterAtIndex:0] == '.')
                    {
                        pristatu = choose_returnmain;
                    }
                    else
                    {
                        int tempjudge = [tempdata intValue];
                        switch (tempjudge)
                        {
                            case (choose_question1-choose_question):
                                pristatu = choose_question1;
                                break;
                                
                            case (choose_question2-choose_question):
                                pristatu = choose_question2;
                                break;
                                
                            case (choose_question3-choose_question):
                                pristatu = choose_question3;
                                break;
                            default:
                                printf("%s",ERROR0x01_ILLEGAL_NUM);
                                break;
                        }
                    }
                
                }
                break;
                
            case choose_question1:
                if (newuser.answer1 != nil)          //判断是否有留下密保
                {
                    printf("1.问题1:%s?\n",QUESTION_FRIST);
                    printf("请输入密保答案(或输入'...'取消找回密码):");
                    if ([super inputDataAndSaveIn:&tempdata andJudge:allKeyValue] == NO)
                    {
                        printf("%s",ERROR0xFF_NO_ERROR);
                    }
                    else
                    {
                        if ( [super isValidateThreePoint:tempdata] == YES )
                        {
                            pristatu = choose_returnmain;
                        }
                        else
                        {
                            if([tempdata isEqualToString:newuser.answer1] == YES )       //比对密保答案
                            {
                                pristatu = outputpassword;
                            }
                            else
                            {
                                printf("%s",ERROR0x07_ILLEGAL_PRO_PASSWORD);
                                pristatu = choose_method;
                            }
                        }
                        
                    }
                }
                else
                {
                    printf("您注册时没有留下密保1，请选择其他方式\n");
                    pristatu = choose_method;
                }
                break;

            case choose_question2:
                if (newuser.answer2 != nil)          //判断是否有留下密保
                {
                    printf("2.问题2:%s?\n",QUESTION_SECON);
                    printf("请输入密保答案(或输入'...'取消找回密码):");
                    if ([super inputDataAndSaveIn:&tempdata andJudge:allKeyValue] == NO)
                    {
                        printf("%s",ERROR0xFF_NO_ERROR);
                    }
                    else
                    {
                        if ( [self isValidateThreePoint:tempdata] == YES )
                        {
                            pristatu = choose_returnmain;
                        }
                        else
                        {
                            if([tempdata isEqualToString:newuser.answer2] == YES )       //比对密保答案
                            {
                                pristatu = outputpassword;
                            }
                            else
                            {
                                printf("%s",ERROR0x07_ILLEGAL_PRO_PASSWORD);
                                pristatu = choose_method;
                            }
                        }
                        
                    }
                }
                else
                {
                    printf("您注册时没有留下密保2，请选择其他方式\n");
                    pristatu = choose_method;
                }
                break;
                
            case choose_question3:
                if (newuser.answer3 != nil)          //判断是否有留下密保
                {
                    printf("3.问题3:%s?\n",QUESTION_THREE);
                    printf("请输入密保答案(或输入'...'取消找回密码):");
                    if ([super inputDataAndSaveIn:&tempdata andJudge:allKeyValue] == NO)
                    {
                        printf("%s",ERROR0xFF_NO_ERROR);
                    }
                    else
                    {
                        if ( [self isValidateThreePoint:tempdata] == YES )
                        {
                            pristatu = choose_returnmain;
                        }
                        else
                        {
                            if([tempdata isEqualToString:newuser.answer3] == YES )       //比对密保答案
                            {
                                pristatu = outputpassword;
                            }
                            else
                            {
                                printf("%s",ERROR0x07_ILLEGAL_PRO_PASSWORD);
                                pristatu = choose_method;
                            }
                        }
                        
                    }
                }
                else
                {
                    printf("您注册时没有留下密保3，请选择其他方式\n");
                    pristatu = choose_method;
                }
                break;
                
            case outputpassword:
                printf("====================================\n");
                printf("你的");
                [newuser printfPassword];       //输出密码
                printf("\n");
                printf("====================================\n");
                
                _countByTimer = 6;
                [_myTick setFireDate:[NSDate distantPast]];
                [MyStatuP StatuChange:WaitTimer];
                return;
                
            case choose_returnmain:
                [MyStatuP StatuChange:(MainInterface | M_home)];
                return;
                
            default:
                break;
        }
    }
}

@end
