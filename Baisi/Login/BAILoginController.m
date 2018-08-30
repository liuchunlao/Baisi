//
//  BAILoginController.m
//  Baisi
//
//  Created by liuchunlao on 2018/8/29.
//  Copyright © 2018年 liuchunlao. All rights reserved.
//

#import "BAILoginController.h"

@interface BAILoginController ()

@property (nonatomic, weak) IBOutlet UITextField *phoneFld;
@property (nonatomic, weak) IBOutlet UITextField *pwdFld;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftCons;

@end

@implementation BAILoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)loginAndRegisterClick:(UIButton *)sender {
    
    [self.view endEditing:YES];
    
    BOOL isRegister = [sender.currentTitle isEqualToString:@"注册账号"];
    if (isRegister) {
        [sender setTitle:@"已有账号?" forState:UIControlStateNormal];
        _leftCons.constant = -self.view.cz_width;
    } else {
        [sender setTitle:@"注册账号" forState:UIControlStateNormal];
        _leftCons.constant = 0;
    }
    
    [UIView animateWithDuration:0.25 animations:^{
        [self.view layoutIfNeeded];
    }];
    
}

- (IBAction)closeBtnClick {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}



@end
