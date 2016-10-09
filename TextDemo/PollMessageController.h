//
//  PollMessageController.h
//  ElectricitySteward
//
//  Created by huhaifeng on 15/12/9.
//  Copyright © 2015年 huhaifeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PollMessageTableView.h"

@interface PollMessageController : UIViewController<PollMessageTableDelegate>

@property (strong, nonatomic)PollMessageTableView *table_view;

@end
