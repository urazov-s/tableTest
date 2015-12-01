//
//  Contact+CoreDataProperties.h
//  tableTest
//
//  Created by Sergey Urazov on 26/11/15.
//  Copyright © 2015 Sergey Urazov. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Contact.h"

NS_ASSUME_NONNULL_BEGIN

@interface Contact (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *firstName;
@property (nullable, nonatomic, retain) NSString *lastName;
@property (nullable, nonatomic, retain) NSString *sortedName;
@property (nullable, nonatomic, retain) NSString *firstLetter;

@end

NS_ASSUME_NONNULL_END
