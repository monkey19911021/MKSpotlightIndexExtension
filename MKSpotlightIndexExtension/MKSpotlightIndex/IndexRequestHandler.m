//
//  IndexRequestHandler.m
//  MKSpotlightIndex
//
//  Created by DONLINKS on 16/7/6.
//  Copyright © 2016年 Donlinks. All rights reserved.
//

#import "IndexRequestHandler.h"

@implementation IndexRequestHandler
{
    NSMutableArray<CSSearchableItem *> * searchableItems;
}

- (void)searchableIndex:(CSSearchableIndex *)searchableIndex reindexAllSearchableItemsWithAcknowledgementHandler:(void (^)(void))acknowledgementHandler {
    // Reindex all data with the provided index
    
    searchableItems = @[].mutableCopy;
    for(int i=0; i<10; i++){
        CSSearchableItemAttributeSet *set = [[CSSearchableItemAttributeSet alloc] initWithItemContentType: @"views"];
        set.title = [NSString stringWithFormat:@"打开MKApple (%@)", @(i)];
        set.contentDescription =[NSString stringWithFormat:@"在应用里打开MKApple的网站 (%@)", @(i)] ;
        set.thumbnailData = UIImagePNGRepresentation([UIImage imageNamed:@"fielIcon"]);
        CSSearchableItem *item = [[CSSearchableItem alloc] initWithUniqueIdentifier:[NSString stringWithFormat:@"MKApple (%@)", @(i)] domainIdentifier:@"MKDomain" attributeSet:set];
        [searchableItems addObject:item];
    }
    
    [[CSSearchableIndex defaultSearchableIndex] indexSearchableItems:searchableItems completionHandler:^(NSError * _Nullable error) {
        
    }];
    acknowledgementHandler();
}

- (void)searchableIndex:(CSSearchableIndex *)searchableIndex reindexSearchableItemsWithIdentifiers:(NSArray <NSString *> *)identifiers acknowledgementHandler:(void (^)(void))acknowledgementHandler {
    // Reindex any items with the given identifiers and the provided index
    
    for(NSString *identifier in identifiers){
        if([identifier isEqualToString: @"MKApple (3)"]){
            //reindex something
        }
    }
    
    acknowledgementHandler();
}

@end
