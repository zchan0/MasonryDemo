//
//  Movie.m
//  Demo
//
//  Created by Cencen Zheng on 2018/6/14.
//  Copyright © 2018 Cencen Zheng. All rights reserved.
//

#import "Movie.h"

@implementation Movie

+ (JSONKeyMapper *)keyMapper {
    return [JSONKeyMapper mapperForSnakeCase];
}

@end
