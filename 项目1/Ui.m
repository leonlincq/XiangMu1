//
//  Ui.m
//  项目1
//
//  Created by Leonlincq on 16/8/10.
//  Copyright © 2016年 Leonlincq. All rights reserved.
//

#import "Ui.h"

@implementation Ui

//==========================
//      输入数据并判断
//==========================
-(BOOL)inputDataAndSave:(NSString**)data andJudge:(LCQKeyChoose)numbchar
{
    char opString[200];
    scanf("%s",opString);
    *data = [NSString stringWithFormat:@"%s",opString];
    
#if TEST == 1      //调试模式
    NSLog(@"%@",*data);
#endif
    
    //0~9 48-57   0x30-0x39
    //A-Z 65-90   0x41-0x5A
    //a-z 97-122  0x61-0x7A
    
    switch (numbchar)
    {
        case onlyNumb:
            
            for (int i = 0; i<(*data).length; i++)
            {
                unichar tempchar = [*data characterAtIndex:i];
                if (tempchar<'0' || tempchar>'9')
                {
                    return NO;
                }
            }
            
            break;
            
        case onlyChar:
            
            for (int i = 0; i<(*data).length; i++)
            {
                unichar tempchar = [*data characterAtIndex:i];
                if (tempchar<'A' || (tempchar>'Z' && tempchar<'a') ||  tempchar>'z' )
                {
                    return NO;
                }
            }
            
            break;
            
        case onlyNumbAndChar:
            
            for (int i = 0; i<(*data).length; i++)
            {
                unichar tempchar = [*data characterAtIndex:i];
                if (tempchar<'0' || (tempchar>'9' && tempchar<'A') || (tempchar>'Z' && tempchar<'a') ||  tempchar>'z' )
                {
                    return NO;
                }
            }
            
            break;
            
            
        case allKeyValue:
        default:
            
            //允许任意键值
            
            break;
    }
    return YES;
}

//==========================
//      错误界面
//==========================
-(void)uiError:(Status *)statu
{
    NSLog(@"=========================");
    NSLog(@"*     异常状态,请重启      *");
    NSLog(@"=========================");
    [self lookStatu];
    while (1);
}

@end
