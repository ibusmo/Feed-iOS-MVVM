//
//  FeedViewModelDelegate.h
//  Feed-iOS-MVVM
//
//  Created by Omsub Sukkhee on 4/28/17.
//  Copyright © 2017 omsub. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol FeedViewModelDelegate <NSObject>

- (void)onDataDidLoad;
- (void)onDataDidLoadErrorWithMessage:(NSString *)errorMessage;

@end
