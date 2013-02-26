//
//  PlayViewController.h
//  MathFun
//
//  Created by Chun-Da Jimmy Chen on 12/6/19.
//  Copyright (c) 2012年 chundachen1230@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayViewController : UIViewController{
    IBOutlet UILabel *timesecond;
    NSTimer *timer;
    int mainInt;
    int passValue;
    int correct, total;

}
@property (strong, nonatomic) IBOutlet UILabel *firstLabel;
@property (strong, nonatomic) IBOutlet UIImageView *mathLabel;
@property (strong, nonatomic) IBOutlet UILabel *secondLabel;
@property (strong, nonatomic) IBOutlet UILabel *answerLabel;
@property (strong, nonatomic) IBOutlet UIImageView *iconCorrect;
@property (strong, nonatomic) IBOutlet UIImageView *iconWrong;
@property (strong, nonatomic) IBOutlet UILabel *totalNum;
@property (strong, nonatomic) IBOutlet UILabel *correctNum;
@property (strong, nonatomic) IBOutlet UIButton *backButtom;
@property (strong, nonatomic) IBOutlet UIButton *scoreBoard;
@property (strong, nonatomic) IBOutlet UIButton *plusLabel;
@property (strong, nonatomic) IBOutlet UIButton *minusLabel;
@property (strong, nonatomic) IBOutlet UIButton *timesLabel;
@property (strong, nonatomic) IBOutlet UIButton *divideLabel;
@property (strong, nonatomic) IBOutlet UIButton *oneLabel;
@property (strong, nonatomic) IBOutlet UIButton *twoLabel;
@property (strong, nonatomic) IBOutlet UIButton *threeLabel;
@property (strong, nonatomic) IBOutlet UIButton *fourLabel;
@property (strong, nonatomic) IBOutlet UIButton *fiveLabel;
@property (strong, nonatomic) IBOutlet UIButton *sixLabel;
@property (strong, nonatomic) IBOutlet UIButton *sevenLabel;
@property (strong, nonatomic) IBOutlet UIButton *eightLabel;
@property (strong, nonatomic) IBOutlet UIButton *nineLabel;
@property (strong, nonatomic) IBOutlet UIButton *zeroLabel;
@property (strong, nonatomic) IBOutlet UIButton *cancelLabel;
@property (strong, nonatomic) IBOutlet UIButton *backLabel;

- (IBAction)plus:(id)sender;
- (IBAction)minus:(id)sender;
- (IBAction)multiply:(id)sender;
- (IBAction)divide:(id)sender;
- (IBAction)buttonOne:(id)sender;
- (IBAction)buttonTwo:(id)sender;
- (IBAction)buttonThree:(id)sender;
- (IBAction)buttonFour:(id)sender;
- (IBAction)buttonFive:(id)sender;
- (IBAction)buttonSix:(id)sender;
- (IBAction)buttonSeven:(id)sender;
- (IBAction)buttonEight:(id)sender;
- (IBAction)buttonNine:(id)sender;
- (IBAction)buttonZero:(id)sender;
- (IBAction)buttonCancel:(id)sender;
- (IBAction)buttonBack:(id)sender;

@end
