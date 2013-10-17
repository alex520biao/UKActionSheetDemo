//
//  ViewController.m
//  UKActionSheetDemo
//
//  Created by alex on 13-10-16.
//  Copyright (c) 2013年 alex. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setTitle:@"press" forState:UIControlStateNormal];
    btn.frame=CGRectMake(150,200,80,50);
    [btn addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark custom 
- (void)buttonAction:(id)sender {    
    ShareSelectSheet *sheet=[[ShareSelectSheet alloc] initShareSelectSheet];
    sheet.delegate=self;
    [sheet show];
    [sheet release];
    
//    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"是否放弃添加"
//                                                             delegate:self
//                                                    cancelButtonTitle:@"取消"
//                                               destructiveButtonTitle:nil
//                                                    otherButtonTitles:@"确定", nil];
//    actionSheet.actionSheetStyle = UIActionSheetStyleDefault;
//    actionSheet.destructiveButtonIndex = 1;
//    actionSheet.tag=0;
//    [actionSheet showInView:self.view];
//    [actionSheet release];
}


#pragma mark UKActionSheetDelegate
- (void)willPresentActionSheet:(UKActionSheet *)actionSheet{
    NSLog(@"willPresentActionSheet");
}

- (void)didPresentActionSheet:(UKActionSheet *)actionSheet{
    NSLog(@"didPresentActionSheet");
}

- (void)willDismissActionSheet:(UKActionSheet *)actionSheet{
    NSLog(@"willDismissActionSheet");
}

- (void)didDismissActionSheet:(UKActionSheet *)actionSheet{
    NSLog(@"didDismissActionSheet");
}


@end
