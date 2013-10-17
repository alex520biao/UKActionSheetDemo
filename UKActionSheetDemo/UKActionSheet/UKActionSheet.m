//
//  UKActionSheet.m
//  UIWindowCustomTest
//
//  Created by alex on 13-10-15.
//  Copyright (c) 2013年 Tencent. All rights reserved.
//

#import "UKActionSheet.h"

#define sheetHeight 100 //默认初始高度

@interface UKActionSheet ()
@property(nonatomic,assign)UIWindow *displayWindow;//UKActionSheet所在的UIWindow，需要引用

@end

@implementation UKActionSheet
@synthesize delegate=_delegate;
@synthesize displayWindow=_displayWindow;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
    }
    return self;
}

-(id)initWithHeight:(CGFloat)height{
    CGRect screenBounds=[[UIScreen mainScreen] bounds];
    self = [super initWithFrame:CGRectMake(0, screenBounds.size.height, screenBounds.size.width, sheetHeight)];
    if (self) {
        self.backgroundColor=[UIColor redColor];
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

-(void)layoutSubviews{
    [super layoutSubviews];
    
    
}


#pragma mark Custom show/diss
-(void)show{    
    CGRect screenBounds=[[UIScreen mainScreen] bounds];
    //UKActionSheet的window
    UIWindow *window=[[UIWindow alloc] initWithFrame:screenBounds];
    window.windowLevel=UIWindowLevelAlert;
    self.displayWindow=window;

    //半透明背景
    UIView *backgroundView=[[[UIView alloc] initWithFrame:window.bounds] autorelease];
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backgroundAction:)];
    [backgroundView addGestureRecognizer:singleTap];
    [window addSubview:backgroundView];
    
    [window addSubview:self];
    [window makeKeyAndVisible];
    
    //代理调用
    if ([self.delegate respondsToSelector:@selector(willPresentActionSheet:)]) {
        [self.delegate willPresentActionSheet:self];
    }
    __block UKActionSheet *sheet=self;
    [UIView animateWithDuration:0.3
                     animations:^{
                         UIColor *color=[UIColor colorWithRed:100/255  green:100/255 blue:100/255 alpha:0.5];
                         [backgroundView setBackgroundColor:color];
                         
                         [sheet setFrame:CGRectMake(0, 480-sheet.frame.size.height,sheet.frame.size.width , sheet.frame.size.height)];
                     } completion:^(BOOL finished) {
                         //代理调用
                         if ([self.delegate respondsToSelector:@selector(didPresentActionSheet:)]) {
                             [self.delegate didPresentActionSheet:self];
                         }
                     }];
}

-(void)dismiss{
    //代理调用
    if ([self.delegate respondsToSelector:@selector(willDismissActionSheet:)]) {
        [self.delegate willDismissActionSheet:self];
    }
    __block UKActionSheet *sheet=self;
    [UIView animateWithDuration:0.3
                     animations:^{
                         [sheet setFrame:CGRectMake(0,sheet.displayWindow.bounds.size.height, sheet.frame.size.width , sheet.frame.size.height)];
                         
                         UIView *backgroundView=[[[UIApplication sharedApplication] keyWindow] viewWithTag:777];
                         [backgroundView setBackgroundColor:[UIColor clearColor]];
                     } completion:^(BOOL finished) {
                         //代理调用
                         if ([self.delegate respondsToSelector:@selector(didDismissActionSheet:)]) {
                             [self.delegate didDismissActionSheet:self];
                         }
                         [sheet removeFromSuperview];
                         
                         UIWindow *keyWindow=[[UIApplication sharedApplication] keyWindow];
                         [keyWindow resignKeyWindow];//当前Window注销后，系统会自动让appDelegate中的window成为keyWindow
                         [keyWindow release];
                         keyWindow=nil;
                     }];
}

#pragma mark Cutsstom IBAction
- (void) backgroundAction:(UITapGestureRecognizer*) gesture
{
    [self dismiss];
}

@end
