//
//  Contact.m
//  tableTest
//
//  Created by Sergey Urazov on 26/11/15.
//  Copyright © 2015 Sergey Urazov. All rights reserved.
//

#import "Contact.h"

@implementation Contact

@synthesize sortMode;

- (void)didChangeValueForKey:(NSString *)key {
    [super didChangeValueForKey:key];
    if ([key isEqualToString:@"firstName"] || [key isEqualToString:@"lastName"]) {
        [self updateSortedName];
        [self updateFirstLetter];
    }
}

- (void)updateFirstLetter {
    self.firstLetter = [[self.sortedName substringToIndex:1] capitalizedString];
}

- (void)updateSortedName {
    if (self.sortMode == SortModeFirst) {
        self.sortedName = [NSString stringWithFormat:@"%@ ! %@", self.firstName, self.lastName];
    } else {
        self.sortedName = [NSString stringWithFormat:@"%@ ! %@", self.lastName, self.firstName];
    }
}

@end
