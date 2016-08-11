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
            [self uiSuperUserSeekUserData:(Status**)tempstatu];
            break;
            
        case (SuperUser | S_upUserData):        //修改用户信息
            [self uiSuperUserUpUserData:(Status**)tempstatu];
            break;
            
        case (SuperUser | S_deleUserData):      //删除用户信息
            [self uiSuperUserDeleUserData:(Status**)tempstatu];
            break;
            
        case (SuperUser | S_operaUserMoney):    //用户资金操作
            [self uiSuperUserOperaUserMoney:(Status**)tempstatu];
            break;
            
        case (SuperUser | S_operaWares):        //商品操作
            [self uiSuperUserOperaWares:(Status**)tempstatu];
            break;
            
        case (SuperUser | S_operaOrder):        //订单操作
            [self uiSuperUserOperaOrder:(Status**)tempstatu];
            break;
            
        case (SuperUser | S_addUser):           //添加用户
            [self uiSuperUserAddUser:(Status**)tempstatu];
            break;
            
        case (SuperUser | S_cleProPassWord):    //密保库清0
            [self uiSuperUserCleProPassWord:(Status**)tempstatu];
            break;
            
        case (SuperUser | S_clemoneyhistory):   //资金历史记录清除
            [self uiSuperUserClemoneyhistory:(Status**)tempstatu];
            break;
            
        case (SuperUser | S_seekProPassWord):   //查看用户密保
            [self uiSuperUserSeekProPassWord:(Status**)tempstatu];
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
    
    //等待保存读取出来的键值
    NSString *temp_data = [[NSString alloc]init];
    //合法性判断
    BOOL temp_bool;
    
    while (1)
    {
        printf("请输入操作序号(1-11):");
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
                case S_seekUserData:
                    [(*tempstatu) StatuChange:(SuperUser | tempjudge)];     //超级用户界面+查看用户信息
                    return;
                        
                case S_upUserData:
                    [(*tempstatu) StatuChange:(SuperUser | tempjudge)];     //超级用户界面+修改用户信息
                    return;
                        
                case S_deleUserData:
                    [(*tempstatu) StatuChange:(SuperUser | tempjudge)];     //超级用户界面+删除用户信息
                    return;
                        
                case S_operaUserMoney:
                    [(*tempstatu) StatuChange:(SuperUser | tempjudge)];     //超级用户界面+用户资金操作
                    return;
                    
                case S_operaWares:
                    [(*tempstatu) StatuChange:(SuperUser | tempjudge)];     //超级用户界面+商品操作
                    return;
                    
                case S_operaOrder:
                    [(*tempstatu) StatuChange:(SuperUser | tempjudge)];     //超级用户界面+订单操作
                    return;
                    
                case S_addUser:
                    [(*tempstatu) StatuChange:(SuperUser | tempjudge)];     //超级用户界面+添加用户
                    return;
                    
                case S_cleProPassWord:
                    [(*tempstatu) StatuChange:(SuperUser | tempjudge)];     //超级用户界面+密保库清0
                    return;
                    
                case S_clemoneyhistory:
                    [(*tempstatu) StatuChange:(SuperUser | tempjudge)];     //超级用户界面+资金历史记录清除
                    return;
                    
                case S_seekProPassWord:
                    [(*tempstatu) StatuChange:(SuperUser | tempjudge)];     //超级用户界面+查看用户密保
                    return;
                    
                case S_returnMain:
                    [(*tempstatu) StatuChange:(MainInterface | M_home)];     //返回主界面（登录界面）
                    return;
                        
                default:
                    NSLog(@"无效指令，请重输%@",ERROR0x02);
                    break;
            }//判断数字
        }//结束键值不含字母或字符
    }//结束while(1)等待合法键值
}

//==========================
//     Ui超级用户界面功能升级中
//==========================
-(void)uiSuperUserUping:(Status**)tempstatu
{
    NSLog(@"升级ing...");
    [(*tempstatu) StatuChange:(SuperUser | S_home)];
}

//==========================
//      查看用户信息
//==========================
-(void)uiSuperUserSeekUserData:(Status**)tempstatu
{
    [self uiSuperUserUping:(Status**)tempstatu];
}

//==========================
//      修改用户信息
//==========================
-(void)uiSuperUserUpUserData:(Status**)tempstatu
{
    [self uiSuperUserUping:(Status**)tempstatu];
}

//==========================
//      删除用户信息
//==========================
-(void)uiSuperUserDeleUserData:(Status**)tempstatu
{
    [self uiSuperUserUping:(Status**)tempstatu];
}

//==========================
//      用户资金操作
//==========================
-(void)uiSuperUserOperaUserMoney:(Status**)tempstatu
{
    [self uiSuperUserUping:(Status**)tempstatu];
}

//==========================
//      商品操作
//==========================
-(void)uiSuperUserOperaWares:(Status**)tempstatu
{
    [self uiSuperUserUping:(Status**)tempstatu];
}

//==========================
//      订单操作
//==========================
-(void)uiSuperUserOperaOrder:(Status**)tempstatu
{
    [self uiSuperUserUping:(Status**)tempstatu];
}

//==========================
//      添加用户
//==========================
-(void)uiSuperUserAddUser:(Status**)tempstatu
{
    [self uiSuperUserUping:(Status**)tempstatu];
}

//==========================
//      密保库清0
//==========================
-(void)uiSuperUserCleProPassWord:(Status**)tempstatu
{
    [self uiSuperUserUping:(Status**)tempstatu];
}

//==========================
//      资金历史记录清除
//==========================
-(void)uiSuperUserClemoneyhistory:(Status**)tempstatu
{
    [self uiSuperUserUping:(Status**)tempstatu];
}

//==========================
//      查看用户密保
//==========================
-(void)uiSuperUserSeekProPassWord:(Status**)tempstatu
{
    [self uiSuperUserUping:(Status**)tempstatu];
}

@end
