//
//  Operateorder.h
//  项目1
//
//  Created by Leonlincq on 16/8/11.
//  Copyright © 2016年 Leonlincq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Manageorder.h"
#import "Operateuserdatas.h"

@interface Operateorder : NSObject

typedef NSUInteger  LCQChooseUpOrderdata;
enum
{
    LCQChooseUpOrderdata_ordersta   = 0x00,
    LCQChooseUpOrderdata_ordernumb  = 0x01,
};



/** 创建表格 */
-(FILESTATUS)creatTableForOrder;
/** 添加信息   orderdata:添加的订单 */
-(FILESTATUS)addOrder:(Manageorder *)orderdata;
/** 选择用户   name:选择的用户，nil代表全选  array:读取出来保存的数组 */
-(FILESTATUS)selectOrderByWho:(NSString*)name andOrderSta:(NSString*)sta andOrdernumb:(NSInteger)numb andSaler:(NSString*)saler andSaveArray:(NSMutableArray**)array;
/** 删除用户   name:选择的用户 */
-(FILESTATUS)deletOrderByWho:(NSString *)name;
/** 更新用户   waredata:用户信息表   who:更新为上架还是下架 */
-(FILESTATUS)upOrderData:(Manageorder *)orderdata withStatu:(LCQChooseUpOrderdata)statu;
/** 查找有多少订单 */
-(NSInteger)searchOrderByBuyer:(NSString*)buyer andOrderSta:(NSString*)sta andSaler:(NSString*)saler andKeyToErgodic:(BOOL)key;

@end
