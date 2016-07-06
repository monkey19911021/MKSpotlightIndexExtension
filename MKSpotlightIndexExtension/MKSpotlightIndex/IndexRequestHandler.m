//
//  IndexRequestHandler.m
//  MKSpotlightIndex
//
//  Created by DONLINKS on 16/7/6.
//  Copyright © 2016年 Donlinks. All rights reserved.
//

#import "IndexRequestHandler.h"

@implementation IndexRequestHandler

- (void)searchableIndex:(CSSearchableIndex *)searchableIndex reindexAllSearchableItemsWithAcknowledgementHandler:(void (^)(void))acknowledgementHandler {
    // Reindex all data with the provided index
    
    acknowledgementHandler();
}

- (void)searchableIndex:(CSSearchableIndex *)searchableIndex reindexSearchableItemsWithIdentifiers:(NSArray <NSString *> *)identifiers acknowledgementHandler:(void (^)(void))acknowledgementHandler {
    // Reindex any items with the given identifiers and the provided index
    
    acknowledgementHandler();
}

@end
