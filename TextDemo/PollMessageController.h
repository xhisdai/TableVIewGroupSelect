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

@property (weak, nonatomic) IBOutlet PollMessageTableView *table_view;

@property (weak, nonatomic) IBOutlet UIButton *pushBtn;
@property (weak, nonatomic) IBOutlet UIButton *addDefactBtn;

- (IBAction)PushBtnClick:(id)sender;

- (IBAction)AddDefactBtnClick:(id)sender;

@end
