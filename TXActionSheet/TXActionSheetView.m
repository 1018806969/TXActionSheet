//
//  TXActionSheetView.m
//  TXActionSheet
//
//  Created by deng on 16/11/12.
//  Copyright © 2016年 txx. All rights reserved.
//

#import "TXActionSheetView.h"
#define WIDTH         [UIScreen mainScreen].bounds.size.width
#define HEIGHT        [UIScreen mainScreen].bounds.size.height

@interface TXActionSheetView()

@property(nonatomic,strong)NSMutableArray *buttonTitles;

@end

@implementation TXActionSheetView
-(instancetype)initWithTitle:(NSString *)title delegate:(id)delegate cancelButtonTitle:(NSString *)cancelButtonTitle handleButtonTitles:(NSString *)handleButtonTitle, ...NS_REQUIRES_NIL_TERMINATION;
{
    self = [super init];
    if (self) {
        self.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.1];
        self.delegate = delegate ;
        self.frame = CGRectMake(0, 0, WIDTH,HEIGHT);

        id other;
        va_list args ;
        
        _buttonTitles = [NSMutableArray array];
        
        if(handleButtonTitle){
            [_buttonTitles addObject:handleButtonTitle];
            va_start(args, handleButtonTitle);
            while ((other = va_arg(args,id))){
                [_buttonTitles addObject:other];
            }
            va_end(args);
        }
        [_buttonTitles addObject:cancelButtonTitle];

        [self createSubViewWithTitle:title];
    }
    return self ;
}
-(void)createSubViewWithTitle:(NSString *)title
{
    NSUInteger count = _buttonTitles.count ;

    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, HEIGHT-(count+1)*44, WIDTH, 43.5)];
    label.backgroundColor = [UIColor grayColor];
    label.text = title ;
    label.textAlignment = NSTextAlignmentCenter;
    label.userInteractionEnabled = YES ;
    [self addSubview:label];
    
    UIButton * detailButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [detailButton setBackgroundColor:[UIColor grayColor]];
    [detailButton setTitle:@"detail" forState:UIControlStateNormal];
    [detailButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    detailButton.frame = CGRectMake(WIDTH-44,0,44, 43.5);
    [detailButton addTarget:self action:@selector(detailClick) forControlEvents:UIControlEventTouchUpInside];
    [label addSubview:detailButton];

    for (int i = 0; i<count; i++) {
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setBackgroundColor:[UIColor grayColor]];
        [btn setTitle:_buttonTitles[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.tag = i ;
        btn.frame = CGRectMake(0, HEIGHT-(count-i)*44, WIDTH, 43.5);
        [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
    }
}
-(void)click:(UIButton *)btn
{
    if (_delegate) {
        if ([self.delegate respondsToSelector:@selector(actionSheetView:clickedButtonAtIndex:)]) {
            [self.delegate actionSheetView:self clickedButtonAtIndex:btn.tag];
        }
    }
    [self removeFromSuperview];
}
-(void)detailClick
{
    if (_delegate) {
        if ([self.delegate respondsToSelector:@selector(actionSheetView:clickedButtonAtIndex:)]) {
            [self.delegate actionSheetView:self clickedButtonAtIndex:100];
        }
    }
    [self removeFromSuperview];
}
@end
