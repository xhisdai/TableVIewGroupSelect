//
//  PollMessageCell.h
//  ElectricitySteward
//
//  Created by huhaifeng on 15/12/9.
//  Copyright © 2015年 huhaifeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PollMessageModel.h"
@interface PollMessageCell : UITableViewCell

@property (nonatomic ,copy)void(^block)(UIButton *btn);

@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIButton *button;
- (IBAction)ButtonClick:(id)sender;

- (void)CellFroData:(PollMessageModel *)model button:(NSInteger)btnTag block:(void(^)(UIButton *btn))ButtonClickBlock;

@end
