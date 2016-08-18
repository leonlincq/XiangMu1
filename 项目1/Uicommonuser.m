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
    printf("✅         🐘5.修改信息              \n");
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
                    
                case C_upData:
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
//     修改用户信息
//==========================
-(void)uiCommonUserUpData
{
//    [self uiCommonUserUping];
    
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
                printf("▶️请输入要修改的信息操作序号(1~7):(🔙可输入'...'取消修改🔙)：\n");
                temp_namestatu = [super seekRule:LCQKeyRule_Numb AndJudgeSaveUser:&olduserdata];
                if (temp_namestatu == LCQResultKeyRule_OK)
                {
                    int tempjudge = [olduserdata.member intValue];
                    switch ( tempjudge )
                    {
                        case uicommon_Updata_password:
                            tempstatu = tempjudge;
                            break;
                    
                        case uicommon_Updata_realname:
                            tempstatu = tempjudge;
                            break;
                            
                        case uicommon_Updata_email:
                            tempstatu = tempjudge;
                            break;
                            
                        case uicommon_Updata_phonenum:
                            tempstatu = tempjudge;
                            break;
                            
                        case uicommon_Updata_answer1:
                            tempstatu = tempjudge;
                            break;
                            
                        case uicommon_Updata_answer2:
                            tempstatu = tempjudge;
                            break;
                            
                        case uicommon_Updata_answer3:
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
                
            default:
                break;
        }
        //这里的状态是底层UI.m检测到'...'，想切回主界面，但困在while出不去
        if (MyStatuP.StaNow == (CommonUser | C_home))
        {
            [newop saveCommonUserData:newuser];         //更新plist
            printf("=========================================\n");
            printf("✅当前信息如下：");
            [newuser printfAllData];
            printf("\n");
            [super uiReturnUpUi:(CommonUser | C_home)];
            break;
        }
    }
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
