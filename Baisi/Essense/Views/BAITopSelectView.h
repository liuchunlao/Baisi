//
//  BAITopSelectView.h
//  Baisi
//
//  Created by liuchunlao on 2018/8/30.
//  Copyright © 2018年 liuchunlao. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BAITopSelectView;
@protocol BAITopSelectViewDelegate <NSObject>

- (void)topSelectView:(BAITopSelectView *)v didSelectIdx:(NSInteger)idx;

@end

@interface BAITopSelectView : UIView
@property (nonatomic, assign) NSInteger selIdx;
@property (nonatomic, weak) id<BAITopSelectViewDelegate> delegate;
+ (instancetype)selectViewWithArr:(NSArray<NSString *> *)arr delegate:(id<BAITopSelectViewDelegate>)delegate;

@end
