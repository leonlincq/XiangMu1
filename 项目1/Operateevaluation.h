//
//  Operatecollect.h
//  项目1
//
//  Created by Leonlincq on 16/8/11.
//  Copyright © 2016年 Leonlincq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Manageevaluation.h"
#import "Operateuserdatas.h"

@interface Operateevaluation : NSObject


/** 创建表格 */
-(FILESTATUS)creatTableForEvaluation;
/** 添加信息   orderdata:添加的订单 */
-(FILESTATUS)addEvaluation:(Manageevaluation *)evaluationdata;
/** 选择用户   buyer:卖家     warename：商品名    saler：卖家   array:读取出来保存的数组 */
-(FILESTATUS)selectEvaluationByWho:(NSString*)buyer andWare:(NSString*)warename andSaler:(NSString*)saler andSaveArray:(NSMutableArray**)array;
@end
