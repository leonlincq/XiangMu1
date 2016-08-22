//
//  Operatewares.h
//  项目1
//
//  Created by Leonlincq on 16/8/11.
//  Copyright © 2016年 Leonlincq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Managewares.h"
#import "Operateuserdatas.h"

@interface Operatewares : NSObject

typedef NSUInteger  LCQChooseUpWaredata;
enum
{
    LCQChooseUpWaredata_wareflag    = 0x00,
    LCQChooseUpWaredata_warename    = 0x01,
    LCQChooseUpWaredata_wareclass   = 0x02,
    LCQChooseUpWaredata_wareprice   = 0x03,
    LCQChooseUpWaredata_waresum     = 0x04,
};



/** 创建表格 */
-(FILESTATUS)creatTableForWare;
/** 添加信息   waredata:添加的商品 */
-(FILESTATUS)addWare:(Managewares *)waredata;
/** 选择用户   name:选择的用户，nil代表全选  array:读取出来保存的数组 */
-(FILESTATUS)selectWareByWho:(NSString*)name andFlag:(NSString*)flag andWare:(NSString*)ware andClass:(NSString*)class andSaveArray:(NSMutableArray**)array;
/** 删除用户   name:选择的用户 */
-(FILESTATUS)deletWareByWho:(NSString *)name;
/** 更新用户   waredata:用户信息表   who:更新为上架还是下架 */
-(FILESTATUS)upWareData:(Managewares *)waredata withStatu:(LCQChooseUpWaredata)statu;

/** 模糊查看商品 ware:模糊商品名 */
-(FILESTATUS)vagueSearchWare:(NSString*)ware andSaveArray:(NSMutableArray**)array;
@end
