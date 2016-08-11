//
//  Uisuperuser.m
//  项目1
//
//  Created by Leonlincq on 16/8/11.
//  Copyright © 2016年 Leonlincq. All rights reserved.
//

#import "Uisuperuser.h"

@implementation Uisuperuser

//==========================
//      超级用户接口
//==========================
-(void)uiSuperUserInterface:(Status**)tempstatu
{
    switch ((*tempstatu).StaNow)
    {
        case (SuperUser | S_home):              //超级用户界面首页
            [self uiSuperUserHome:(Status**)tempstatu];
            break;
            
        case (SuperUser | S_seekUserData):      //查看用户信息
            //?
            break;
            
        case (SuperUser | S_upUserData):        //修改用户信息
            //?
            break;
            
        case (SuperUser | S_deleUserData):      //删除用户信息
            //?
            break;
            
        case (SuperUser | S_operaUserMoney):    //用户资金操作
            //?
            break;
            
        case (SuperUser | S_operaWares):        //商品操作
            //?
            break;
            
        case (SuperUser | S_operaOrder):        //订单操作
            //?
            break;
            
        case (SuperUser | S_addUser):           //添加用户
            //?
            break;
            
        case (SuperUser | S_cleProPassWord):    //密保库清0
            //?
            break;
            
        case (SuperUser | S_clemoneyhistory):   //资金历史记录清除
            //?
            break;
            
        case (SuperUser | S_seekProPassWord):   //查看用户密保
            //?
            break;
            
            
        //不应该出现的状态
        case (SuperUser | S_returnMain):        //返回主界面（登录界面）
        default:
            [self uiError:*tempstatu];
            break;
    }
}


//==========================
//      超级用户界面
//==========================
-(void)uiSuperUserHome:(Status**)tempstatu
{
    NSLog(@"         🌳     管理员     🌳         ");
    NSLog(@"======================================");
    NSLog(@"*           🐴1.查看用户信息           *");
    NSLog(@"*           🐑2.修改用户名字           *");
    NSLog(@"*           🐧3.删除用户信息           *");
    NSLog(@"*           🐶4.用户资金操作           *");
    NSLog(@"*           🐘5.商品操作               *");
    NSLog(@"*           🐤6.订单操作               *");
    NSLog(@"*           🐔7.添加用户               *");
    NSLog(@"*           🐹8.密保库清0              *");
    NSLog(@"*           🐼9.历史资金清除           *");
    NSLog(@"*           🐬10.查看用户密保          *");
    NSLog(@"*           🐠11.返回登录界面          *");
    NSLog(@"======================================");
    
    printf("请输入操作序号(1-11):");
    
    
}

@end
