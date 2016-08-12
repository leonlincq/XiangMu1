//
//  Ui.h
//  项目1
//
//  Created by Leonlincq on 16/8/10.
//  Copyright © 2016年 Leonlincq. All rights reserved.
//

#import "Status.h"

@interface Ui : Status

typedef unsigned int LCQKeyChoose;  //键盘按键范围
enum
{
    onlyNumb        = 0x00,         //只能是数字
    onlyChar        = 0x01,         //只能是字符
    onlyNumbAndChar = 0x02,         //只能是数字或者字符
    allKeyValue     = 0x03          //可以是任意按键值
};

/** 判断数据的键值是否合法 */
-(BOOL)inputDataAndSave:(NSString**)data andJudge:(LCQKeyChoose)numbchar;

/** 错误提示界面 */
-(void)uiError;

@end
