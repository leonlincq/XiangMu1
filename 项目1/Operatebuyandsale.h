//
//  Operatebuyandsale.h
//  项目1
//
//  Created by etcxm on 16/8/23.
//  Copyright © 2016年 etc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Operateuserdatas.h"
#import "Managebuyandsale.h"

@interface Operatebuyandsale : NSObject

/** 创建表格 */
-(FILESTATUS)creatTableForOpBuyAndSale;
/** 添加买卖操作信息 */
-(FILESTATUS)addOpBuyAndSale:(Managebuyandsale *)basop;
/** 查看买卖操作信息（三条件） */
-(FILESTATUS)selectOpBuyAndSaleName:(NSString*)name andOrderNum:(NSInteger)num andop:(NSString*)op SaveArray:(NSMutableArray**)array;
/** 删除买卖记录（两条件） */
-(FILESTATUS)deletBuyAndSaleByWho:(NSString *)name andOrderNum:(NSInteger)ordernum;

@end
