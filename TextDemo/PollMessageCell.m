//
//  PollMessageCell.m
//  ElectricitySteward
//
//  Created by huhaifeng on 15/12/9.
//  Copyright © 2015年 huhaifeng. All rights reserved.
//

#import "PollMessageCell.h"

@implementation PollMessageCell

-(void)awakeFromNib{
    [super awakeFromNib];
}

- (void)CellFroData:(PollMessageModel *)model button:(NSInteger)btnTag block:(void(^)(UIButton *btn))ButtonClickBlock{
    
    self.block =ButtonClickBlock;
    
    self.label.text =model.title;
    
    UIImage *image =[model.imgBool intValue]?[UIImage imageNamed:@"pollMess_on"]:[UIImage imageNamed:@"pollMess_off"];
    self.button.tag =btnTag;
    [self.button setImage:image forState:UIControlStateNormal];
}

- (IBAction)ButtonClick:(id)sender {
    if (self.block) {
        
        self.block(sender);
    }
}
@end
