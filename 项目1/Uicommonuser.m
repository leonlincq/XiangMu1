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
            [self uiCommonUserUserDeposit:(Status**)tempstatu];
            break;
            
        case (CommonUser | C_userDrawMoney):    //用户取款
            [self uiCommonUserUserDrawMoney:(Status**)tempstatu];
            break;
            
        case (CommonUser | C_lookMoneyGo):      //查看用户资金走向
            [self uiCommonUserLookMoneyGo:(Status**)tempstatu];
            break;
            
        case (CommonUser | C_usertGiro):        //用户转账
            [self uiCommonUserUsertGiro:(Status**)tempstatu];
            break;
            
        case (CommonUser | C_upPasswordData):   //修改密码
            [self uiCommonUserUpPasswordData:(Status**)tempstatu];
            break;
            
        case (CommonUser | C_buyWares):         //购买商品
            [self uiCommonUserBuyWares:(Status**)tempstatu];
            break;
            
        case (CommonUser | C_operaOrder ):      //订单操作
            [self uiCommonUserOperaOrder:(Status**)tempstatu];
            break;
            
        case (CommonUser | C_shopCar):          //购物车
            [self uiCommonUserShopCar:(Status**)tempstatu];
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
    
    //等待保存读取出来的键值
    NSString *temp_data = [[NSString alloc]init];
    //合法性判断
    BOOL temp_bool;
    
    while (1)
    {
        printf("请输入操作序号(1-9):");
        temp_bool = [self inputDataAndSave:&temp_data andJudge:onlyNumb];
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
                case C_userDeposit:
                    [(*tempstatu) StatuChange:(CommonUser | tempjudge)];    //普通用户界面+用户存款
                    return;
                    
                case C_userDrawMoney:
                    [(*tempstatu) StatuChange:(CommonUser | tempjudge)];    //普通用户界面+用户取款
                    return;
                    
                case C_lookMoneyGo:
                    [(*tempstatu) StatuChange:(CommonUser | tempjudge)];    //普通用户界面+查看用户资金走向
                    return;
                    
                case C_usertGiro:
                    [(*tempstatu) StatuChange:(CommonUser | tempjudge)];    //普通用户界面+用户转账
                    return;
                    
                case C_upPasswordData:
                    [(*tempstatu) StatuChange:(CommonUser | tempjudge)];    //普通用户界面+修改密码
                    return;
                    
                case C_buyWares:
                    [(*tempstatu) StatuChange:(CommonUser | tempjudge)];    //普通用户界面+购买商品
                    return;
                    
                case C_operaOrder:
                    [(*tempstatu) StatuChange:(CommonUser | tempjudge)];    //普通用户界面+订单操作
                    return;
                    
                case C_shopCar:
                    [(*tempstatu) StatuChange:(CommonUser | tempjudge)];    //普通用户界面+购物车
                    return;
                    
                case C_returnWelcome:
                    [(*tempstatu) StatuChange:(MainInterface | M_home)];    //返回主界面（登录界面）
                    return;

                default:
                    NSLog(@"无效指令，请重输%@",ERROR0x02);
                    break;
            }//判断数字
        }//结束键值不含字母或字符
    }//结束while(1)等待合法键值
}

//==========================
//     Ui普通用户界面功能升级中
//==========================
-(void)uiCommonUserUping:(Status**)tempstatu
{
    NSLog(@"升级ing...");
    [(*tempstatu) StatuChange:(CommonUser | C_home)];
}

//==========================
//     用户存款
//==========================
-(void)uiCommonUserUserDeposit:(Status**)tempstatu
{
    [self uiCommonUserUping:(Status**)tempstatu];
}

//==========================
//     用户取款
//==========================
-(void)uiCommonUserUserDrawMoney:(Status**)tempstatu
{
    [self uiCommonUserUping:(Status**)tempstatu];
}

//==========================
//     查看用户资金走向
//==========================
-(void)uiCommonUserLookMoneyGo:(Status**)tempstatu
{
    [self uiCommonUserUping:(Status**)tempstatu];
}

//==========================
//     用户转账
//==========================
-(void)uiCommonUserUsertGiro:(Status**)tempstatu
{
    [self uiCommonUserUping:(Status**)tempstatu];
}

//==========================
//     修改密码
//==========================
-(void)uiCommonUserUpPasswordData:(Status**)tempstatu
{
    [self uiCommonUserUping:(Status**)tempstatu];
}

//==========================
//     购买商品
//==========================
-(void)uiCommonUserBuyWares:(Status**)tempstatu
{
    [self uiCommonUserUping:(Status**)tempstatu];
}

//==========================
//     订单操作
//==========================
-(void)uiCommonUserOperaOrder:(Status**)tempstatu
{
    [self uiCommonUserUping:(Status**)tempstatu];
}

//==========================
//     购物车
//==========================
-(void)uiCommonUserShopCar:(Status**)tempstatu
{
    [self uiCommonUserUping:(Status**)tempstatu];
}

@end
