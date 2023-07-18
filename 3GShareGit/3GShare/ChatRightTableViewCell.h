//
//  ChatTableViewCell.h
//  3GShare
//
//  Created by 夏楠 on 2023/7/17.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ChatRightTableViewCell : UITableViewCell
@property UIImageView * rightImageView;
@property UIImageView * leftImageView;
@property UILabel* rightTextView;
@property UILabel * leftTextView;
@property UILabel *dateLabel;

@end

NS_ASSUME_NONNULL_END
