//
//  ViewController.m
//  tableTest
//
//  Created by Sergey Urazov on 26/11/15.
//  Copyright © 2015 Sergey Urazov. All rights reserved.
//

#import "ViewController.h"
#import <MagicalRecord/MagicalRecord.h>
#import "Contact.h"

@interface ViewController ()

@property (nonatomic, assign) SortMode sortMode;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupButtons];

    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:NSStringFromClass([Contact class])];
    request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"sortedName" ascending:YES]];
    self.indexPathController = [[TLIndexPathController alloc] initWithFetchRequest:request managedObjectContext:[NSManagedObjectContext MR_defaultContext] sectionNameKeyPath:@"firstLetter" identifierKeyPath:nil cacheName:nil];
    [self.indexPathController performFetch:nil];
}

- (void)setupButtons {
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Fill" style:UIBarButtonItemStylePlain target:self action:@selector(fillAction)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Switch" style:UIBarButtonItemStylePlain target:self action:@selector(switchAction)];
}

- (void)tableView:(UITableView *)tableView configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    Contact *contact = [self.indexPathController.dataModel itemAtIndexPath:indexPath];

    cell.textLabel.text = contact.sortedName;
}

#pragma mark - Table Index

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    if (self.indexPathController.dataModel.items.count) {
        return [self.indexPathController.dataModel sectionNames];
    } else {
        return nil;
    }
}

#pragma mark - Actions

- (void)fillAction {
    NSArray *arr = @[
                     @"DA",
                     @"ED",
                     @"GE"
                     ];
    [MagicalRecord saveWithBlock:^(NSManagedObjectContext *localContext) {
        [Contact MR_deleteAllMatchingPredicate:nil inContext:localContext];
        for (NSString *s in arr) {
            Contact *c = [Contact MR_createEntityInContext:localContext];
            c.firstName = [s substringToIndex:1];
            c.lastName = [s substringFromIndex:1];
        }
    }];
}

- (void)switchAction {
    self.sortMode = (self.sortMode + 1) % 2;
    [MagicalRecord saveWithBlock:^(NSManagedObjectContext *localContext) {
        for (Contact *contact in [Contact MR_findAllInContext:localContext]) {
            contact.sortMode = self.sortMode;
            [contact updateSortedName];
            [contact updateFirstLetter];
        }
    }];
}

@end
