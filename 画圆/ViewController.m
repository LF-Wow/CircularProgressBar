//
//  ViewController.m
//  画圆
//
//  Created by 周君 on 16/10/7.
//  Copyright © 2016年 周君. All rights reserved.
//

#import "ViewController.h"
#import "ZJProgressView.h"

@interface ViewController ()<ZJProgressViewDelegate>


@property (nonatomic, assign) float localProgress;

@property (nonatomic, strong) ZJProgressView *progress;
/** 定时器*/
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation ViewController

-(void)viewDidLoad
{
    _progress = [[ZJProgressView alloc] initWithFrame:CGRectMake(65, 100, 45, 45) AndBeignImage:nil PauseImage:nil];
    // 完成
    _progress.arcFinishColor = [UIColor redColor];
    _progress.arcUnfinishColor = [UIColor redColor];
    _progress.arcBackColor = [UIColor grayColor];
    _progress.labelColor = [UIColor redColor];
    _progress.width = 2;
    _progress.delegate = self;
    [self.view addSubview:_progress];

    _timer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(updateProgress:) userInfo:nil repeats:YES];

    [_timer setFireDate:[NSDate distantFuture]];
}
- (void)updateProgress:(NSTimer *)timer {

        _localProgress = ((int)((_localProgress * 100.0f) + 1.01) % 100) / 100.0f;
    _progress.percent = _localProgress;

}

- (void)ZJProgressViewdidSelected:(ZJProgressView *)progressView isPause:(BOOL)pause
{
    if (pause)
    {

        [_timer setFireDate:[NSDate distantFuture]];
    }
    else
    {
        [_timer setFireDate:[NSDate distantPast]];
        
    }
}

@end
