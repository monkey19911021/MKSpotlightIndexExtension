//
//  ViewController.m
//  MKSpotlightIndexExtension
//
//  Created by DONLINKS on 16/7/6.
//  Copyright © 2016年 Donlinks. All rights reserved.
//

#import "ViewController.h"
#import <CoreSpotlight/CoreSpotlight.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (IBAction)addIndex:(id)sender {
    NSMutableArray<CSSearchableItem *> *array = @[].mutableCopy;
    
    //创建 SearchableItemAttributeSet
    CSSearchableItemAttributeSet *set = [[CSSearchableItemAttributeSet alloc] initWithItemContentType: @"views"];
    set.title = @"打开MKApple";
    set.contentDescription = @"在应用里打开MKApple的网站";
    set.thumbnailData = UIImagePNGRepresentation([UIImage imageNamed:@"fielIcon"]);
    
    //创建 SearchableItem
    /*
     uniqueIdentifier: 搜索项唯一标识符
     domainIdentifier: 搜索项的域标识，用于批量操作搜索项
     */
    CSSearchableItem *item = [[CSSearchableItem alloc] initWithUniqueIdentifier:@"MKApple" domainIdentifier:@"MKDomain" attributeSet:set];
    
    //设置时效时间, 10秒
    NSCalendar *calendar = [NSCalendar currentCalendar];
    item.expirationDate = [calendar dateFromComponents:[calendar componentsInTimeZone:calendar.timeZone fromDate:[[NSDate date] dateByAddingTimeInterval:10]]];
    [array addObject:item];
    
    //更新搜索项
    [[CSSearchableIndex defaultSearchableIndex] indexSearchableItems:array completionHandler:^(NSError * _Nullable error) {
        
    }];
}

- (IBAction)deleteAllIndex:(id)sender {
    
    CSSearchableIndex *index = [[CSSearchableIndex alloc] initWithName: [NSBundle mainBundle].bundleIdentifier];
    
    [index fetchLastClientStateWithCompletionHandler:^(NSData * _Nullable clientState, NSError * _Nullable error) {
        
        [index beginIndexBatch];
        
        [index deleteAllSearchableItemsWithCompletionHandler:^(NSError * _Nullable error) {
            
        }];
        
        NSData *state;
        if(clientState){
            state = clientState;
        }else{
            state = [NSData new];
        }
        
        [index endIndexBatchWithClientState:state completionHandler:^(NSError * _Nullable error) {
            NSLog(@"%@", error);
        }];
    }];
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
