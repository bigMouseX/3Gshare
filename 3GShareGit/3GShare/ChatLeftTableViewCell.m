//
//  ChatLeftTableViewCell.m
//  3GShare
//
//  Created by 夏楠 on 2023/7/18.
//

#import "ChatLeftTableViewCell.h"

@implementation ChatLeftTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        _leftImageView = [[UIImageView alloc]init];
//        _rightImageView = [[UIImageView alloc]init];
        _leftTextView = [[UILabel alloc]init];
//        _rightTextView = [[UILabel alloc]init];
        _dateLabel = [[UILabel alloc]init];
        
        [self.contentView addSubview:_dateLabel];
        [self.contentView addSubview:_leftTextView];
//         [self.contentView addSubview:_rightTextView];
         [self.contentView addSubview:_leftImageView];
//         [self.contentView addSubview:_rightImageView];
    }
    return self;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
