//
//  MovieViewModel.m
//  Demo
//
//  Created by Cencen Zheng on 2018/6/14.
//  Copyright © 2018 Cencen Zheng. All rights reserved.
//

#import <AFNetworking.h>

#import "MovieViewModel.h"
#import "Movie.h"

@implementation MovieViewModel

/**
 - date: 2018-06-14
*/
- (void)retrieveNowPlayingMoviesForDay: (NSString *)date withCompletion: (CallBack)completion {
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:config];
    
    NSString *url = @"https://api.themoviedb.org/3/discover/movie?api_key=9b0b80790d390fcc8efd22d8db5d4b72";
    NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:@"%@&primary_release_date.lte=%@", url, date]];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request
                                                   uploadProgress:nil
                                                 downloadProgress:nil
                                                completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
                                                    if (error) {
                                                        NSLog(@"Error: %@", error);
                                                        completion(NO, nil);
                                                    } else {
                                                        NSArray *results = responseObject[@"results"];
                                                        completion(YES, results);
                                                    }
                                    }];
    [dataTask resume];
}



@end
