//
//  ViewController.m
//  TXActionSheet
//
//  Created by deng on 16/11/12.
//  Copyright © 2016年 txx. All rights reserved.
//

#import "ViewController.h"
#import "TXActionSheetView.h"
@interface ViewController ()<TXActionSheetViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self myName:@"Jane" classMates:@"Kangkang",@"gods",@"Marie",@"Peter",@"Jake", nil];
    
}
-(void)myName:(NSString *)myName classMates:(NSString *)name,...NS_REQUIRES_NIL_TERMINATION
{
    NSMutableArray *names = [NSMutableArray array];
    [names addObject:myName];

    va_list args ;
    id predicate ;
    if(name){
        [names addObject:name];
        va_start(args, name);
        
        while((predicate = va_arg(args, id))){
            [names addObject:predicate];
            NSLog(@"%@",predicate);
        }
        va_end(args);
    }
    NSLog(@"-----------%@",names);
}
- (IBAction)click:(id)sender {
    TXActionSheetView *sheetView= [[TXActionSheetView alloc]initWithTitle:@"000" delegate:self cancelButtonTitle:@"cance" handleButtonTitles:@"111",@"222",@"333", nil];
    [self.view addSubview:sheetView];
}
-(void)actionSheetView:(TXActionSheetView *)actionSheetView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"--------vc---------%@----------%ld",actionSheetView,(long)buttonIndex);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
