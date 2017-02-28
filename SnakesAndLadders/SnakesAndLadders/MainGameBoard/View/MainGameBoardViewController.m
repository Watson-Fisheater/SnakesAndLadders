//
//  MainGameBoardViewController.m
//  SnakesAndLadders
//
//  Created by Wang Sen on 26/2/17.
//  Copyright © 2017 Watson. All rights reserved.
//

#import "MainGameBoardViewController.h"
#import "CharactorView.h"
#import "GameBoardCalculationModel.h"

@interface MainGameBoardViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *gameBoardView;

@property (retain, nonatomic) CharactorView *player1;
@property (retain, nonatomic) CharactorView *player2;

@end

@implementation MainGameBoardViewController
{
    CGRect gameBoardViewRect;
    GameBoardCalculationModel *gameBoard;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    gameBoardViewRect = self.gameBoardView.frame;
    NSLog(@"(%lf, %lf, %lf, %lf)", gameBoardViewRect.origin.x, gameBoardViewRect.origin.y, gameBoardViewRect.size.width, gameBoardViewRect.size.height );
    gameBoard = [GameBoardCalculationModel sharedInstance:self.gameBoardView.frame];
    
    [self initPlayers];
}

-(void)initPlayers
{
    self.player1 = [[CharactorView alloc] initWithFrame:CGRectNull];
//    self.player1 = [[CharactorView alloc] initWithCenter:CGPointMake(gameBoardViewRect.origin.x, gameBoardViewRect.origin.y)];
    
    [self.view addSubview:self.player1];
//    [self.view addSubview:self.player2];
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
- (IBAction)testingGo:(id)sender {
    int diceResult = 5;
    [self.player1 moveToStep:(self.player1.charactorModel.currentStep + diceResult) bonusType:BonusTypeNone duration:2];
}
- (IBAction)testingLadderUp:(id)sender {
    [self.player1 moveToStep:(self.player1.charactorModel.currentStep + 18) bonusType:BonusTypeLadderUp duration:2];
}
- (IBAction)testingSnakeDown:(id)sender {
    [self.player1 moveToStep:(self.player1.charactorModel.currentStep - 12) bonusType:BonusTypeSnakeDown duration:2];
}

@end
