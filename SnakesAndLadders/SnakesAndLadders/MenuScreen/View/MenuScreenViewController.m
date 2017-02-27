//
//  MenuScreenViewController.m
//  SnakesAndLadders
//
//  Created by Wang Sen on 25/2/17.
//  Copyright © 2017 Watson. All rights reserved.
//

#import "MenuScreenViewController.h"
#import "MainGameBoardViewController.h"

@interface MenuScreenViewController ()

@end

@implementation MenuScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)turnOnOrOffSound:(id)sender {
}
- (IBAction)singlePlayerGame:(id)sender {
    MainGameBoardViewController *mainGameVC = [[MainGameBoardViewController alloc] initWithNibName:@"MainGameBoardViewController" bundle:nil];
    [self presentViewController:mainGameVC animated:YES completion:nil];
}
- (IBAction)twoPlayersGame:(id)sender {
}

@end
