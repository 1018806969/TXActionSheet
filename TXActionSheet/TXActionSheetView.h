//
//  TXActionSheetView.h
//  TXActionSheet
//
//  Created by deng on 16/11/12.
//  Copyright © 2016年 txx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TXActionSheetView : UIView

@property(nonatomic,assign)id delegate ;

-(instancetype)initWithTitle:(NSString *)title delegate:(id)delegate cancelButtonTitle:(NSString *)cancelButtonTitle handleButtonTitles:(NSString *)handleButtonTitle,...NS_REQUIRES_NIL_TERMINATION;

@end

@protocol TXActionSheetViewDelegate <NSObject>

-(void)actionSheetView:(TXActionSheetView *)actionSheetView clickedButtonAtIndex:(NSInteger)buttonIndex;


@end
