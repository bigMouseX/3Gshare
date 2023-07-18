//
//  LetterTableViewCell.m
//  3GShare
//
//  Created by 夏楠 on 2023/7/17.
//

#import "LetterTableViewCell.h"
#define newColor [UIColor colorWithRed:50.0 / 255.0 green:142.0 / 255.0 blue:220.0 / 255.0 alpha:1.0]

@implementation LetterTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if ([self.reuseIdentifier isEqualToString:@"letter"]) {
        self.icon = [[UIImageView alloc] init];
        [self.contentView addSubview:self.icon];
        
        self.name = [[UILabel alloc] init];
        [self.contentView addSubview:self.name];
        
        self.name2 = [[UILabel alloc] init];
        [self.contentView addSubview:self.name2];

        self.name3 = [[UILabel alloc] init];
        [self.contentView addSubview:self.name3];
    }
    return self;
}

- (void)layoutSubviews {
    self.name.frame = CGRectMake(90 + 30, 10, 200, 15);
    self.icon.frame = CGRectMake(15 + 30, 5, 50, 50);
    self.name2.frame = CGRectMake(90 + 30, 35, 200, 15);
    self.name2.font = [UIFont systemFontOfSize:14.0];
    self.name2.textColor = newColor;
    self.name3.frame = CGRectMake(UIScreen.mainScreen.bounds.size.width - 70, 2, 80, 15);
    self.name3.font = [UIFont systemFontOfSize:10.0];
    self.name3.textColor = [UIColor grayColor];

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
