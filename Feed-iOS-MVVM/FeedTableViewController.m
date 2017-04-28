//
//  FeedTableViewController.m
//  Feed-iOS-MVVM
//
//  Created by Omsub Sukkhee on 4/28/17.
//  Copyright © 2017 omsub. All rights reserved.
//

#import "FeedTableViewController.h"
#import "FeedViewModel.h"

@interface FeedTableViewController ()

@property (nonatomic, strong) FeedViewModel *viewModel;

@end

@implementation FeedTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.viewModel = [[FeedViewModel alloc] initWithDelegate:self];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self initRegisterCell];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.viewModel refreshData];
}

- (void)initRegisterCell {
    [self.tableView registerNib:[UINib nibWithNibName:@"FeedHeaderTableViewCell" bundle:nil] forCellReuseIdentifier:@"feed-header"];
    [self.tableView registerNib:[UINib nibWithNibName:@"FeedImageContentTableViewCell" bundle:nil] forCellReuseIdentifier:@"feed-image"];
    [self.tableView registerNib:[UINib nibWithNibName:@"FeedButtonTableViewCell" bundle:nil] forCellReuseIdentifier:@"feed-button"];
    [self.tableView registerNib:[UINib nibWithNibName:@"FeedCaptionContentTableViewCell" bundle:nil] forCellReuseIdentifier:@"feed-caption"];
    [self.tableView registerNib:[UINib nibWithNibName:@"FeedSeparatorTableViewCell" bundle:nil] forCellReuseIdentifier:@"feed-separator"];
}

#pragma mark - ViewModel Delegate

- (void)onDataDidLoad {
    [self.tableView reloadData];
}

- (void)onDataDidLoadErrorWithMessage:(NSString *)errorMessage {
    NSLog(@"Error with %@", errorMessage);
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.viewModel numberOfPosts];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.viewModel rowsPerPost:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[self.viewModel cellTypeForIndex:indexPath.row]];
    
    if(!cell) {
        return [[UITableViewCell alloc] initWithFrame:CGRectZero];
    }
    
    [cell setNeedsLayout];
    [cell setNeedsUpdateConstraints];
    [cell updateConstraintsIfNeeded];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[self.viewModel cellTypeForIndex:indexPath.row]];
    
    if(!cell) {
        return 0.0;
    }
    
    [cell setNeedsUpdateConstraints];
    [cell updateConstraintsIfNeeded];
    
    return cell.bounds.size.height;
}

@end
