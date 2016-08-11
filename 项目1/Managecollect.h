//
//  Managecollect.h
//  项目1
//
//  Created by Leonlincq on 16/8/11.
//  Copyright © 2016年 Leonlincq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Managecollect : NSObject

//用户收藏表

//更新标记位？ | 用户名 | 商品编号n | ...

@property (nonatomic,assign)    NSUInteger  flag;       //更新标记位?
@property (nonatomic,copy)      NSString    *name;      //用户名       --关联
@property (nonatomic,assign)    NSUInteger  *warenum;   //商品编号

@end
