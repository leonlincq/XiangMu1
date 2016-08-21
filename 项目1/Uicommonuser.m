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
            
        case (CommonUser | C_upData):           //修改密码
            [self uiCommonUserUpData];
            break;
            
        case (CommonUser | C_buyWares):         //购买商品
            [self uiCommonUserOperaWares];
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
    printf("✅         🐴1.用户存款              \n");
    printf("✅         🐑2.用户取款              \n");
    printf("✅         🐧3.查看资金流向           \n");
    printf("✅         🐶4.用户转账              \n");
    printf("✅         🐘5.修改信息              \n");
    printf("           🐤6.商品操作              \n");
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
                case C_userDeposit:         //普通用户界面+用户存款
                case C_userDrawMoney:       //普通用户界面+用户取款
                case C_lookMoneyGo:         //普通用户界面+查看用户资金走向
                case C_usertGiro:           //普通用户界面+用户转账
                case C_upData:              //普通用户界面+修改密码
                case C_buyWares:            //普通用户界面+购买商品
                case C_operaOrder:          //普通用户界面+订单操作
                case C_shopCar:             //普通用户界面+购物车
                    [MyStatuP StatuChange:(CommonUser | tempjudge)];
                    return;
                    
                case C_returnWelcome:       //返回主界面（登录界面）
                    [MyStatuP StatuChange:(MainInterface | M_home)];
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
    Status *MyStatuP                = [Status statusShallOneData];      //更改主方法状态
    Manageuserdatas *newuser        = [[Manageuserdatas alloc]init];    //要保存的实例
    Operateuserdatas *newop         = [[Operateuserdatas alloc]init];   //文件操作
    Manageuserdatas *olduserdata    = [[Manageuserdatas alloc]init];    //找到数据并保存
    LCQResultKeyRule temp_namestatu = LCQResultKeyRule_Nil;             //按键状态
    

    Operatemoney *newopmoneyp       = [[Operatemoney alloc]init];       //资金文件操作
    Managemoney *opmoney            = [[Managemoney alloc]init];        //资金操作
    
    uicommon_Deposit tempstatu      = uicommon_Deposit_money;           //该方法的状态

    newuser = [newop readCommonUserData];
    
    opmoney.opname          = newuser.name;     //自己的名字，Ok
    opmoney.allmoney        = newuser.money;    //自己目前的金额，Ok
    opmoney.opaction        = Deposit;          //存
    opmoney.opmoney         = 0;                //操作0
    opmoney.opmoneytopeople = MySelf;           //给自己，OK
    
    NSLog(@"%@",opmoney);
    
    NSMutableArray *temp_alluser = [[NSMutableArray alloc]init];
    
    
    printf("=========================================\n");
    
    while(1)
    {
        switch (tempstatu)
        {
            case uicommon_Deposit_money:
                printf("▶️请输入要充值的金额(🔙可输入'...'取消存款🔙)：\n");
                temp_namestatu = [super seekRule:LCQKeyRule_Money AndJudgeSaveUser:&olduserdata];
                if (temp_namestatu == LCQResultKeyRule_OK)
                {
                    newuser.money = olduserdata.money;
                    tempstatu = uicommon_Deposit_payword;
                }
                break;
            
            case uicommon_Deposit_payword:
                printf("▶️请输入您的支付密码以确定存款(🔙可输入'...'取消存款🔙)：\n");
                temp_namestatu = [super seekRule:LCQKeyRule_PayWord AndJudgeSaveUser:&olduserdata];
                if (temp_namestatu == LCQResultKeyRule_OK)
                {
                    if ([newuser.payword isEqualToString:olduserdata.payword])
                    {
                        tempstatu = uicommon_Deposit_ok;
                    }
                    else
                    {
                        printf("%s",ERROR0x09_ILLEGAL_PASSWORD);
                    }
                }
                break;
            case uicommon_Deposit_ok:
                opmoney.allmoney += newuser.money;          //总金额+充值金额
                opmoney.opmoney = newuser.money;            //充值金额
                [newopmoneyp addOpMoney:opmoney];           //更新资金操作表
                
                newuser.money = opmoney.allmoney;
                [newop upUserData:newuser withWho:LCQChooseUpdata_money];   //更新用户信息
        
                [newop saveCommonUserData:newuser];         //更新plist
                
                printf("✅充值操作成功\n");
                
                [newopmoneyp selectOpMoneyName:newuser.name andSaveArray:&temp_alluser];
                opmoney = [temp_alluser[temp_alluser.count - 1] copy];
                [opmoney printfAllData];
        
                [super uiReturnUpUi:(CommonUser | C_home)];
                return;
                
            default:
                break;
        }
        //这里的状态是底层UI.m检测到'...'，想切回主界面，但困在while出不去
        if (MyStatuP.StaNow == (CommonUser | C_home))
        {
            [self enterWaitTimer];
            break;
        }
    }
}

//==========================
//     用户取款
//==========================
-(void)uiCommonUserUserDrawMoney
{
    Status *MyStatuP                = [Status statusShallOneData];      //更改主方法状态
    Manageuserdatas *newuser        = [[Manageuserdatas alloc]init];    //要保存的实例
    Operateuserdatas *newop         = [[Operateuserdatas alloc]init];   //文件操作
    Manageuserdatas *olduserdata    = [[Manageuserdatas alloc]init];    //找到数据并保存
    LCQResultKeyRule temp_namestatu = LCQResultKeyRule_Nil;             //按键状态
    
    
    Operatemoney *newopmoneyp       = [[Operatemoney alloc]init];       //资金文件操作
    Managemoney *opmoney            = [[Managemoney alloc]init];        //资金操作
    
    uicommon_DrawMoney tempstatu    = uicommon_DrawMoney_money;           //该方法的状态
    
    newuser = [newop readCommonUserData];
    
    opmoney.opname          = newuser.name;     //自己的名字，Ok
    opmoney.allmoney        = newuser.money;    //自己目前的金额，Ok
    opmoney.opaction        = DrawMoney;        //取
    opmoney.opmoney         = 0;                //操作0
    opmoney.opmoneytopeople = MySelf;           //给自己，OK
    
    NSMutableArray *temp_alluser = [[NSMutableArray alloc]init];
    
    
    printf("=========================================\n");
    
    while(1)
    {
        switch (tempstatu)
        {
            case uicommon_DrawMoney_money:
                printf("▶️请输入要取款的金额(🔙可输入'...'取消取款🔙)：\n");
                temp_namestatu = [super seekRule:LCQKeyRule_Money AndJudgeSaveUser:&olduserdata];
                if (temp_namestatu == LCQResultKeyRule_OK)
                {
                    if (olduserdata.money > newuser.money)
                    {
                        printf("%s",ERROR0x0A_ILLEGAL_MONEYRANGE);
                    }
                    else
                    {
                        newuser.money = olduserdata.money;
                        tempstatu = uicommon_DrawMoney_payword;
                    }
                }
                break;
                
            case uicommon_DrawMoney_payword:
                printf("▶️请输入您的支付密码以确定取款(🔙可输入'...'取消取款🔙)：\n");
                temp_namestatu = [super seekRule:LCQKeyRule_PayWord AndJudgeSaveUser:&olduserdata];
                if (temp_namestatu == LCQResultKeyRule_OK)
                {
                    if ([newuser.payword isEqualToString:olduserdata.payword])
                    {
                        tempstatu = uicommon_DrawMoney_ok;
                    }
                    else
                    {
                        printf("%s",ERROR0x09_ILLEGAL_PASSWORD);
                    }
                }
                break;
            case uicommon_DrawMoney_ok:
                opmoney.allmoney -= newuser.money;          //总金额-取款金额
                opmoney.opmoney = newuser.money;            //充值金额
                [newopmoneyp addOpMoney:opmoney];           //更新资金操作表
                
                newuser.money = opmoney.allmoney;
                [newop upUserData:newuser withWho:LCQChooseUpdata_money];   //更新用户信息
                
                [newop saveCommonUserData:newuser];         //更新plist
                
                printf("✅取款操作成功，已发到您的银行卡上\n");
                
                [newopmoneyp selectOpMoneyName:newuser.name andSaveArray:&temp_alluser];
                opmoney = [temp_alluser[temp_alluser.count - 1] copy];
                [opmoney printfAllData];
                
                [super uiReturnUpUi:(CommonUser | C_home)];
                return;
                
            default:
                break;
        }
        //这里的状态是底层UI.m检测到'...'，想切回主界面，但困在while出不去
        if (MyStatuP.StaNow == (CommonUser | C_home))
        {
            [self enterWaitTimer];
            break;
        }
    }
}

//==========================
//     查看用户资金走向
//==========================
-(void)uiCommonUserLookMoneyGo
{
    Status *MyStatuP                = [Status statusShallOneData];      //更改主方法状态
    Manageuserdatas *newuser        = [[Manageuserdatas alloc]init];    //要保存的实例
    Operateuserdatas *newop         = [[Operateuserdatas alloc]init];   //文件操作
    Manageuserdatas *olduserdata    = [[Manageuserdatas alloc]init];    //找到数据并保存
    LCQResultKeyRule temp_namestatu = LCQResultKeyRule_Nil;             //按键状态
    
    
    Operatemoney *newopmoneyp       = [[Operatemoney alloc]init];       //资金文件操作
    Managemoney *opmoney            = [[Managemoney alloc]init];        //资金操作
    
    uicommon_LookMoneyGo tempstatu    = uicommon_LookMoneyGo_choose;           //该方法的状态
    
    newuser = [newop readCommonUserData];
    
    NSString *tempop = [[NSString alloc]init];
    
    
    NSMutableArray *temp_alluser = [[NSMutableArray alloc]init];
    
    
    printf("=========================================\n");
    
    while(1)
    {
        switch (tempstatu)
        {
            case uicommon_LookMoneyGo_choose:
                printf("         1️⃣.查看所有资金记录\n");
                printf("         2️⃣.查看存款记录\n");
                printf("         3️⃣.查看取款记录\n");
                printf("         4️⃣.查看转账记录\n");
                printf("         5️⃣.查看购买记录\n");
                printf("▶️请输入操作序号(1~5)(🔙可输入'...'取消查看🔙):");
                temp_namestatu = [super seekRule:LCQKeyRule_Numb AndJudgeSaveUser:&olduserdata];
                if (temp_namestatu == LCQResultKeyRule_OK)
                {
                    int tempjudge = [olduserdata.member intValue];
                    switch ( tempjudge )
                    {
                        case uicommon_LookMoneyGo_all:
                        case uicommon_LookMoneyGo_deposit:
                        case uicommon_LookMoneyGo_drawmoney:
                        case uicommon_LookMoneyGo_transfers:
                        case uicommon_LookMoneyGo_buy:
                            tempstatu = tempjudge;
                            break;
                            
                        default:
                            printf("%s",ERROR0x01_ILLEGAL_NUM);
                            break;
                    }//判断数字
                }
                break;
                
            case uicommon_LookMoneyGo_all:
                tempop = nil;
                tempstatu = uicommon_LookMoneyGo_ok;
                break;
                
            case uicommon_LookMoneyGo_deposit:
                tempop = Deposit;
                tempstatu = uicommon_LookMoneyGo_ok;
                break;
                
            case uicommon_LookMoneyGo_drawmoney:
                tempop = DrawMoney;
                tempstatu = uicommon_LookMoneyGo_ok;
                break;
                
            case uicommon_LookMoneyGo_transfers:
                tempop = Transfers;
                tempstatu = uicommon_LookMoneyGo_ok;
                break;
                
            case uicommon_LookMoneyGo_buy:
                tempop = Buy;
                tempstatu = uicommon_LookMoneyGo_ok;
                break;
                
            case uicommon_LookMoneyGo_ok:
                [newopmoneyp selectOpMoneyName:newuser.name andop:tempop SaveArray:&temp_alluser];
                if(temp_alluser.count != 0)         //查到数据
                {
                    if ([tempop isEqualToString:Transfers])
                    {
                        printf("▶️以下是转账给别人：\n");
                    }
                    
                    for (NSInteger i = 0; i<temp_alluser.count ; i++)
                    {
                        printf("(%ld)->",i+1);
                        opmoney = [temp_alluser[i] copy];
                        [opmoney printfAllData];
                        printf("---------\n");
                    }
                    if ([tempop isEqualToString:Transfers])
                    {
                        [newopmoneyp selectOpmoneytopeople:newuser.name andSaveArray:&temp_alluser];
                        if(temp_alluser.count != 0)
                        {
                            printf("▶️以下是别人转给自己的：\n");
                            for (NSInteger i = 0; i<temp_alluser.count ; i++)
                            {
                                printf("(%ld)->",i+1);
                                opmoney = [temp_alluser[i] copy];
                                [opmoney printfAllData];
                                printf("---------\n");
                            }
                        }
                    }
                }
                else    //查不到数据，但还有接收别人转账的可能
                {
                    if ([tempop isEqualToString:Transfers])
                    {
                        [newopmoneyp selectOpmoneytopeople:newuser.name andSaveArray:&temp_alluser];
                        if(temp_alluser.count != 0)
                        {
                            printf("▶️以下是别人转给自己的：\n");
                            for (NSInteger i = 0; i<temp_alluser.count ; i++)
                            {
                                printf("(%ld)->",i+1);
                                opmoney = [temp_alluser[i] copy];
                                [opmoney printfAllData];
                                printf("---------\n");
                            }
                            tempstatu = uicommon_LookMoneyGo_ok;
                            [super uiReturnUpUi:(CommonUser | C_home)];
                            return;
                        }
                    }
                    printf("❗️暂无此方面记录❗️\n");
                }

                tempstatu = uicommon_LookMoneyGo_ok;
                [super uiReturnUpUi:(CommonUser | C_home)];
                return;
                
            default:
                break;
        }
        //这里的状态是底层UI.m检测到'...'，想切回主界面，但困在while出不去
        if (MyStatuP.StaNow == (CommonUser | C_home))
        {
            [self enterWaitTimer];
            break;
        }
    }
}

//==========================
//     用户转账
//==========================
-(void)uiCommonUserUsertGiro
{
    Status *MyStatuP                = [Status statusShallOneData];      //更改主方法状态
    Manageuserdatas *newuser        = [[Manageuserdatas alloc]init];    //要保存的实例
    Operateuserdatas *newop         = [[Operateuserdatas alloc]init];   //文件操作
    Manageuserdatas *olduserdata    = [[Manageuserdatas alloc]init];    //找到数据并保存
    LCQResultKeyRule temp_namestatu = LCQResultKeyRule_Nil;             //按键状态
    
    
    Operatemoney *newopmoneyp       = [[Operatemoney alloc]init];       //资金文件操作
    Managemoney *opmoney            = [[Managemoney alloc]init];        //资金操作
    
    Manageuserdatas *transfersuser  = [[Manageuserdatas alloc]init];    //转账接受方
    
    uicommon_UsertGiro tempstatu    = uicommon_UsertGiro_money;           //该方法的状态
    
    newuser = [newop readCommonUserData];
    
    opmoney.opname          = newuser.name;     //自己的名字，Ok
    opmoney.allmoney        = newuser.money;    //自己目前的金额，Ok
    opmoney.opaction        = Transfers;        //转款
    opmoney.opmoney         = 0;                //操作0

    
    NSMutableArray *temp_alluser = [[NSMutableArray alloc]init];
    

    printf("=========================================\n");
    
    while(1)
    {
        switch (tempstatu)
        {
            case uicommon_UsertGiro_money:
                printf("▶️请输入要转账的金额(🔙可输入'...'取消取款🔙)：\n");
                temp_namestatu = [super seekRule:LCQKeyRule_Money AndJudgeSaveUser:&olduserdata];
                if (temp_namestatu == LCQResultKeyRule_OK)
                {
                    if (olduserdata.money > newuser.money)
                    {
                        printf("%s",ERROR0x0A_ILLEGAL_MONEYRANGE);
                    }
                    else
                    {
                        newuser.money = olduserdata.money;      //暂时把要转账的金额先保存在newuser.money
                        tempstatu = uicommon_UsertGiro_who;
                    }
                }
                break;
                
            case uicommon_UsertGiro_who:
                printf("▶️请输入要的用户名(🔙可输入'...'取消取款🔙)：\n");
                temp_namestatu = [super seekRule:LCQKeyRule_Name AndJudgeSaveUser:&olduserdata];
                if (temp_namestatu == LCQResultKeyRule_Found)
                {
                    if([olduserdata.name isEqualToString:newuser.name])
                    {
                        printf("%s",ERROR0x0C_ILLEGAL_OPNAME);
                    }
                    else
                    {
                        transfersuser = [olduserdata copy];     //转账操作给谁
                        opmoney.opmoneytopeople = transfersuser.name;
                        tempstatu = uicommon_UsertGiro_payword;
                        printf("=========================================\n");
                    }
                }
                else if(temp_namestatu == LCQResultKeyRule_NoFound)
                {
                    printf("%s",ERROR0x05_NO_FOUND_USER);
                }
                break;
                
            case uicommon_UsertGiro_payword:
                printf("▶️请输入您的支付密码以确定取款(🔙可输入'...'取消取款🔙)：\n");
                temp_namestatu = [super seekRule:LCQKeyRule_PayWord AndJudgeSaveUser:&olduserdata];
                if (temp_namestatu == LCQResultKeyRule_OK)
                {
                    if ([newuser.payword isEqualToString:olduserdata.payword])
                    {
                        tempstatu = uicommon_UsertGiro_ok;
                    }
                    else
                    {
                        printf("%s",ERROR0x09_ILLEGAL_PASSWORD);
                    }
                }
                break;
            case uicommon_UsertGiro_ok:
                opmoney.allmoney -= newuser.money;          //总金额-转账金额
                opmoney.opmoney = newuser.money;            //转账金额
                [newopmoneyp addOpMoney:opmoney];           //更新资金操作表
                
                
                //更新接受方的金额
                transfersuser.money += newuser.money;
                [newop upUserData:transfersuser withWho:LCQChooseUpdata_money];
                
                //更新转账用户信息
                newuser.money = opmoney.allmoney;
                [newop upUserData:newuser withWho:LCQChooseUpdata_money];
                
                [newop saveCommonUserData:newuser];         //更新plist
                
                printf("✅转账操作成功\n");
                
                
                [newopmoneyp selectOpMoneyName:newuser.name andSaveArray:&temp_alluser];
                opmoney = [temp_alluser[temp_alluser.count - 1] copy];
                [opmoney printfAllData];
                
                [super uiReturnUpUi:(CommonUser | C_home)];
                return;
                
            default:
                break;
        }
        //这里的状态是底层UI.m检测到'...'，想切回主界面，但困在while出不去
        if (MyStatuP.StaNow == (CommonUser | C_home))
        {
            [self enterWaitTimer];
            break;
        }
    }
}

//==========================
//     修改用户信息
//==========================
-(void)uiCommonUserUpData
{
    Status *MyStatuP                = [Status statusShallOneData];      //更改主方法状态
    Manageuserdatas *newuser        = [[Manageuserdatas alloc]init];    //要保存的实例
    Operateuserdatas *newop         = [[Operateuserdatas alloc]init];   //文件操作
    Manageuserdatas *olduserdata    = [[Manageuserdatas alloc]init];    //找到数据并保存
    LCQResultKeyRule temp_namestatu = LCQResultKeyRule_Nil;             //按键状态
    
    uicommon_Updata tempstatu       = uicommon_Updata_choose;           //该方法的状态
    
    newuser = [newop readCommonUserData];
    
    printf("=========================================\n");
    
    while(1)
    {
        switch (tempstatu)
        {
            case uicommon_Updata_choose:
                printf("         1️⃣.修改密码\n");
                printf("         2️⃣.修改真名\n");
                printf("         3️⃣.修改Email\n");
                printf("         4️⃣.修改电话号码\n");
                printf("         5️⃣.修改密保答案1\n");
                printf("         6️⃣.修改密保答案2\n");
                printf("         7️⃣.修改密保答案3\n");
                printf("         8️⃣.修改支付密码\n");
                printf("         9️⃣.修改收货地址\n");
                printf("▶️请输入要修改的信息操作序号(1~9):(🔙可输入'...'取消修改🔙)：\n");
                temp_namestatu = [super seekRule:LCQKeyRule_Numb AndJudgeSaveUser:&olduserdata];
                if (temp_namestatu == LCQResultKeyRule_OK)
                {
                    int tempjudge = [olduserdata.member intValue];
                    switch ( tempjudge )
                    {
                        case uicommon_Updata_password:
                        case uicommon_Updata_realname:
                        case uicommon_Updata_email:
                        case uicommon_Updata_phonenum:
                        case uicommon_Updata_answer1:
                        case uicommon_Updata_answer2:
                        case uicommon_Updata_answer3:
                        case uicommon_Updata_payword:
                        case uicommon_Updata_address:
                            tempstatu = tempjudge;
                            break;
                            
                        default:
                            printf("%s",ERROR0x01_ILLEGAL_NUM);
                            break;
                    }
                }
                break;
                
            case uicommon_Updata_password:
                printf("▶️请输入新的密码(🔙可输入'...'取消修改🔙)：\n");
                temp_namestatu = [super seekRule:LCQKeyRule_PassWord AndJudgeSaveUser:&olduserdata];
                if (temp_namestatu == LCQResultKeyRule_OK)
                {
                    newuser.password = olduserdata.password;
                    if ([newop upUserData:newuser withWho:LCQChooseUpdata_password] == FILEYES)
                    {
                        printf("=========================================\n");
                        printf("✅修改成功，新的");
                        [newuser printfPassword];
                        printf("\n");
                        printf("=========================================\n");
                        tempstatu = uicommon_Updata_choose;
                    }
                }
                break;
                
            case uicommon_Updata_realname:
                printf("▶️请输入新的真名(🔙可输入'...'取消修改🔙)：\n");
                temp_namestatu = [super seekRule:LCQKeyRule_RealName AndJudgeSaveUser:&olduserdata];
                if (temp_namestatu == LCQResultKeyRule_OK)
                {
                    newuser.realname = olduserdata.realname;
                    if ([newop upUserData:newuser withWho:LCQChooseUpdata_realname] == FILEYES)
                    {
                        printf("=========================================\n");
                        printf("✅修改成功，新的");
                        [newuser printfRealName];
                        printf("\n");
                        printf("=========================================\n");
                        tempstatu = uicommon_Updata_choose;
                    }
                }
                break;
                
            case uicommon_Updata_email:
                printf("▶️请输入新的Email(🔙可输入'...'取消修改🔙)：\n");
                temp_namestatu = [super seekRule:LCQKeyRule_Email AndJudgeSaveUser:&olduserdata];
                if (temp_namestatu == LCQResultKeyRule_OK)
                {
                    newuser.email = olduserdata.email;
                    if ([newop upUserData:newuser withWho:LCQChooseUpdata_email] == FILEYES)
                    {
                        printf("=========================================\n");
                        printf("✅修改成功，新的");
                        [newuser printfEmail];
                        printf("\n");
                        printf("=========================================\n");
                        tempstatu = uicommon_Updata_choose;
                    }
                }
                break;
                
            case uicommon_Updata_phonenum:
                printf("▶️请输入新的电话号码(🔙可输入'...'取消修改🔙)：\n");
                temp_namestatu = [super seekRule:LCQKeyRule_Phonenum AndJudgeSaveUser:&olduserdata];
                if (temp_namestatu == LCQResultKeyRule_OK)
                {
                    newuser.phonenum = olduserdata.phonenum;
                    if ([newop upUserData:newuser withWho:LCQChooseUpdata_phonenum] == FILEYES)
                    {
                        printf("=========================================\n");
                        printf("✅修改成功，新的");
                        [newuser printfPhonenum];
                        printf("\n");
                        printf("=========================================\n");
                        tempstatu = uicommon_Updata_choose;
                    }
                }
                break;
                
            case uicommon_Updata_answer1:
                printf("▶️第一个密保问题：%s\n",QUESTION_FRIST);
                printf("▶️请输入新的第一个密保答案(🔙可输入'...'取消修改🔙)：\n");
                temp_namestatu = [super seekRule:LCQKeyRule_Answer1 AndJudgeSaveUser:&olduserdata];
                if (temp_namestatu == LCQResultKeyRule_OK)
                {
                    newuser.answer1 = olduserdata.answer1;
                    if ([newop upUserData:newuser withWho:LCQChooseUpdata_answer1] == FILEYES)
                    {
                        printf("=========================================\n");
                        printf("✅修改成功，新的");
                        [newuser printfAnswer1];
                        printf("\n");
                        printf("=========================================\n");
                        tempstatu = uicommon_Updata_choose;
                    }
                }
                break;
                
            case uicommon_Updata_answer2:
                printf("▶️第二个密保问题：%s\n",QUESTION_SECON);
                printf("▶️请输入新的第二个密保答案(🔙可输入'...'取消修改🔙)：\n");
                temp_namestatu = [super seekRule:LCQKeyRule_Answer2 AndJudgeSaveUser:&olduserdata];
                if (temp_namestatu == LCQResultKeyRule_OK)
                {
                    newuser.answer2 = olduserdata.answer2;
                    if ([newop upUserData:newuser withWho:LCQChooseUpdata_answer2] == FILEYES)
                    {
                        printf("=========================================\n");
                        printf("✅修改成功，新的");
                        [newuser printfAnswer2];
                        printf("\n");
                        printf("=========================================\n");
                        tempstatu = uicommon_Updata_choose;
                    }
                }
                break;
                
            case uicommon_Updata_answer3:
                printf("▶️第三个密保问题：%s\n",QUESTION_THREE);
                printf("▶️请输入新的第三个密保答案(🔙可输入'...'取消修改🔙)：\n");
                temp_namestatu = [super seekRule:LCQKeyRule_Answer3 AndJudgeSaveUser:&olduserdata];
                if (temp_namestatu == LCQResultKeyRule_OK)
                {
                    newuser.answer3 = olduserdata.answer3;
                    if ([newop upUserData:newuser withWho:LCQChooseUpdata_answer3] == FILEYES)
                    {
                        printf("=========================================\n");
                        printf("✅修改成功，新的");
                        [newuser printfAnswer3];
                        printf("\n");
                        printf("=========================================\n");
                        tempstatu = uicommon_Updata_choose;
                    }
                }
                break;
                
                
            case uicommon_Updata_payword:
                printf("▶️请输入新的支付密码(6位纯数字)(🔙可输入'...'取消修改🔙)：\n");
                temp_namestatu = [super seekRule:LCQKeyRule_PayWord AndJudgeSaveUser:&olduserdata];
                if (temp_namestatu == LCQResultKeyRule_OK)
                {
                    newuser.payword = olduserdata.payword;
                    if ([newop upUserData:newuser withWho:LCQChooseUpdata_payword] == FILEYES)
                    {
                        printf("=========================================\n");
                        printf("✅修改成功，新的");
                        [newuser printfPayword];
                        printf("\n");
                        printf("=========================================\n");
                        tempstatu = uicommon_Updata_choose;
                    }
                }
                break;
                
            case uicommon_Updata_address:
                printf("▶️请输入新的收货地址（只能字母、数字）(🔙可输入'...'取消修改🔙)：\n");
                temp_namestatu = [super seekRule:LCQKeyRule_Address AndJudgeSaveUser:&olduserdata];
                if (temp_namestatu == LCQResultKeyRule_OK)
                {
                    newuser.address = olduserdata.address;
                    if ([newop upUserData:newuser withWho:LCQChooseUpdata_address] == FILEYES)
                    {
                        printf("=========================================\n");
                        printf("✅修改成功，新的");
                        [newuser printfAddress];
                        printf("\n");
                        printf("=========================================\n");
                        tempstatu = uicommon_Updata_choose;
                    }
                }
                break;
                
            default:
                break;
        }
        //这里的状态是底层UI.m检测到'...'，想切回主界面，但困在while出不去
        if (MyStatuP.StaNow == (CommonUser | C_home))
        {
            [newop saveCommonUserData:newuser];         //更新plist
            printf("=========================================\n");
            printf("✅当前您的信息如下：");
            [newuser printfAllData];
            printf("\n");
            [super uiReturnUpUi:(CommonUser | C_home)];
            break;
        }
    }
}

//==========================
//     商品操作
//==========================
-(void)uiCommonUserOperaWares
{
    Status *MyStatuP                = [Status statusShallOneData];      //更改主方法状态
    LCQResultKeyRule temp_namestatu = LCQResultKeyRule_Nil;             //按键状态
    
    Manageuserdatas *olduserdata    = [[Manageuserdatas alloc]init];    //找到数据并保存
    Manageuserdatas *newuser        = [[Manageuserdatas alloc]init];    //要保存的实例
    Operateuserdatas *newop         = [[Operateuserdatas alloc]init];   //文件操作

    Managewares *newware            = [[Managewares alloc]init];        //商品操作
    Operatewares *opware            = [[Operatewares alloc]init];       //商品表操作
    
    Manageshopcar *newshopcar       = [[Manageshopcar alloc]init];      //购物车操作
    Operateshopcar *opshopcar       = [[Operateshopcar alloc]init];     //购物车表操作
    
    
    uicommon_OperaWares tempstatu    = uicommon_OperaWares_choose;           //该方法的状态
    
    newuser = [newop readCommonUserData];

    newshopcar.shopcarbypeople  = newuser.name;   //购物车要用
    
    NSString *searchchoose = [[NSString alloc]init];
    
    NSMutableArray *temp_alluser = [[NSMutableArray alloc]init];
    
    printf("=========================================\n");
    
    while(1)
    {
        switch (tempstatu)
        {
            case uicommon_OperaWares_choose:
                printf("         1️⃣.上架商品\n");
                printf("         2️⃣.下架商品\n");
                printf("         3️⃣.搜索商品\n");
                printf("▶️请输入操作序号(1~3)(🔙可输入'...'取消商品操作🔙)：");
                temp_namestatu = [super seekRule:LCQKeyRule_Numb AndJudgeSaveUser:&olduserdata];
                if (temp_namestatu == LCQResultKeyRule_OK)
                {
                    int tempjudge = [olduserdata.member intValue];
                    switch ( tempjudge )
                    {
                        case uicommon_OperaWares_upware:        //上架商品
                        case uicommon_OperaWares_downware:      //下架商品
                        case uicommon_OperaWares_searchware:    //搜索商品
                            tempstatu = tempjudge;
                            break;
                            
                        default:
                            printf("%s",ERROR0x01_ILLEGAL_NUM);
                            break;
                    }//判断数字
                }
                break;
                
//=======================上架=======================
                
            case uicommon_OperaWares_upware:
                printf("         1️⃣.上架新商品\n");
                printf("         2️⃣.上架已下架商品\n");
                printf("▶️请输入操作序号(1~2)(🔙可输入'...'取消商品操作🔙)：");
                temp_namestatu = [super seekRule:LCQKeyRule_Numb AndJudgeSaveUser:&olduserdata];
                if (temp_namestatu == LCQResultKeyRule_OK)
                {
                    int tempjudge = [olduserdata.member intValue];
                    switch ( tempjudge )
                    {
                        case 1:        //上架新商品
                            newware.warebypeople = newuser.name;    //写上卖家
                            newware.wareflag = UpWare;              //写上上架
                            tempstatu = uicommon_OperaWares_upwarename;
                            printf("=========================================\n");
                            break;
                            
                        case 2:         //上架已下架商品
                            tempstatu = uicommon_OperaWares_updownedware;
                            printf("=========================================\n");
                            break;
                            
                        default:
                            printf("%s",ERROR0x01_ILLEGAL_NUM);
                            break;
                    }//判断数字
                }
                break;
                
             case uicommon_OperaWares_updownedware:
                [opware selectWareByWho:newuser.name andFlag:DownWare andWare:nil andClass:nil andSaveArray:&temp_alluser];        //遍历数据库
                if (temp_alluser.count !=0 )             //有下架的商品
                {
                    for (NSInteger i = 0; i<temp_alluser.count ; i++)
                    {
                        printf("(%ld)->",i+1);
                        newware = [temp_alluser[i] copy];
                        [newware printfAllData];
                        printf("---------\n");
                    }
                    printf("▶️请输入要上架的商品序号(🔙可输入'...'取消上架🔙)：");
                    temp_namestatu = [super seekRule:LCQKeyRule_Numb AndJudgeSaveUser:&olduserdata];
                    if (temp_namestatu == LCQResultKeyRule_OK)
                    {
                        NSInteger tempjudge = [olduserdata.member intValue];
                        if(tempjudge <= temp_alluser.count && tempjudge>0 )
                        {
                            newware = [temp_alluser[tempjudge-1] copy];
                            if(newware.waresum !=0)
                            {
                                newware.wareflag = UpWare;
                                [opware upWareData:newware withStatu:LCQChooseUpWaredata_wareflag];
                                tempstatu = uicommon_OperaWares_opwareok;
                                printf("=========================================\n");
                            }
                            else
                            {
                                tempstatu = uicommon_OperaWares_updownedwarenumb;
                            }
                        }
                        else
                        {
                            printf("%s",ERROR0x01_ILLEGAL_NUM);            //超过序号
                        }
                    }
                }
                else
                {
                    printf("❗️暂无下架商品❗️\n");
                    tempstatu = uicommon_OperaWares_opwareok;
                    printf("=========================================\n");
                }
                break;
       
            case uicommon_OperaWares_updownedwarenumb:
                printf("▶️该商品数量为0，若要重新上架，需要输入数量(🔙可输入'...'取消上架🔙)：");
                temp_namestatu = [super seekRule:LCQKeyRule_Numb AndJudgeSaveUser:&olduserdata];
                if (temp_namestatu == LCQResultKeyRule_OK)
                {
                    NSInteger tempjudge = [olduserdata.member intValue];
                    if(tempjudge == 0)
                    {
                        printf("%s",ERROR0x0F_ILLEGAL_WARENUMB);            //超过序号
                        printf("=========================================\n");
                    }
                    else
                    {
                        newware.wareflag = UpWare;
                        [opware upWareData:newware withStatu:LCQChooseUpWaredata_wareflag];
                        
                        newware.waresum = tempjudge;
                        [opware upWareData:newware withStatu:LCQChooseUpWaredata_waresum];
                        tempstatu = uicommon_OperaWares_opwareok;
                        printf("=========================================\n");
                    }
                }
                break;
                
                
            case uicommon_OperaWares_upwarename:
                printf("▶️请输入要上架的商品名(只能是字母、数字)(🔙可输入'...'取消上架🔙)：");
                temp_namestatu = [super seekRule:LCQKeyRule_UpWareName AndJudgeSaveUser:&olduserdata];
                if (temp_namestatu == LCQResultKeyRule_NoFound)
                {
                    newware.warename = olduserdata.member;
                    tempstatu = uicommon_OperaWares_upwareclass;
                    printf("=========================================\n");
                }
                else if (temp_namestatu == LCQResultKeyRule_Found)
                {
                    printf("%s",ERROR0x0D_REPE_WARENAME);
                }
                break;
                
            case uicommon_OperaWares_upwareclass:
                printf("         1️⃣.数码\n");
                printf("         2️⃣.食品\n");
                printf("         3️⃣.生活\n");
                printf("         4️⃣.学习用品\n");
                printf("         5️⃣.其他\n");
                printf("▶️请输入要上架的商品分类序号(1~5)(🔙可输入'...'取消上架🔙)：");
                temp_namestatu = [super seekRule:LCQKeyRule_Numb AndJudgeSaveUser:&olduserdata];
                if (temp_namestatu == LCQResultKeyRule_OK)
                {
                    int tempjudge = [olduserdata.member intValue];
                    switch ( tempjudge )
                    {
                        case uicommon_OperaWares_IT:
                            newware.wareclass = IT;
                            tempstatu = uicommon_OperaWares_upwareprice;
                            printf("=========================================\n");
                            break;
                            
                        case uicommon_OperaWares_EAT:
                            newware.wareclass = EAT;
                            tempstatu = uicommon_OperaWares_upwareprice;
                            printf("=========================================\n");
                            break;
                            
                        case uicommon_OperaWares_LIFE:
                            newware.wareclass = LIFE;
                            tempstatu = uicommon_OperaWares_upwareprice;
                            printf("=========================================\n");
                            break;
                            
                        case uicommon_OperaWares_STUDENTTOOL:
                            newware.wareclass = STUDENTTOOL;
                            tempstatu = uicommon_OperaWares_upwareprice;
                            printf("=========================================\n");
                            break;
                            
                        case uicommon_OperaWares_OTHER:
                            newware.wareclass = OTHER;
                            tempstatu = uicommon_OperaWares_upwareprice;
                            printf("=========================================\n");
                            break;
                            
                        default:
                            printf("%s",ERROR0x01_ILLEGAL_NUM);
                            break;
                    }//判断数字
                }
                break;
                
            case uicommon_OperaWares_upwareprice:
                printf("▶️请输入要上架的商品单价(🔙可输入'...'取消上架🔙)：");
                temp_namestatu = [super seekRule:LCQKeyRule_Numb AndJudgeSaveUser:&olduserdata];
                if (temp_namestatu == LCQResultKeyRule_OK)
                {
                    newware.wareprice = [olduserdata.member intValue];
                    tempstatu = uicommon_OperaWares_upwaresum;
                    printf("=========================================\n");
                }
                break;
                
            case uicommon_OperaWares_upwaresum:
                printf("▶️请输入要上架的商品数量(🔙可输入'...'取消上架🔙)：");
                temp_namestatu = [super seekRule:LCQKeyRule_Numb AndJudgeSaveUser:&olduserdata];
                if (temp_namestatu == LCQResultKeyRule_OK)
                {
                    newware.waresum = [olduserdata.member intValue];
                    if(newware.waresum >0)
                    {
                        tempstatu = uicommon_OperaWares_opwareok;
                        printf("=========================================\n");
                    }
                    else
                    {
                        printf("%s",ERROR0x0F_ILLEGAL_WARENUMB);
                    }
                }
                break;

//=======================上架结束=======================
                
                
                
                
//=======================下架=======================
            case uicommon_OperaWares_downware:
                [opware selectWareByWho:newuser.name andFlag:UpWare andWare:nil andClass:nil andSaveArray:&temp_alluser];        //遍历数据库
                if (temp_alluser.count !=0 )             //有上架的商品
                {
                    for (NSInteger i = 0; i<temp_alluser.count ; i++)
                    {
                        printf("(%ld)->",i+1);
                        newware = [temp_alluser[i] copy];
                        [newware printfAllData];
                        printf("---------\n");
                    }

                    printf("▶️请输入要下架的商品序号(🔙可输入'...'取消下架🔙)：");
                    temp_namestatu = [super seekRule:LCQKeyRule_Numb AndJudgeSaveUser:&olduserdata];
                    if (temp_namestatu == LCQResultKeyRule_OK)
                    {
                        NSInteger tempjudge = [olduserdata.member intValue];
                        if(tempjudge <= temp_alluser.count && tempjudge>0 )
                        {
                            newware = [temp_alluser[tempjudge-1] copy];
                            newware.wareflag = DownWare;
                            [opware upWareData:newware withStatu:LCQChooseUpWaredata_wareflag];
                            tempstatu = uicommon_OperaWares_opwareok;
                            printf("=========================================\n");
                        }
                        else
                        {
                            printf("%s",ERROR0x01_ILLEGAL_NUM);            //超过序号
                        }
                    }
                }
                else
                {
                    printf("❗️暂无上架商品❗️\n");
                    tempstatu = uicommon_OperaWares_opwareok;
                    printf("=========================================\n");
                }
                break;
                
                
//=======================下架结束=======================
                
                
//=======================搜索商品=======================
            case uicommon_OperaWares_searchware:
                printf("         1️⃣.按分类搜索商品\n");
                printf("         2️⃣.按名字搜索商品\n");
                printf("▶️请输入操作序号(1~2)(🔙可输入'...'取消搜索商品🔙)：");
                temp_namestatu = [super seekRule:LCQKeyRule_Numb AndJudgeSaveUser:&olduserdata];
                if (temp_namestatu == LCQResultKeyRule_OK)
                {
                    int tempjudge = [olduserdata.member intValue];
                    switch ( tempjudge )
                    {
                        case 1:
                            tempstatu = uicommon_OperaWares_searchclass;
                            printf("=========================================\n");
                            break;
                            
                        case 2:
                            tempstatu = uicommon_OperaWares_searchname;
                            printf("=========================================\n");
                            break;
                            
                        default:
                            printf("%s",ERROR0x01_ILLEGAL_NUM);
                            break;
                    }//判断数字
                }
                break;
                
            case uicommon_OperaWares_searchclass:
                printf("         1️⃣.搜索 数码 商品\n");
                printf("         2️⃣.搜索 食品 商品\n");
                printf("         3️⃣.搜索 生活 商品\n");
                printf("         4️⃣.搜索 学习用品 商品\n");
                printf("         5️⃣.搜索 其他 商品\n");
                printf("▶️请输入要查找的分类序号(1~5)(🔙可输入'...'取消搜索商品🔙)：");
                temp_namestatu = [super seekRule:LCQKeyRule_Numb AndJudgeSaveUser:&olduserdata];
                if (temp_namestatu == LCQResultKeyRule_OK)
                {
                    int tempjudge = [olduserdata.member intValue];
                    switch ( tempjudge )
                    {
                        case uicommon_OperaWares_IT:
                            searchchoose = IT;
                            tempstatu = uicommon_OperaWares_searchchoose;
                            printf("=========================================\n");
                            break;
                            
                        case uicommon_OperaWares_EAT:
                            searchchoose = EAT;
                            tempstatu = uicommon_OperaWares_searchchoose;
                            printf("=========================================\n");
                            break;
                            
                        case uicommon_OperaWares_LIFE:
                            searchchoose = LIFE;
                            tempstatu = uicommon_OperaWares_searchchoose;
                            printf("=========================================\n");
                            break;
                            
                        case uicommon_OperaWares_STUDENTTOOL:
                            searchchoose = STUDENTTOOL;
                            tempstatu = uicommon_OperaWares_searchchoose;
                            printf("=========================================\n");
                            break;
                            
                        case uicommon_OperaWares_OTHER:
                            searchchoose = OTHER;
                            tempstatu = uicommon_OperaWares_searchchoose;
                            printf("=========================================\n");
                            break;
                            
                        default:
                            printf("%s",ERROR0x01_ILLEGAL_NUM);
                            break;
                    }
                }
                break;
                
            case uicommon_OperaWares_searchchoose:
                [opware selectWareByWho:nil andFlag:UpWare andWare:nil andClass:searchchoose andSaveArray:&temp_alluser];        //遍历数据库
                if (temp_alluser.count !=0 )
                {
                    for (NSInteger i = 0; i<temp_alluser.count ; i++)
                    {
                        printf("(%ld)->",i+1);
                        newware = [temp_alluser[i] copy];
                        [newware printfAllData];
                        printf("---------\n");
                    }
                    
                    printf("▶️请输入要添加到购物车的商品序号(🔙可输入'...'取消添加🔙)：");
                    temp_namestatu = [super seekRule:LCQKeyRule_Numb AndJudgeSaveUser:&olduserdata];
                    if (temp_namestatu == LCQResultKeyRule_OK)
                    {
                        NSInteger tempjudge = [olduserdata.member intValue];
                        if(tempjudge <= temp_alluser.count && tempjudge>0 )
                        {
                            newware = [temp_alluser[tempjudge-1] copy];     //选择的信息拷贝出来
                            tempstatu = uicommon_OperaWares_searchshopcar;
                            printf("=========================================\n");
                        }
                        else
                        {
                            printf("%s",ERROR0x01_ILLEGAL_NUM);            //超过序号
                        }
                    }
                }
                else
                {
                    printf("❗️暂无此类上架商品❗️\n");
                    tempstatu = uicommon_OperaWares_opwareok;
                    printf("=========================================\n");
                }
                break;
                
            case uicommon_OperaWares_searchname:
                printf("▶️请输入要查找的商品名(只能是字母、数字)(🔙可输入'...'取消查找🔙)：");
                temp_namestatu = [super seekRule:LCQKeyRule_UpWareName AndJudgeSaveUser:&olduserdata];
                if (temp_namestatu == LCQResultKeyRule_Found)
                {
                    newware.warename = olduserdata.member;
                    tempstatu = uicommon_OperaWares_searchshopcar;
                    printf("=========================================\n");
                }
                else if (temp_namestatu == LCQResultKeyRule_NoFound)
                {
                    printf("%s",ERROR0x0E_NO_FOUND_WARENAME);
                }
                break;
                
            case uicommon_OperaWares_searchshopcar:
                printf("✅您选择的商品如下：");
                [opware selectWareByWho:nil andFlag:UpWare andWare:newware.warename andClass:nil andSaveArray:&temp_alluser];        //遍历数据
                newware = [temp_alluser[0] copy];
                [newware printfAllData];
                printf("▶️请输入要添加的数量(🔙可输入'...'取消商品操作🔙)：");
                temp_namestatu = [super seekRule:LCQKeyRule_Numb AndJudgeSaveUser:&olduserdata];
                if (temp_namestatu == LCQResultKeyRule_OK)
                {
                    NSInteger tempjudge = [olduserdata.member intValue];
                    if(tempjudge <= newware.waresum )
                    {

                        newshopcar.shopcarname      = newware.warename;
                        newshopcar.shopcarsaler     = newware.warebypeople;
                        newshopcar.shopcarmoney     = newware.wareprice;
                        newshopcar.shopcarquantity  = tempjudge;
                        newshopcar.shopcarallmoney  = newshopcar.shopcarmoney * newshopcar.shopcarquantity;
                        
                        [opshopcar addToShopCar:newshopcar];
                        
                        tempstatu = uicommon_OperaWares_opwareok;
                        printf("=========================================\n");
                    }
                    else
                    {
                        printf("%s",ERROR0x10_OVER_WARENUMB);            //超过数量
                    }
                }
                break;

//=======================搜索商品结束=======================
                
                
                
                
                
            case uicommon_OperaWares_opwareok:
                [MyStatuP StatuChange:(CommonUser | C_home)];
                [self enterWaitTimer];
                break;

            default:
                break;
        }
        //这里的状态是底层UI.m检测到'...'，想切回主界面，但困在while出不去
        if (MyStatuP.StaNow == (CommonUser | C_home))
        {
//            [newop saveCommonUserData:newuser];         //更新plist
//            printf("=========================================\n");
//            printf("✅当前您的信息如下：");
//            [newuser printfAllData];
//            printf("\n");
            [super uiReturnUpUi:(CommonUser | C_home)];
            break;
        }
    }
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
