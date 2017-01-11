# TXActionSheet

在开发中总是能遇到类似这样的方法：
[NSMutableArray arrayWithObjects:<#(nonnull id), ...#>, nil];

那么如何定义这样的方法并实现想要的效果呢？

其实很简单，比如自定义一个方法：

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
}
此方法的调用为：

[self myName:@"Jane" classMates:@"Kangkang",@"gods",@"Marie",@"Peter",@"Jake", nil];
