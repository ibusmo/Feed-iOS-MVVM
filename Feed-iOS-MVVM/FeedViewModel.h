//
//  FeedViewModel.h
//  Feed-iOS-MVVM
//
//  Created by Omsub Sukkhee on 4/28/17.
//  Copyright © 2017 omsub. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "Interactor.h"
#import "FeedViewModelDelegate.h"

@interface FeedViewModel : NSObject

- (instancetype)initWithDelegate:(id<FeedViewModelDelegate>)delegate;
- (void)usingInteactor:(id<Interactor>)inteactor;

- (void)refreshData;

- (NSInteger)numberOfPosts;
- (NSString *)cellTypeForIndex:(NSInteger)index;
- (NSString *)imageFromAssetPathForIndex:(NSInteger)index;

@end
