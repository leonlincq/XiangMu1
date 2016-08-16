//
//  Operateuserdatas.h
//  项目1
//
//  Created by Leonlincq on 16/8/11.
//  Copyright © 2016年 Leonlincq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"
#import "Manageuserdatas.h"

@interface Operateuserdatas : NSObject



typedef NSUInteger FILESTATUS;
#define FILEYES         0x00
#define FILEOpenError   0x01
#define FILEBuildError  0x02
#define FILEAddError    0x03
#define FILEDeleError   0x04
#define FILEUpDataError 0x05

typedef NSUInteger  LCQChooseUpdata;
enum
{
    uprealnamedata  = 0x00,
    uppassworddata  = 0x01
};

/** 创建表格 */
-(FILESTATUS)creatTable;
/** 添加信息   userdate:添加的用户信息 */
-(FILESTATUS)addUser:(Manageuserdatas *)userdate;
/** 选择用户   name:选择的用户，nil代表全选  array:读取出来保存的数组 */
-(FILESTATUS)selectUser:(NSString*)name andSaveArray:(NSMutableArray**)array;
/** 删除用户   name:选择的用户 */
-(FILESTATUS)deletUser:(NSString *)name;
/** 更新用户   userdate:用户信息表   who:更新其中哪个信息 */
-(FILESTATUS)upUserData:(Manageuserdatas *)userdate withWho:(LCQChooseUpdata)who;

@end
