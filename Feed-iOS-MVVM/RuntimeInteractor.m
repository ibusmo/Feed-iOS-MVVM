//
//  RuntimeInteractor.m
//  Feed-iOS-MVVM
//
//  Created by Cpt. Omsub Sukkhee on 4/28/17.
//  Copyright © 2017 omsub. All rights reserved.
//

#import "RuntimeInteractor.h"

@implementation RuntimeInteractor

- (void)getPostsWithComplete:(OnDataComplete)completion andError:(OnDataError)error {
    NSError *errorReturn;
    
    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"posts" ofType:@"json"];
    if(!jsonPath){
        error(@"Cannot find word collections file.");
        return;
    }
    
    NSData *jsonData = [NSData dataWithContentsOfFile:jsonPath];
    if(!jsonData){
        error(@"Cannot load word collections file.");
        return;
    }
    
    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&errorReturn];
    if(errorReturn){
        error(@"Word collections file might be corrupted.");
    }else{
        completion(jsonDict);
    }
}

@end
