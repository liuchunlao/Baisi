//
//  BAIEssenseController.m
//  Baisi
//
//  Created by liuchunlao on 2018/8/23.
//  Copyright © 2018年 liuchunlao. All rights reserved.
//

#import "BAIEssenseController.h"
#import "BAISubcribeController.h"
#import "BAITopSelectView.h"
#import "BAITopicController.h"

@interface BAIEssenseController () <BAITopSelectViewDelegate>

@property (nonatomic, weak) UIScrollView *sv;
@property (nonatomic, weak) BAITopSelectView *topV;

@end

@implementation BAIEssenseController


- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark - 推荐关注
- (void)leftItemClick {
    
    BAISubcribeController *vc = [[BAISubcribeController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {

    if (scrollView != _sv) {
        return;
    }
    CGFloat offsetX = scrollView.contentOffset.x;
    NSInteger idx = offsetX / scrollView.cz_width;
    _topV.selIdx = idx;
}

#pragma mark - BAITopSelectViewDelegate
- (void)topSelectView:(BAITopSelectView *)v didSelectIdx:(NSInteger)idx {
    CGRect rect = CGRectMake(self.view.cz_width * idx, 0, self.view.cz_width, self.view.cz_height);
    [_sv scrollRectToVisible:rect animated:YES];

    [self showVcViewAtIndex:idx];
}

- (void)showVcViewAtIndex:(NSInteger)idx {
    
    UIView *v = self.childViewControllers[idx].view;
    
    if ([_sv.subviews containsObject:v]) {
        return;
    }
    
    v.backgroundColor = [UIColor yellowColor];
    v.frame = CGRectMake(kSW * idx, 0, kSW, kSH);
    UITableView *tv = (UITableView *)v;
    tv.contentInset = UIEdgeInsetsMake(35, 0, 49, 0);
    tv.scrollIndicatorInsets = tv.contentInset;
    
    [_sv addSubview:v];
    
    
}

#pragma mark - 搭建界面
- (void)setupUI {
 
    [self setupNav];
    [self setupChildVcs];
    [self setupScrollView];
    [self setupTags];
}

- (void)setupChildVcs {
    
    BAITopicController *vc1 = [[BAITopicController alloc] init];
    vc1.type = kTopicTypePicture;
    BAITopicController *vc2 = [[BAITopicController alloc] init];
    vc2.type = kTopicTypeVideo;
    BAITopicController *vc3 = [[BAITopicController alloc] init];
    vc3.type = kTopicTypeAll;
    BAITopicController *vc4 = [[BAITopicController alloc] init];
    vc4.type = kTopicTypeWord;
    
    [self addChildViewController:vc1];
    [self addChildViewController:vc2];
    [self addChildViewController:vc3];
    [self addChildViewController:vc4];
}

- (void)setupScrollView {
   
    UIView *v = [[UIView alloc] init];
    v.frame = CGRectMake(0, 0, kSW, 0.01);
    [self.view addSubview:v];
    
    UIScrollView *sv = [[UIScrollView alloc] init];
    sv.backgroundColor = UIColor.redColor;
    NSInteger count = self.childViewControllers.count;
    sv.contentSize = CGSizeMake(count * self.view.cz_width, kSH);
    sv.pagingEnabled = YES;
    sv.bounces = NO;
    sv.delegate = self;
    sv.showsVerticalScrollIndicator = NO;
    sv.showsHorizontalScrollIndicator = NO;
    
    [self.view addSubview:sv];
    
    sv.frame = self.view.bounds;
    
    _sv = sv;
}

- (void)setupTags {
    BAITopSelectView *topV = [BAITopSelectView selectViewWithArr:@[@"全部", @"视频", @"图片", @"文字"] delegate:self];
    topV.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.5];
    [self.view addSubview:topV];
    
    [topV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        if (@available(iOS 11.0, *)) {
            make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop);
        } else {
            make.top.equalTo(self.mas_topLayoutGuideBottom);
        }
        make.height.mas_equalTo(35);
    }];
    _topV = topV;
}

- (void)setupNav {
    
    UIImageView *titleV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    titleV.bounds = CGRectMake(0, 0, 107, 19);
    self.navigationItem.titleView = titleV;
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem cz_itemWithImgName:@"MainTagSubIcon" highImgName:@"MainTagSubIconClick" target:self selector:@selector(leftItemClick)];

}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
}

@end
