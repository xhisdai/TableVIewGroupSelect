//
//  PollMessageModel.h
//  ElectricitySteward
//
//  Created by huhaifeng on 15/12/9.
//  Copyright © 2015年 huhaifeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PollMessageModel : NSObject

@property (nonatomic ,copy)NSNumber *imgBool;
@property (nonatomic ,copy)NSNumber *Id;
@property (nonatomic ,copy)NSString *title;


+(PollMessageModel *)initWithDic:(NSDictionary *)dic;

-(PollMessageModel *)initWithModel:(NSDictionary *)dic;
@end
