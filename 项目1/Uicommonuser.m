//
//  Uicommonuser.m
//  项目1
//
//  Created by Leonlincq on 16/8/11.
//  Copyright © 2016年 Leonlincq. All rights reserved.
//

#import "Uicommonuser.h"

@implementation Uicommonuser


-(instancetype)initWithTimer
{
    self = [super init];
    if (self)
    {
        _myTick = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(oneSecTick:) userInfo:nil repeats:YES];
        [_myTick setFireDate:[NSDate distantFuture]];
        _countByTimer = ReturuCommonUserTime;
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
            printf("🕐%ld秒后进入主界面...\n",_countByTimer--);
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
        [_myTick setFireDate:[NSDate distantFuture]];
    }
}

//==========================
//      进入等待定时器
//==========================
-(void)enterWaitTimer
{
    _countByTimer = ReturuCommonUserTime;
    [_myTick setFireDate:[NSDate distantPast]];
    NSDate *date = [NSDate dateWithTimeIntervalSinceNow:ReturuCommonUserTime];
    [[NSRunLoop currentRunLoop] runUntilDate:date];
    printf("======================================\n");
}

//==========================
//      普通用户接口
//==========================
-(void)uiCommonUserInterface
{
    Status *MyStatuP = [Status statusShallOneData];
    
    switch (MyStatuP.StaNow)
    {
        case (CommonUser | C_home):             //普通用户首页
            [self uiCommonUserHome];
            break;
            
        case (CommonUser | C_userDeposit):      //用户存款
            [self uiCommonUserUserDeposit];
            break;
            
        case (CommonUser | C_userDrawMoney):    //用户取款
            [self uiCommonUserUserDrawMoney];
            break;
            
        case (CommonUser | C_lookMoneyGo):      //查看用户资金走向
            [self uiCommonUserLookMoneyGo];
            break;
            
        case (CommonUser | C_usertGiro):        //用户转账
            [self uiCommonUserUsertGiro];
            break;
            
        case (CommonUser | C_upPasswordData):   //修改密码
            [self uiCommonUserUpPasswordData];
            break;
            
        case (CommonUser | C_buyWares):         //购买商品
            [self uiCommonUserBuyWares];
            break;
            
        case (CommonUser | C_operaOrder ):      //订单操作
            [self uiCommonUserOperaOrder];
            break;
            
        case (CommonUser | C_shopCar):          //购物车
            [self uiCommonUserShopCar];
            break;
 
        //不应该出现的状态
        case (CommonUser | C_returnWelcome):   //返回欢迎界面
        default:
            [super uiError];
            break;
    }
}

//==========================
//      普通用户界面
//==========================
-(void)uiCommonUserHome
{
    Status *MyStatuP                = [Status statusShallOneData];      //更改主方法状态
    Manageuserdatas *olduserdata    = [[Manageuserdatas alloc]init];    //找到数据并保存
    LCQResultKeyRule temp_namestatu = LCQResultKeyRule_Nil;             //按键状态
    
    printf("         🌳      用户      🌳         \n");
    printf("======================================\n");
    printf("           🐴1.用户存款              \n");
    printf("           🐑2.用户取款              \n");
    printf("           🐧3.查看资金流向           \n");
    printf("           🐶4.用户转账              \n");
    printf("           🐘5.修改密码              \n");
    printf("           🐤6.购买商品              \n");
    printf("           🐔7.订单操作              \n");
    printf("           🐹8.购物车                \n");
    printf("✅         🐼9.返回登录界面           \n");
    printf("======================================\n");
    
    while (1)
    {
        printf("▶️请输入操作序号(1-9):");
        temp_namestatu = [super seekRule:LCQKeyRule_Numb AndJudgeSaveUser:&olduserdata];
        if (temp_namestatu == LCQResultKeyRule_OK)
        {
            int tempjudge = [olduserdata.member intValue];
            switch ( tempjudge )
            {
                case C_userDeposit:
                    [MyStatuP StatuChange:(CommonUser | tempjudge)];    //普通用户界面+用户存款
                    return;
                    
                case C_userDrawMoney:
                    [MyStatuP StatuChange:(CommonUser | tempjudge)];    //普通用户界面+用户取款
                    return;
                    
                case C_lookMoneyGo:
                    [MyStatuP StatuChange:(CommonUser | tempjudge)];    //普通用户界面+查看用户资金走向
                    return;
                    
                case C_usertGiro:
                    [MyStatuP StatuChange:(CommonUser | tempjudge)];    //普通用户界面+用户转账
                    return;
                    
                case C_upPasswordData:
                    [MyStatuP StatuChange:(CommonUser | tempjudge)];    //普通用户界面+修改密码
                    return;
                    
                case C_buyWares:
                    [MyStatuP StatuChange:(CommonUser | tempjudge)];    //普通用户界面+购买商品
                    return;
                    
                case C_operaOrder:
                    [MyStatuP StatuChange:(CommonUser | tempjudge)];    //普通用户界面+订单操作
                    return;
                    
                case C_shopCar:
                    [MyStatuP StatuChange:(CommonUser | tempjudge)];    //普通用户界面+购物车
                    return;
                    
                case C_returnWelcome:
                    [MyStatuP StatuChange:(MainInterface | M_home)];    //返回主界面（登录界面）
                    [self enterWaitTimer];
                    return;

                default:
                    printf("%s",ERROR0x01_ILLEGAL_NUM);
                    break;
            }//判断数字
        }
    }//结束while
}

//==========================
//     Ui普通用户界面功能升级中
//==========================
-(void)uiCommonUserUping
{
    Status *MyStatuP = [Status statusShallOneData];
    printf("升级ing...\n");
    [MyStatuP StatuChange:(CommonUser | C_home)];
    [self enterWaitTimer];
}

//==========================
//     用户存款
//==========================
-(void)uiCommonUserUserDeposit
{
    Status *MyStatuP = [Status statusShallOneData];
    
    [self uiCommonUserUping];
}

//==========================
//     用户取款
//==========================
-(void)uiCommonUserUserDrawMoney
{
    Status *MyStatuP = [Status statusShallOneData];
    
    [self uiCommonUserUping];
}

//==========================
//     查看用户资金走向
//==========================
-(void)uiCommonUserLookMoneyGo
{
    Status *MyStatuP = [Status statusShallOneData];
    
    [self uiCommonUserUping];
}

//==========================
//     用户转账
//==========================
-(void)uiCommonUserUsertGiro
{
    Status *MyStatuP = [Status statusShallOneData];
    
    [self uiCommonUserUping];;
}

//==========================
//     修改密码
//==========================
-(void)uiCommonUserUpPasswordData
{
    Status *MyStatuP = [Status statusShallOneData];
    
    [self uiCommonUserUping];
}

//==========================
//     购买商品
//==========================
-(void)uiCommonUserBuyWares
{
    Status *MyStatuP = [Status statusShallOneData];
    
    [self uiCommonUserUping];
}

//==========================
//     订单操作
//==========================
-(void)uiCommonUserOperaOrder
{
    Status *MyStatuP = [Status statusShallOneData];
    
    [self uiCommonUserUping];
}

//==========================
//     购物车
//==========================
-(void)uiCommonUserShopCar
{
    Status *MyStatuP = [Status statusShallOneData];
    
    [self uiCommonUserUping];
}

@end
