//
//  Operatemoney.h
//  项目1
//
//  Created by Leonlincq on 16/8/11.
//  Copyright © 2016年 Leonlincq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Operateuserdatas.h"
#import "Managemoney.h"

@interface Operatemoney : NSObject



/** 创建表格 */
-(FILESTATUS)creatTableForOpMoney;
/** 添加金钱操作信息 */
-(FILESTATUS)addOpMoney:(Managemoney *)moneyop;
/** 删除用户资金信息 */
-(FILESTATUS)deletOpMoneyWithUser:(NSString *)name;
/** 查看金钱操作信息 */
-(FILESTATUS)selectOpMoneyName:(NSString*)name andSaveArray:(NSMutableArray**)array;
/** 查看金钱操作信息（双条件） */
-(FILESTATUS)selectOpMoneyName:(NSString*)name andop:(NSString*)op SaveArray:(NSMutableArray**)array;

@end
