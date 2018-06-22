//
//  Movie.h
//  Demo
//
//  Created by Cencen Zheng on 2018/6/14.
//  Copyright © 2018 Cencen Zheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel/JSONModel.h>

@interface Movie : JSONModel

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *overview;
@property (nonatomic, copy) NSString *posterPath;
@property (nonatomic, copy) NSString *releaseDate;
@property (nonatomic, assign) double voteAverage;

@end
