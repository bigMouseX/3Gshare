//
//  ChangeTableViewCell.m
//  3GShare
//
//  Created by 夏楠 on 2023/7/18.
//

#import "ChangeTableViewCell.h"

@implementation ChangeTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if ([self.reuseIdentifier isEqualToString:@"change"]) {

        self.name = [[UILabel alloc] init];
        [self.contentView addSubview:self.name];
        
        
//        self.textField = [[UITextField alloc] init];
//        [self.contentView addSubview:self.textField];
    }
    return self;
}

- (void)layoutSubviews {
    self.name.frame = CGRectMake(50, 0, 100, 40);
//    self.textField.frame = CGRectMake(150, 0, UIScreen.mainScreen.bounds.size.width - 150, 40);
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
