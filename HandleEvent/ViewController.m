//
//  ViewController.m
//  HandleEvent
//
//  Created by Wilson on 01/02/2018.
//  Copyright © 2018 Wilson. All rights reserved.
//

#import "ViewController.h"

@interface WilsonView : UIView

@property (weak, nonatomic) IBOutlet UIButton *targetBtn;

@end

@implementation WilsonView

- (void)layoutSubviews {
    [super layoutSubviews];
    [self setColorTargetBtn];
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    
    // 将点击事件的点，从原有参考坐标系转换为目标视图的坐标系
    CGPoint pointForTargetView = [self.targetBtn convertPoint:point fromView:self];
    
    // 判断转换后的点是否位于目标视图中
    if (CGRectContainsPoint(self.targetBtn.bounds, pointForTargetView)) {
        // 返回目标视图
        // !!! 注意目标视图只能是当前view的直接子视图或者间接自视图 !!!
        return [self.targetBtn hitTest:pointForTargetView withEvent:event];
    }
    
    return [super hitTest:point withEvent:event];
}

#pragma mark - setSubviews

- (void)setColorTargetBtn {
    self.targetBtn.layer.borderColor = [UIColor redColor].CGColor;
    self.targetBtn.layer.borderWidth = 1.0f;
}

@end

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *resultLab;

@property (weak, nonatomic) IBOutlet UIButton *otherBtn;

@property (weak, nonatomic) IBOutlet UIButton *topBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setColorTopBtn];
    [self setColorOtherBtn];
}

- (void)setColorTopBtn {
    self.topBtn.layer.borderColor = [UIColor grayColor].CGColor;
    self.topBtn.layer.borderWidth = 1.0f;
}

- (void)setColorOtherBtn {
    self.otherBtn.layer.borderColor = [UIColor blueColor].CGColor;
    self.otherBtn.layer.borderWidth = 1.0f;
}

#pragma mark - Action

- (IBAction)clickTargetButton:(id)sender {
    [self showText:@"target button"];
}

- (IBAction)clickTopButton:(UIButton *)sender {
    [self showText:@"top button"];
}

- (IBAction)clickOtherButton:(UIButton *)sender {
    [self showText:@"other button"];
}

- (void)showText:(NSString *)text {
    self.resultLab.text = text;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
