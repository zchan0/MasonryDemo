//
//  MovieTableViewCell.h
//  Demo
//
//  Created by Cencen Zheng on 2018/6/15.
//  Copyright © 2018 Cencen Zheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Movie;

@interface MovieTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView *posterImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *releaseDateLabel;
@property (nonatomic, strong) UILabel *votesLabel;
@property (nonatomic, strong) UITextView *overviewTextView;

- (void)configCellWithMovie: (Movie *)movie;

@end
