//
//  RegisterViewController.h
//  3GShare
//
//  Created by 夏楠 on 2023/7/11.
//

#import <UIKit/UIKit.h>
//定义代理协议
@protocol ConfirmDelegate <NSObject>

- (void)confirm :(NSMutableArray *)account password:(NSMutableArray *)password;

@end
NS_ASSUME_NONNULL_BEGIN

@interface RegisterViewController : UIViewController<UITextFieldDelegate>
@property(retain, nonatomic)UITextField *textField1;
@property(retain, nonatomic)UITextField *textField2;
@property(retain, nonatomic)UITextField *textField3;
@property(nonatomic, copy)NSMutableArray *accoutArray;
@property(nonatomic, copy)NSMutableArray *passwordArray;
@property (retain, nonatomic)UIAlertController *alert;
@property int t;
@property(nonatomic, copy)NSMutableArray *sendAccoutArray;
@property(nonatomic, copy)NSMutableArray *sendPasswordArray;

//定义一个代理对象
//代理对象会执行协议函数
//通过代理对象实现协议函数，达到代理对象改变本身属性的目的
//代理对象一定要实现代理协议
@property(assign, nonatomic)id<ConfirmDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
