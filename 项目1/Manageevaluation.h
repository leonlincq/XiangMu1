//
//  Managecollect.h
//  项目1
//
//  Created by Leonlincq on 16/8/11.
//  Copyright © 2016年 Leonlincq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Manageevaluation : NSObject

#define OneStar     @"OneStar"      //一颗星
#define TwoStar     @"TwoStar"      //二颗星
#define ThreeStar   @"ThreeStar"    //三颗星
#define FourStar    @"FourStar"     //四颗星
#define FiveStar    @"FiveStar"     //五颗星

#define GOOD        @"GOOD"         //好评
#define General     @"General"      //一般
#define Poor        @"Poor"         //差评



@property (nonatomic,copy)      NSString    *EvaluationBySaler;     //谁卖的
@property (nonatomic,copy)      NSString    *EvaluationByWare;      //谁的商品
@property (nonatomic,copy)      NSString    *EvaluationByBuyer;     //谁买的
@property (nonatomic,copy)      NSString    *EvaluationByLevel;     //评价级别
@property (nonatomic,copy)      NSString    *EvaluationByPoint;     //评价分数


@end
