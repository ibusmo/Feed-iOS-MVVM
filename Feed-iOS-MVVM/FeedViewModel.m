//
//  FeedViewModel.m
//  Feed-iOS-MVVM
//
//  Created by Omsub Sukkhee on 4/28/17.
//  Copyright © 2017 omsub. All rights reserved.
//

#import "FeedViewModel.h"
#import "RuntimeInteractor.h"

@interface FeedViewModel()

@property (nonatomic, weak) id<FeedViewModelDelegate> delegate;
@property (nonatomic, strong) id<Interactor> inteactor;

@property (nonatomic, strong) NSArray<NSString *> *posts;

@end

@implementation FeedViewModel

- (instancetype)initWithDelegate:(id<FeedViewModelDelegate>)delegate {
    self = [self init];
    if(self) {
        self.delegate = delegate;
        self.inteactor = [[RuntimeInteractor alloc] init];
        self.posts = [[NSArray alloc] init];
    }
    
    return self;
}

- (void)usingInteactor:(id<Interactor>)inteactor {
    self.inteactor = inteactor;
}

- (void)refreshData {
    void (^OnDataComplete)(NSDictionary *) = ^(NSDictionary *responnse) {
        NSMutableArray *posts = [[NSMutableArray alloc] init];
        for (id post in responnse[@"posts"]) {
            NSString *image_content = post[@"image_content"];
            [posts addObject:image_content];
            NSLog(@"%@\n", image_content);
        }
        self.posts = posts;
        [self.delegate onDataDidLoad];
    };
    
    void (^OnDataError)(NSString *) = ^(NSString *errorMessage) {
        [self.delegate onDataDidLoadErrorWithMessage:errorMessage];
    };
    
    [self.inteactor getPostsWithComplete:OnDataComplete andError:OnDataError];
}

- (NSInteger)numberOfPosts {
    return self.posts.count;
}

- (NSString *)cellTypeForIndex:(NSInteger)index {
    return @"feed-cell";
}

- (NSString *)imageFromAssetPathForIndex:(NSInteger)index {
    return self.posts[index];
}

@end
