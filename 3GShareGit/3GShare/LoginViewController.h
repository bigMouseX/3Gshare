//
//  LoginViewController.h
//  3GShare
//
//  Created by 夏楠 on 2023/7/8.
//

#import <UIKit/UIKit.h>
#import "RegisterViewController.h"
NS_ASSUME_NONNULL_BEGIN

@interface LoginViewController : UIViewController<UITextFieldDelegate, ConfirmDelegate>
@property(retain, nonatomic)UITextField *textField1;
@property(retain, nonatomic)UITextField *textField2;
@property(nonatomic, copy)NSMutableArray *accoutArray;
@property(nonatomic, copy)NSMutableArray *passwordArray;
@property (retain, nonatomic)UIAlertController *alert;
@property (nonatomic, strong) RegisterViewController *rVC;

@end

NS_ASSUME_NONNULL_END
