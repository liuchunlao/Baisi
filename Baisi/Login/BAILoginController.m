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

@end

@implementation BAILoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


- (IBAction)closeBtnClick {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}



@end
