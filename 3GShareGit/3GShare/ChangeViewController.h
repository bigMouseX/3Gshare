//
//  ChangeViewController.h
//  3GShare
//
//  Created by 夏楠 on 2023/7/18.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ChangeViewController : UIViewController
<UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>
@property(nonatomic, strong)UITableView *tableView;
@property(nonatomic, strong)NSArray *arrayData;
@property (retain, nonatomic)UIAlertController *alert;
@property(nonatomic, strong)NSArray *arrayData2;
@property(nonatomic, strong)UITextField *t1;
@property(nonatomic, strong)UITextField *t2;
@property(nonatomic, strong)UITextField *t3;
@property(nonatomic, strong)NSString *s1;
@property(nonatomic, strong)NSString *s2;
@property(nonatomic, strong)NSString *s3;

@end

NS_ASSUME_NONNULL_END
