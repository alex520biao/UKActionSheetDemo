//
//  ShareSelectSheet.m
//  UIWindowCustomTest
//
//  Created by alex on 13-10-16.
//  Copyright (c) 2013年 Tencent. All rights reserved.
//

#import "ShareSelectSheet.h"

@implementation ShareSelectSheet

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(id)initShareSelectSheet{
    //调用父类方法指定高度
    self=[super initWithHeight:200];
    if (self) {
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        btn.frame=CGRectMake(150,30,80,50);
        [btn addTarget:self action:@selector(cancelAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
    }
    return self;
}

#pragma mark custom
- (void)cancelAction:(id)sender {
    NSLog (@"cancelAction");
    [self dismiss];
}


@end
