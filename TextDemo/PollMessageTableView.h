//
//  PollMessageTableView.h
//  ElectricitySteward
//
//  Created by huhaifeng on 15/12/9.
//  Copyright © 2015年 huhaifeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PollMessageTableDelegate <NSObject>

//回调VC 检查所有group是否选定 改变全选按钮状态
- (void)CellClickAllSelectStatus;
@end

@interface PollMessageTableView : UITableView

@property (nonatomic ,strong)NSMutableArray *arrayData;
@property (nonatomic ,strong)id<PollMessageTableDelegate>pollTableDelegate;

@end
