//
//  MovieTableViewCell.m
//  Demo
//
//  Created by Cencen Zheng on 2018/6/15.
//  Copyright © 2018 Cencen Zheng. All rights reserved.
//

#import <AFNetworking/UIImageView+AFNetworking.h>
#import <Masonry.h>

#import "MovieTableViewCell.h"
#import "Movie.h"
#import "UIImage+Color.h"

static const NSInteger ImageWidth = 100;
static const NSInteger ImageHeight = 100;

@implementation MovieTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupViews];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)prepareForReuse {
    [super prepareForReuse];
    
    self.posterImageView.image = nil;
    self.titleLabel.text = nil;
    self.votesLabel.text = nil;
    self.releaseDateLabel.text = nil;
    self.overviewTextView.text = nil;
}

- (void)setupViews {
    _posterImageView = [[UIImageView alloc] init];
    _posterImageView.clipsToBounds = YES;
    _posterImageView.contentMode = UIViewContentModeScaleAspectFill;
    
    _titleLabel = [[UILabel alloc] init];
    
    _releaseDateLabel = [[UILabel alloc] init];
    
    _votesLabel = [[UILabel alloc] init];
    
    _overviewTextView = [[UITextView alloc] init];

    [self.contentView addSubview:_posterImageView];
    [self.contentView addSubview:_titleLabel];
    [self.contentView addSubview:_releaseDateLabel];
    [self.contentView addSubview:_votesLabel];
    [self.contentView addSubview:_overviewTextView];
    
    [self makeLayoutConstraints];
}

- (void)makeLayoutConstraints {
    [self.posterImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).with.offset(20);
        make.leading.equalTo(self.contentView.mas_leading).with.offset(15);
        make.size.equalTo(massi)
    }];
}

- (void)configCellWithMovie:(Movie *)movie {
    NSString *imageUrl = [NSString stringWithFormat:@"https://image.tmdb.org/t/p/w500%@", movie.posterPath];
    
    [self.posterImageView setImageWithURL:[NSURL URLWithString:imageUrl]
                         placeholderImage:[UIImage imageWithColor:[UIColor lightGrayColor] andSize:CGSizeMake(ImageWidth, ImageHeight)]];
    
    self.titleLabel.text = movie.title;
    self.releaseDateLabel.text = movie.releaseDate;
    self.votesLabel.text = [NSString stringWithFormat:@"%01f", movie.voteAverage];
    self.overviewTextView.text = movie.overview;
}

@end
