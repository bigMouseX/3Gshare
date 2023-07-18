//
//  ChatViewController.h
//  3GShare
//
//  Created by 夏楠 on 2023/7/17.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ChatViewController : UIViewController<UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource>
@property NSMutableArray *arryleftsizewidh;
@property NSMutableArray *arryrightsizewidh;
@property NSMutableArray *arryleftsizeheight;
@property NSMutableArray *arryrightsizeheight;
@property UITableView *tableView;
@property UITextField *shuruTextField;
@property NSMutableArray *arryright;
@property NSMutableArray *arryM;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) NSMutableArray *sizeArray;

@end

NS_ASSUME_NONNULL_END
