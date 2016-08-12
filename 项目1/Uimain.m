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
    
    //等待保存读取出来的键值
    NSString *temp_data = [[NSString alloc]init];
    //合法性判断
    BOOL temp_bool;
    
    while (1)
    {
        printf("请输入操作序号(1~5):");
        temp_bool = [super inputDataAndSave:&temp_data andJudge:onlyNumb];
        //键值的合法性
        if ( temp_bool == NO )
        {
            NSLog(@"无效指令，请重输%@",ERROR0x01);
        }
        else
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
                    NSLog(@"无效指令，请重输%@",ERROR0x02);
                    break;
            }//判断数字
        }//结束键值不含字母字符
    }//结束while(1)等待合法键值
}

//==========================
//     Ui主界面功能升级中
//==========================
-(void)uiMainUping
{
    Status *MyStatuP = [Status statusShallOneData];
    
    NSLog(@"升级ing...");
    [MyStatuP StatuChange:(MainInterface | M_home)];
}

//==========================
//      开机主界面注册新用户
//==========================
-(void)uiMainRegisterNewUser
{
    Status *MyStatuP = [Status statusShallOneData];
    
    [self uiMainUping];
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
