//
//  ViewController.m
//  ZXLSXReader
//
//  Created by ie on 16/8/24.
//  Copyright © 2016年 casanova. All rights reserved.
//

#import "ViewController.h"
#import "ZWorkbookParser.h"
#import "ZXLSXParser.h"
#import "ZContent.h"

@interface ViewController ()<ZXLSXParserDelegate>

@property (nonatomic, strong) ZXLSXParser *xmlPaser;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _xmlPaser = [ZXLSXParser defaultZXLSXParser];
}

/**
 *  解析xlsx文件
 */
- (IBAction)parseBtnClick {
     NSString *unzipFilePath = [[NSBundle mainBundle] pathForResource:@"mydemo" ofType:@"xlsx"];
    [_xmlPaser setParseFilePath:unzipFilePath];
//    [_xmlPaser setParseOutType:ZParseOutTypeJson];
    [_xmlPaser setParseOutType:ZParseOutTypeArrayObj];
//    [_xmlPaser setParseOutType:ZParseOutTypeArrayDict];
    _xmlPaser.delegate = self;
    [_xmlPaser parse];
}

#pragma -mark xmlParser的结果代理方法
- (void)parser:(ZXLSXParser *)parser success:(id)responseObj {
    
    NSArray<ZContent *> *arr = (NSArray<ZContent *> *)responseObj;
    for (int i = 0; i<arr.count ; i++) {
        
        NSLog(@"myContent:%@",[arr[i] description]);
    }
    
//        NSString *jsonStr = (NSString *)responseObj;
//        NSLog(@"--%@",jsonStr);
    
//    NSArray *arr = (NSArray *)responseObj;
//    NSLog(@"delm--%@",arr);
}

@end
