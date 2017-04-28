//
//  FeedViewModel.h
//  Feed-iOS-MVVM
//
//  Created by Omsub Sukkhee on 4/28/17.
//  Copyright © 2017 omsub. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "FeedViewModelDelegate.h"

@interface FeedViewModel : NSObject

- (instancetype)initWithDelegate:(id<FeedViewModelDelegate>)delegate;

- (void)refreshData;

- (NSInteger)numberOfPosts;
- (NSInteger)rowsPerPost:(NSInteger)index;
- (NSString *)cellTypeForIndex:(NSInteger)index;

@end
