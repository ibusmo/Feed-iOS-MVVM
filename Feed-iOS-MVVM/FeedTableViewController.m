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
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 540.0;
}

- (void)initRegisterCell {
    [self.tableView registerNib:[UINib nibWithNibName:@"FeedTableViewCell" bundle:nil] forCellReuseIdentifier:@"feed-cell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"FeedSeparatorTableViewCell" bundle:nil] forCellReuseIdentifier:@"feed-separator-cell"];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.viewModel refreshData];
}

#pragma mark - ViewModel Delegate

- (void)onDataDidLoad {
    [self.tableView reloadData];
}

- (void)onDataDidLoadErrorWithMessage:(NSString *)errorMessage {
    NSLog(@"Error with %@", errorMessage);
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.viewModel numberOfPosts];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"feed-cell"];
    
    if(!cell) {
        return [[UITableViewCell alloc] initWithFrame:CGRectZero];
    }
    
    [cell updateConstraintsIfNeeded];
    
    return cell;
}


@end
