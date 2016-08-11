//
//  Uicommonuser.m
//  项目1
//
//  Created by Leonlincq on 16/8/11.
//  Copyright © 2016年 Leonlincq. All rights reserved.
//

#import "Uicommonuser.h"

@implementation Uicommonuser

//==========================
//      普通用户接口
//==========================
-(void)uiCommonUserInterface:(Status**)tempstatu
{
    switch ((*tempstatu).StaNow)
    {
        case (CommonUser | C_home):             //普通用户首页
            [self uiCommonUserHome:(Status**)tempstatu];
            break;
            
        case (CommonUser | C_userDeposit):      //用户存款
            //?
            break;
            
        case (CommonUser | C_userDrawMoney):    //用户取款
            //?
            break;
            
        case (CommonUser | C_lookMoneyGo):      //查看用户资金走向
            //?
            break;
            
        case (CommonUser | C_usertGiro):        //用户转账
            //?
            break;
            
        case (CommonUser | C_upPasswordData):   //修改密码
            //?
            break;
            
        case (CommonUser | C_buyWares):         //购买商品
            //?
            break;
            
        case (CommonUser | C_operaOrder ):      //订单操作
            //?
            break;
            
        case (CommonUser | C_shopCar):          //购物车
            //?
            break;
 
        //不应该出现的状态
        case (CommonUser | C_returnWelcome):   //返回欢迎界面
        default:
            [self uiError:*tempstatu];
            break;
    }
}

//==========================
//      普通用户界面
//==========================
-(void)uiCommonUserHome:(Status**)tempstatu
{
    NSLog(@"         🌳      用户      🌳         ");
    NSLog(@"======================================");
    NSLog(@"*           🐴1.用户存款              *");
    NSLog(@"*           🐑2.用户取款              *");
    NSLog(@"*           🐧3.查看资金流向           *");
    NSLog(@"*           🐶4.用户转账              *");
    NSLog(@"*           🐘5.修改密码              *");
    NSLog(@"*           🐤6.购买商品              *");
    NSLog(@"*           🐔7.订单操作              *");
    NSLog(@"*           🐹8.购物车                *");
    NSLog(@"*           🐼9.返回登录界面           *");
    NSLog(@"======================================");
    
    printf("请输入操作序号(1-9):");
    
    
}

@end
