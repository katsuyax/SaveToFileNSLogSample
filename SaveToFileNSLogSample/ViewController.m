//
//  ViewController.m
//  SaveToFileNSLogSample
//
//  Created by kkato on 2012/10/19.
//  Copyright (c) 2012年 CrossBridge. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (void)tick:(NSTimer *)timer;
@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  // --- NSLognの出力先をDocuments/log.txtに設定する ---
  // パス（Documents/log.txt）の文字列を作成する
  NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                       NSUserDomainMask,
                                                       YES);
  NSString *documentsDirectory = [paths objectAtIndex:0];
  NSString *path = [documentsDirectory stringByAppendingPathComponent:@"log.txt"];
  
  // freopen関数で標準エラー出力をファイルに保存する
  freopen([path cStringUsingEncoding:NSASCIIStringEncoding], "a+", stderr);
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  
  _timer = [NSTimer scheduledTimerWithTimeInterval:1.0f
                                            target:self
                                          selector:@selector(tick:)
                                          userInfo:nil
                                           repeats:YES];
}

- (void)viewDidDisappear:(BOOL)animated {
  [super viewDidDisappear:animated];
  
  [_timer invalidate];
}

- (void)tick:(NSTimer *)timer {
  NSLog(@"fire");
}

@end
