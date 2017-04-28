//
//  Interactor.h
//  Feed-iOS-MVVM
//
//  Created by Cpt. Omsub Sukkhee on 4/28/17.
//  Copyright © 2017 omsub. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^OnDataComplete)(NSDictionary *response);
typedef void (^OnDataError)(NSString *errorMessage);

@protocol Interactor <NSObject>

- (void)getPostsWithComplete:(OnDataComplete)completion andError:(OnDataError)error;

@end
