//
//  FeedViewModel.m
//  Feed-iOS-MVVM
//
//  Created by Omsub Sukkhee on 4/28/17.
//  Copyright © 2017 omsub. All rights reserved.
//

#import "FeedViewModel.h"

@interface FeedViewModel()

@property (nonatomic, weak) id<FeedViewModelDelegate> delegate;

@property (nonatomic, strong) NSArray<NSString *> *posts;

@end

@implementation FeedViewModel

- (instancetype)initWithDelegate:(id<FeedViewModelDelegate>)delegate {
    self = [self init];
    if(self) {
        self.posts = [[NSArray alloc] init];
        self.delegate = delegate;
    }
    
    return self;
}

- (void)refreshData {
    NSArray *posts = @[@"omsub", @"omsub2", @"omsub3", @"omsub4"];
    self.posts = posts;
    [self.delegate onDataDidLoad];
}

- (NSInteger)numberOfPosts {
    return self.posts.count;
}

- (NSInteger)rowsPerPost:(NSInteger)index {
    return 5;
}

- (NSString *)cellTypeForIndex:(NSInteger)index {
    switch (index) {
        case 0:
            return @"feed-header";
            
        case 1:
            return @"feed-image";
            
        case 2:
            return @"feed-button";
            
        case 3:
            return @"feed-caption";
            
        case 4:
            return @"feed-separator";
            
        default:
            return @"feed-separator";
    }
}

@end
