//
//  BAITopSelectView.m
//  Baisi
//
//  Created by liuchunlao on 2018/8/30.
//  Copyright © 2018年 liuchunlao. All rights reserved.
//

#import "BAITopSelectView.h"

@interface BAITopSelectView ()

@property (nonatomic, weak) UIButton *selBtn;
@property (nonatomic, weak) UIView *lineV;

@end

@implementation BAITopSelectView {
    NSArray<UIButton *> *_btnArr;
}

+ (instancetype)selectViewWithArr:(NSArray<NSString *> *)arr {
    
    BAITopSelectView *v = [[self alloc] initWithFrame:CGRectMake(0, 64, UIScreen.mainScreen.bounds.size.width, 35)];
    [v setupUIWithArr:arr];
    [v setupBottomLine];
    
    v->_btnArr.firstObject.enabled = NO;
    v.selBtn = v->_btnArr.firstObject;
    
    return v;
}

- (void)btnClick:(UIButton *)sender {
    _selBtn.enabled = YES;
    sender.enabled = NO;
    _selBtn = sender;
    
    [UIView animateWithDuration:0.25 animations:^{
        self -> _lineV.cz_width = sender.titleLabel.cz_width;
        self -> _lineV.cz_centerX = sender.center.x;
    }];
}

#pragma mark - 搭建界面
- (void)setupUIWithArr:(NSArray *)arr {
    NSMutableArray *arrM = [NSMutableArray array];
    [arr enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [btn setTitle:obj forState:UIControlStateNormal];
        btn.titleLabel.font = BAIFont(14);
        
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitleColor:BAIThemeRedColor forState:UIControlStateDisabled];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:btn];
        
        [arrM addObject:btn];
    }];
    _btnArr = arrM.copy;
    
    CGFloat w = self.cz_width / _btnArr.count;
    CGFloat h = self.cz_height;
    CGFloat y = 0;
    [_btnArr enumerateObjectsUsingBlock:^(UIButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.frame = CGRectMake(idx * w, y, w, h);
    }];
}


- (void)setupBottomLine {

    UIView *lineV = [[UIView alloc] init];
    lineV.backgroundColor = BAIThemeRedColor;
    [self addSubview:lineV];
    
    [_btnArr.firstObject layoutIfNeeded];
    
    lineV.cz_height = 1;
    lineV.cz_y = self.cz_height - 1;
    lineV.cz_width = _btnArr[0].titleLabel.cz_width;
    lineV.cz_centerX = _btnArr[0].center.x;
    
    _lineV = lineV;
}



@end
