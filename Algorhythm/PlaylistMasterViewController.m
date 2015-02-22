//
//  ViewController.m
//  Algorhythm
//
//  Created by Philip Brown on 17/02/2015.
//  Copyright (c) 2015 Yellow Flag. All rights reserved.
//

#import "PlaylistMasterViewController.h"
#import "PlaylistDetailViewController.h"
#import "Playlist.h"

@interface PlaylistMasterViewController ()

@end

@implementation PlaylistMasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    for (NSUInteger index = 0; index < self.playlistImageViews.count; index++) {
        Playlist *playlist = [[Playlist alloc] initWithIndex:index];
        
        UIImageView *playlistImageView = self.playlistImageViews[index];
        playlistImageView.image = playlist.playlistIcon;
        playlistImageView.backgroundColor = playlist.backgroundColor;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    UIImageView *playlistImageView = (UIImageView *)[sender view];
    
    if ([self.playlistImageViews containsObject:playlistImageView]) {
        NSUInteger index = [self.playlistImageViews indexOfObject:playlistImageView];

        if ([segue.identifier isEqual: @"showPlaylistDetail"]) {
            PlaylistDetailViewController *playlistDetailController = (PlaylistDetailViewController *)segue.destinationViewController;
            playlistDetailController.playlist = [[Playlist alloc] initWithIndex:index];
        }
    }
}
- (IBAction)showPlaylistDetail:(id)sender {
    [self performSegueWithIdentifier:@"showPlaylistDetail" sender:sender];
}

@end
