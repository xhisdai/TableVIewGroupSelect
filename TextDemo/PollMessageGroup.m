//
//  PollMessageGroup.m
//  ElectricitySteward
//
//  Created by huhaifeng on 15/12/9.
//  Copyright © 2015年 huhaifeng. All rights reserved.
//

#import "PollMessageGroup.h"
#import "PollMessageModel.h"
@implementation PollMessageGroup

@synthesize PollMessArrays,titleName;

+ (instancetype)PollMessWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}
- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        PollMessArrays =[NSMutableArray new];
        titleName =[dict objectForKey:@"title"];
        NSArray *array =[dict objectForKey:@"data"];
        for (int i= 0; i<[array count]; i++) {
            PollMessageModel *model =[PollMessageModel initWithDic:@{@"title":[[array objectAtIndex:i] objectForKey:@"content"],@"image":@0,@"id":[[array objectAtIndex:i] objectForKey:@"id"],}];
            [PollMessArrays addObject:model];
        }
    }
    return self;
}

@end
