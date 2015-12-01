//
//  Contact.h
//  tableTest
//
//  Created by Sergey Urazov on 26/11/15.
//  Copyright © 2015 Sergey Urazov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

typedef  NS_ENUM(NSInteger, SortMode) {
    SortModeFirst,
    SortModeLast
};

NS_ASSUME_NONNULL_BEGIN

@interface Contact : NSManagedObject

@property (nonatomic, assign) SortMode sortMode;

- (void)updateFirstLetter;
- (void)updateSortedName;

@end

NS_ASSUME_NONNULL_END

#import "Contact+CoreDataProperties.h"
