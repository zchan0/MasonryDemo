//
//  MovieViewModel.h
//  Demo
//
//  Created by Cencen Zheng on 2018/6/14.
//  Copyright © 2018 Cencen Zheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Movie;

@interface MovieViewModel : NSObject

typedef void (^CallBack)(BOOL success,  NSArray* _Nullable results);

- (void)retrieveNowPlayingMoviesForDay: (NSString *)date withCompletion: (CallBack)completion;

@end
