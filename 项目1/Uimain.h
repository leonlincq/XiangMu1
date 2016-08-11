//
//  Uimain.h
//  项目1
//
//  Created by Leonlincq on 16/8/11.
//  Copyright © 2016年 Leonlincq. All rights reserved.
//

#import "Ui.h"

@interface Uimain : Ui

/** 主界面接口 */
-(void)uiMainInterface:(Status**)tempstatu;
/** 主界面显示 */
-(void)uiMainHome:(Status**)tempstatu;
/** 主界面注册新用户 */
-(void)uiMainRegisterNewUser:(Status**)tempstatu;
/** 主界面找回密码 */
-(void)uiMainFoundPassWord:(Status**)tempstatu;

@end
