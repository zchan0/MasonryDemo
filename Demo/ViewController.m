//
//  ViewController.m
//  Demo
//
//  Created by Cencen Zheng on 2018/6/14.
//  Copyright © 2018 Cencen Zheng. All rights reserved.
//

#import "ViewController.h"
#import "MovieViewModel.h"
#import "Movie.h"

@interface ViewController ()

@property (nonatomic, strong) MovieViewModel *viewModel;
@property (nonatomic, copy) NSMutableArray<Movie*> *playingMovies;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    [self configUI];
    [self loadData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)configUI {
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"Demo";
}

- (void)loadData {
    [self.viewModel retrieveNowPlayingMoviesForDay:@"2018-06-14" withCompletion:^(BOOL success, NSArray* _Nullable results) {
        if (success) {
            for (NSDictionary *result in results) {
                NSError *err;
                Movie *movie = [[Movie alloc] initWithDictionary:result error: &err];
                [self.playingMovies addObject:movie];
            }
        }
    }];
}

- (MovieViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[MovieViewModel alloc] init];
    }
    return _viewModel;
}

- (NSMutableArray<Movie*> *) playingMovies {
    if (!_playingMovies) {
        _playingMovies = [NSMutableArray array];
    }
    return _playingMovies;
}

@end
