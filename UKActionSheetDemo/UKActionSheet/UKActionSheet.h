//
//  UKActionSheet.h
//  UIWindowCustomTest
//
//  Created by alex on 13-10-15.
//  Copyright (c) 2013年 Tencent. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol UKActionSheetDelegate;

@interface UKActionSheet : UIView
@property (nonatomic, assign) id<UKActionSheetDelegate> delegate;


//UKActionSheet是一个没有展示内容的操作表类，唯一参数是高度height
//UKActionSheet弥补系统UIActionSheet无法定制的缺点
-(id)initWithHeight:(CGFloat)height;
-(void)show;
-(void)dismiss;
@end

@protocol UKActionSheetDelegate <NSObject>
@optional
- (void)willPresentActionSheet:(UKActionSheet *)actionSheet;  // before animation and showing view
- (void)didPresentActionSheet:(UKActionSheet *)actionSheet;  // after animation

- (void)willDismissActionSheet:(UKActionSheet *)actionSheet; // before animation and hiding view
- (void)didDismissActionSheet:(UKActionSheet *)actionSheet;  // after animation

@end

