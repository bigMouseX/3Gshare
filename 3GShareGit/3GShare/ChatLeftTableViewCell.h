//
//  ChatLeftTableViewCell.h
//  3GShare
//
//  Created by 夏楠 on 2023/7/18.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ChatLeftTableViewCell : UITableViewCell
@property UIImageView * rightImageView;
@property UIImageView * leftImageView;
@property UILabel* rightTextView;
@property UILabel * leftTextView;
@property UILabel *dateLabel;
@end

NS_ASSUME_NONNULL_END
