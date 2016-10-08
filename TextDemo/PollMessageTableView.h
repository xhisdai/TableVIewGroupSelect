//
//  PollMessageTableView.h
//  ElectricitySteward
//
//  Created by huhaifeng on 15/12/9.
//  Copyright © 2015年 huhaifeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PollMessageTableDelegate <NSObject>

-(void)CellClickToTitle:(NSString *)string;

@end

@interface PollMessageTableView : UITableView

@property (nonatomic ,strong)NSMutableArray *arrayData;
@property (nonatomic ,strong)id<PollMessageTableDelegate>pollTableDelegate;

@end
