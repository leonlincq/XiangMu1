//
//  Uimain.m
//  项目1
//
//  Created by Leonlincq on 16/8/11.
//  Copyright © 2016年 Leonlincq. All rights reserved.
//

#import "Uimain.h"

@implementation Uimain

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
//     Ui主界面功能升级中
//==========================
-(void)uiMainUping
{
    Status *MyStatuP = [Status statusShallOneData];
    
    printf("升级ing...\n");
    [MyStatuP StatuChange:(MainInterface | M_home)];
}

//==========================
//      开机主界面注册新用户
//==========================
-(void)uiMainRegisterNewUser
{
    Status *MyStatuP = [Status statusShallOneData];
    
    Manageuserdatas *newuser = [[Manageuserdatas alloc]init];
    NSString *tempdata = [[NSString alloc]init];

    //输入用户
    while (1)
    {
        printf("=========================================\n");
        printf("请输入用户名(6-30位，只能是数字、字母、下划线)：\n");
        if ([super inputDataAndSaveIn:&tempdata andJudge:onlyNumbCharCross] == NO)
        {
                printf("=========================================\n");
                printf("%s",ERROR0x02_ILLEGAL_CHAR_AND_NAME_LENGTH);
        }
        else
        {
            newuser.name = tempdata;
            break;
        }
    }

    //输入密码
    while (1)
    {
        printf("=========================================\n");
        printf("请输入密码(6-30位)：\n");
        if ([super inputDataAndSaveIn:&tempdata andJudge:allKeyValue] == YES && (tempdata.length>6 && tempdata.length<30 ))
        {
            newuser.password = tempdata;
            break;
        }
        else
        {
            printf("=========================================\n");
            printf("%s",ERROR0x03_ILLEGAL_PASSWORD_LENGTH);
        }
    }
    
    //输入邮箱
    while (1)
    {
        printf("=========================================\n");
        printf("请输入邮箱地址(或输入'...'跳过，以后再完善)：\n");
        
        if ([super inputDataAndSaveIn:&tempdata andJudge:onlyEmailOrSpace] == YES )
        {
            if ( [tempdata characterAtIndex:0] == ' ')
            {
                newuser.email = nil;
            }
            else
            {
                newuser.email = tempdata;
            }
            break;
        }
        else
        {
            printf("=========================================\n");
            printf("%s",ERROR0x04_ILLEGAL_EMAIL_SPACE);
        }
    }

    //输入电话
    while (1)
    {
        printf("=========================================\n");
        printf("请输入电话号码(只能是13开头)或座机号码(座机可不加区号，加区号得用-隔开)(或输入'...'跳过，以后再完善)：\n");
        
        if ([super inputDataAndSaveIn:&tempdata andJudge:onlyPhoneOrSpace] == YES )
        {
            if ( [tempdata characterAtIndex:0] == ' ')
            {
                newuser.phonenum = nil;
            }
            else
            {
                newuser.phonenum = tempdata;
            }
            break;
        }
        else
        {
            printf("=========================================\n");
            printf("%s",ERROR0x04_ILLEGAL_EMAIL_SPACE);
        }
    }
    
    //超级用户操作
    //NSString    *member;    //会员
    
    //输入密保1答案
    while (1)
    {
        printf("=========================================\n");
        printf("*第一个密保问题：%s\n",QUESTION_FRIST);
        printf("=========================================\n");
        printf("请输入第一个密保答案(或输入'...'跳过，以后再完善)：\n");
        
        if ([super inputDataAndSaveIn:&tempdata andJudge:allKeyValue] == YES )
        {
            if ( [tempdata characterAtIndex:0] == ' ')
            {
                newuser.answer1 = nil;
            }
            else
            {
                newuser.answer1 = tempdata;
            }

            break;
        }
        else
        {
            printf("=========================================\n");
            NSLog(@"%s",ERROR0xFF_NO_ERROR);
        }
    }
    
    //输入密保2答案
    while (1)
    {
        printf("=========================================\n");
        printf("*第二个密保问题：%s\n",QUESTION_SECON);
        printf("=========================================\n");
        printf("请输入第二个密保答案(或输入'...'跳过，以后再完善)：\n");
        
        if ([super inputDataAndSaveIn:&tempdata andJudge:allKeyValue] == YES )
        {
            if ( [tempdata characterAtIndex:0] == ' ')
            {
                newuser.answer2 = nil;
            }
            else
            {
                newuser.answer2 = tempdata;
            }
            
            break;
        }
        else
        {
            printf("=========================================\n");
            NSLog(@"%s",ERROR0xFF_NO_ERROR);
        }
    }
    
    //输入密保3答案
    while (1)
    {
        printf("=========================================\n");
        printf("*第三个密保问题：%s\n",QUESTION_THREE);
        printf("=========================================\n");
        printf("请输入第三个密保答案(或输入'...'跳过，以后再完善)：\n");
        
        if ([super inputDataAndSaveIn:&tempdata andJudge:allKeyValue] == YES )
        {
            if ( [tempdata characterAtIndex:0] == ' ')
            {
                newuser.answer3 = nil;
            }
            else
            {
                newuser.answer3 = tempdata;
            }
            
            break;
        }
        else
        {
            printf("=========================================\n");
            printf("%s",ERROR0xFF_NO_ERROR);
        }
    }
    
    NSLog(@"%@",newuser);
    
    //[self uiMainUping];
}

//==========================
//      开机主界面找回密码
//==========================
-(void)uiMainFoundPassWord
{
    Status *MyStatuP = [Status statusShallOneData];
    
    [self uiMainUping];
}

@end
