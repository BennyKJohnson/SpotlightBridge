//
//  SPBRankingManager.m
//  SpotlightBridge
//
//  Created by Benjamin Johnson on 11/8/20.
//  Copyright © 2020 Benjamin Johnson. All rights reserved.
//

#import "SPBRankingManager.h"
#import "SFMutableResultSection.h"
#import "SPBResultSection.h"

@implementation SPBRankingManager

+ (NSArray *) rankSections: (NSArray *)sections {
    NSArray *spbSections = [self filterSPBSectionsFromResultSections: sections];
    
    if (![spbSections count]) {
        return sections;
    }
    
    NSMutableArray *mutableSections = [NSMutableArray arrayWithArray:sections];
    [mutableSections removeObjectsInArray:spbSections];
    if ([mutableSections count]) {
        [mutableSections insertObjects:spbSections atIndexes:[NSIndexSet indexSetWithIndex: 0]];
    } else {
        [mutableSections addObjectsFromArray:spbSections];
    }
    
    return [mutableSections copy];
}

+ (NSArray *) filterSPBSectionsFromResultSections:(NSArray *)sections {
    NSPredicate *predicate = [NSPredicate predicateWithBlock:^BOOL(SFMutableResultSection *object, NSDictionary *bindings) {
         return [object domain] == SPBResultSectionDomain;
     }];
     
    return [sections filteredArrayUsingPredicate:predicate];
}

@end
