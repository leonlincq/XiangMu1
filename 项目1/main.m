//
//  main.m
//  项目1
//
//  Created by Leonlincq on 16/8/10.
//  Copyright © 2016年 Leonlincq. All rights reserved.
//

#import "main.h"

int main(int argc, const char * argv[])
{
    Status *MyStatuP = [[Status alloc]initStatu];
    
    Ui           *MyUiP  = [[Ui alloc]init];
    Uimain       *MyUiMP = [[Uimain alloc]init];
    Uisuperuser  *MyUiSP = [[Uisuperuser alloc]init];
    Uicommonuser *MyUiCP = [[Uicommonuser alloc]init];
    
    while (1)
    {
        switch (MyStatuP.StaNow & CHOOSE_UI )
        {
            case MainInterface:
                [MyUiMP uiMainInterface:&MyStatuP];         //调用主界面接口
                break;
            
            case SuperUser:
                [MyUiSP uiSuperUserInterface:&MyStatuP];    //调用超级用户接口
                break;
            
            case CommonUser:
                [MyUiCP uiCommonUserInterface:&MyStatuP];   //调用普通用户接口
                break;
            
            default:
                [MyUiP uiError:MyStatuP];                   //错误情况，显示错误代码
                break;
        }
    }
    return 0;
}
