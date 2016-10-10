//
//  PollMessageGroup.h
//  ElectricitySteward
//
//  Created by huhaifeng on 15/12/9.
//  Copyright © 2015年 huhaifeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PollMessageGroup : NSObject

@property (nonatomic,strong)NSMutableArray *PollMessArrays;
@property (nonatomic,strong)NSString *titleName;

@property (nonatomic, assign, getter = isOpened) BOOL opened;
@property (nonatomic, assign) BOOL isOK;
+ (instancetype)PollMessWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;

@end
