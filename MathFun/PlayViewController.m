//
//  PlayViewController.m
//  MathFun
//
//  Created by Chun-Da Jimmy Chen on 12/6/19.
//  Copyright (c) 2012年 chundachen1230@gmail.com. All rights reserved.
//

#import "PlayViewController.h"

@interface PlayViewController ()

@end

@implementation PlayViewController
@synthesize firstLabel;
@synthesize mathLabel;
@synthesize secondLabel;
@synthesize answerLabel;
@synthesize iconCorrect;
@synthesize iconWrong;
@synthesize totalNum;
@synthesize correctNum;
@synthesize backButtom;
@synthesize scoreBoard;
@synthesize plusLabel;
@synthesize minusLabel;
@synthesize timesLabel;
@synthesize divideLabel;
@synthesize oneLabel;
@synthesize twoLabel;
@synthesize threeLabel;
@synthesize fourLabel;
@synthesize fiveLabel;
@synthesize sixLabel;
@synthesize sevenLabel;
@synthesize eightLabel;
@synthesize nineLabel;
@synthesize zeroLabel;
@synthesize cancelLabel;
@synthesize backLabel;

bool firstLabelFlag = YES;
bool secondLabelFlag = NO;
bool algebraLabelFlag = NO;
bool played = NO;

int magicNumber;
int userInput, userInputDigit;
int level = 7;

int randomOne, randomTwo, algebra, answer, digit;
NSString *previous, *msgTitle, *msgContent;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    // object for score Page
    
    scoreBoard.hidden = YES;
    scoreBoard.enabled = NO;
    
    msgTitle = [NSString stringWithFormat:@"Ready to Play?"];
    msgContent = [NSString stringWithFormat:@"Try to answer as many questions correctly in 30 seconds!"];
    [self showAlert];
    magicNumber = 10;
    [self timer];
    [self play];
}

- (void)viewDidUnload
{
    [self setFirstLabel:nil];
    [self setMathLabel:nil];
    [self setSecondLabel:nil];
    [self setAnswerLabel:nil];
    [self setIconCorrect:nil];
    [self setIconWrong:nil];
    [self setCorrectNum:nil];
    [self setTotalNum:nil];
    [self setBackButtom:nil];
    [self setScoreBoard:nil];
    [self setPlusLabel:nil];
    [self setMinusLabel:nil];
    [self setTimesLabel:nil];
    [self setDivideLabel:nil];
    [self setOneLabel:nil];
    [self setTwoLabel:nil];
    [self setThreeLabel:nil];
    [self setFourLabel:nil];
    [self setFiveLabel:nil];
    [self setSixLabel:nil];
    [self setSevenLabel:nil];
    [self setEightLabel:nil];
    [self setNineLabel:nil];
    [self setZeroLabel:nil];
    [self setCancelLabel:nil];
    [self setBackLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(void)showAlert{
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:msgTitle
                          message:msgContent
                          delegate:self
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil];
    [alert show];
}

- (void)fadedin_Correct{
    [UIImageView beginAnimations:NULL context:nil];
    [UIImageView setAnimationDuration:0.7];
    [iconCorrect setAlpha:1];
    [UIImageView commitAnimations];
    [self fadedout_Correct];
}

- (void)fadedout_Correct{
    [UIImageView beginAnimations:NULL context:nil];
    [UIImageView setAnimationDuration:0.7];
    [iconCorrect setAlpha:0];
    [UIImageView commitAnimations];
}

- (void)fadedin_Wrong{
    [UIImageView beginAnimations:NULL context:nil];
    [UIImageView setAnimationDuration:0.7];
    [iconWrong setAlpha:1];
    [UIImageView commitAnimations];
    [self fadedout_Wrong];
}

- (void)fadedout_Wrong{
    [UIImageView beginAnimations:NULL context:nil];
    [UIImageView setAnimationDuration:0.7];
    [iconWrong setAlpha:0];
    [UIImageView commitAnimations];
}

- (void) initialize{
    userInput = 0;
    userInputDigit = 0;
    digit = 0;
    randomOne = 0;
    randomTwo = 0;
    algebra = 0;
    answer = 0;
    total++;
    totalNum.text = [NSString stringWithFormat:@"%i", total];
    backButtom.enabled = YES;
}

- (void) play{
    // initialize
    [self initialize];
    
    if ((correct % level == 0)&& (correct !=0)){
        magicNumber = magicNumber + 5;
    }
    
    // gives the first random number
    while (randomOne <= 0) {
        randomOne = (arc4random() % magicNumber)+1;
    }
    // gives the second random number
    while ((randomTwo <= 0) || (randomTwo < randomOne)){
        randomTwo = (arc4random() % magicNumber)+1;
    }
    // gives the random algebra assignment
    algebra = (arc4random() % 4);
    
    if (algebra == 1) {
        while (randomOne < randomTwo){
            randomTwo = (arc4random() % magicNumber)+1;
        }
    }
    
    // if symbol is devision, make sure random1 is multiplies of random2 
    if (algebra == 3) {
        if ([self isPrime]) {
            while ([self isPrime]) {
                randomOne = (arc4random() % magicNumber)+1;
            }
        }
        while ((randomOne % randomTwo) != 0){
            randomOne++;
        }
    }
        
    [self filling];
    [self digiting];
    [self showing];
    // display on screen
    switch (algebra) {
        case 0:
            answer = randomOne + randomTwo;
            mathLabel.image = [UIImage imageNamed:@"plus.png"];
            answerLabel.text = [NSString stringWithFormat:@"%i", answer];
            break;
        case 1:
            answer = randomOne - randomTwo;
            mathLabel.image = [UIImage imageNamed:@"minus.png"];
            answerLabel.text = [NSString stringWithFormat:@"%i", answer];
            break;
        case 2:
            answer = randomOne * randomTwo;
            mathLabel.image = [UIImage imageNamed:@"times.png"];
            answerLabel.text = [NSString stringWithFormat:@"%i", answer];
            break;
        case 3:
            answer = randomOne / randomTwo;
            mathLabel.image = [UIImage imageNamed:@"divide.png"];
            answerLabel.text = [NSString stringWithFormat:@"%i", answer];
            break;
        default:
            break;
    }
    if (algebraLabelFlag) {
        mathLabel.image = NULL;
    }
}

- (BOOL) isPrime{
    int i;
    double d; // variable to store the division and hold the decimals
    int x;  // variable to help check if a division had decimals
    
    if( randomOne <= 1) return YES; 
    for(i = 2; i != randomOne; ++i){ // 'i' must start at 2        
        d = randomOne/i;
        x = d;  // and integer cannot hold decimals
        
        if(d == x) return NO;    // if d and x are equal, then it can't be a prime
    }
    return YES;
}

- (void) filling{
    // decide if userInput will be firstLabel or secondLabel
    // if the firstLabel is yes, meaning it shows on the screen
    // if no, userInput will be shown
    if ((correct % 3) == 0){
        firstLabelFlag = YES;
        secondLabelFlag = NO;
        algebraLabelFlag = NO;
    }else if ((correct % 3) == 1) {
        firstLabelFlag = NO;
        secondLabelFlag = YES;
        algebraLabelFlag = NO;
    }else if ((correct % 3) == 2) {
        firstLabelFlag = NO;
        secondLabelFlag = NO;
        algebraLabelFlag = YES;
    }
}

- (void) showing{
    if (firstLabelFlag) {
        firstLabel.text = [NSString stringWithFormat:@""];
        secondLabel.text = [NSString stringWithFormat:@"%i", randomTwo];
    }
    else if (secondLabelFlag) {
        firstLabel.text = [NSString stringWithFormat:@"%i", randomOne];
        secondLabel.text = [NSString stringWithFormat:@""];
    }else{
        firstLabel.text = [NSString stringWithFormat:@"%i", randomOne];
        secondLabel.text = [NSString stringWithFormat:@"%i", randomTwo];
    }
    if(!algebraLabelFlag){
        mathLabel.image = NULL;
    }

}

- (void) digiting{
    
    if (algebraLabelFlag) {
        digit = 1;
        return;
    }
    
    int temp;
    if (firstLabelFlag){
        temp = randomOne;
    }else if(secondLabelFlag){
        temp = randomTwo;
    }
    for (digit = 0 ; temp > 0; digit++) {
        temp = temp / 10;
    }
}

- (void) digitfulfill{
    // user entered enough digit for answer
    if (userInputDigit == digit){
        if (firstLabelFlag) {
            if (userInput == randomOne){
                correct++;
                correctNum.text = [NSString stringWithFormat:@"%i", correct];
                [self fadedin_Correct];
            }
            else {
                [self iconWrong];
            }
        }
        else if (secondLabelFlag) {
            if (userInput == randomTwo) {
                correct++;
                correctNum.text = [NSString stringWithFormat:@"%i", correct];
                [self fadedin_Correct];
            }
            else {
                [self iconWrong];
            }
        }
        else if(algebraLabelFlag){
            if(userInput == algebra){
                correct++;
                correctNum.text = [NSString stringWithFormat:@"%i", correct];
                [self fadedin_Correct];
            }
            else {
                [self iconWrong];
            }
        }
        // refresh and begin another question. 
        [self performSelector:@selector(play) withObject:nil afterDelay:0.8];
    }
}

- (void) countdown{
    timesecond.text = [NSString stringWithFormat:@"%i", mainInt];
    mainInt -=1;
    
    if (mainInt == -1) {
        played = YES;
        timesecond.hidden = YES;
        
        // checking for highscore replacement
/*        if ((int)scorePage.firstScore.text < correct) {
            NSLog(@"inside");
            NSLog(@"%i", (int)scorePage.firstScore.text);
            NSLog(@"%i", correct);
            //scorePage.firstScore.text = [NSString stringWithFormat:@"%i", correct];
            //scorePage.firstScore.enabled = YES;
            NSLog(@"After assigned%i", (int)scorePage.firstScore.text);
            
        }        
        */
        msgTitle = [NSString stringWithFormat:@"Time's UP!"];
        msgContent = [NSString  stringWithFormat:@"Let's see how you did!"];
        [self showAlert];
        [self disAbleButton];
    }
}

- (void) disAbleButton{
    scoreBoard.hidden = NO;
    scoreBoard.enabled = YES;
    plusLabel.enabled = NO;
    minusLabel.enabled = NO;
    timesLabel.enabled = NO;
    divideLabel.enabled = NO;
    oneLabel.enabled = NO;
    twoLabel.enabled = NO;
    threeLabel.enabled = NO;
    fourLabel.enabled = NO;
    fiveLabel.enabled = NO;
    sixLabel.enabled = NO;
    sevenLabel.enabled = NO;
    eightLabel.enabled = NO;
    nineLabel.enabled = NO;
    cancelLabel.enabled = NO;
    backLabel.enabled = NO;
}

- (void) timer{
    // timer time
    mainInt = 30;
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(countdown) userInfo:nil repeats:YES];
}

- (IBAction)scoreBoardPage:(id)sender {
//    [self presentModalViewController:scorePage animated:YES];
    //ViewController *aboutPage = [[ViewController alloc] initWithNibName:nil bundle:nil];
    //[self presentModalViewController:aboutPage animated:YES];
}

- (IBAction)plus:(id)sender {
    mathLabel.image = [UIImage imageNamed:@"plus.png"];
    userInput = 0;
    userInputDigit++;
    [self digitfulfill];
}

- (IBAction)minus:(id)sender {
    mathLabel.image = [UIImage imageNamed:@"minus.png"];
    userInput = 1;
    userInputDigit++;
    [self digitfulfill];
}

- (IBAction)multiply:(id)sender {
    mathLabel.image = [UIImage imageNamed:@"times.png"];
    userInput = 2;
    userInputDigit++;
    [self digitfulfill];
}

- (IBAction)divide:(id)sender {
    mathLabel.image = [UIImage imageNamed:@"divide.png"];
    userInput = 3;
    userInputDigit++;
    [self digitfulfill];
}

- (IBAction)buttonOne:(id)sender {
    if (firstLabelFlag) {
        firstLabel.text = [firstLabel.text stringByAppendingString:@"1"];
    }else if(secondLabelFlag){
        secondLabel.text = [secondLabel.text stringByAppendingString:@"1"];
    }else if(algebraLabelFlag){
        return;
    }
    userInput = userInput*10 +1;
    userInputDigit++;
    [self digitfulfill];
}

- (IBAction)buttonTwo:(id)sender {
    if (firstLabelFlag) {
        firstLabel.text = [firstLabel.text stringByAppendingString:@"2"];
    }else if(secondLabelFlag){
        secondLabel.text = [secondLabel.text stringByAppendingString:@"2"];
    }else if(algebraLabelFlag){
        return;
    }
    userInput = userInput*10 +2;
    userInputDigit++;
    [self digitfulfill];
}

- (IBAction)buttonThree:(id)sender {
    if (firstLabelFlag) {
        firstLabel.text = [firstLabel.text stringByAppendingString:@"3"];
    }else if(secondLabelFlag){
        secondLabel.text = [secondLabel.text stringByAppendingString:@"3"];
    }else if(algebraLabelFlag){
        return;
    }
    userInput = userInput*10 +3;
    userInputDigit++;
    [self digitfulfill];
}

- (IBAction)buttonFour:(id)sender {
    if (firstLabelFlag) {
        firstLabel.text = [firstLabel.text stringByAppendingString:@"4"];
    }else if(secondLabelFlag){
        secondLabel.text = [secondLabel.text stringByAppendingString:@"4"];
    }else if(algebraLabelFlag){
        return;
    }
    userInput = userInput*10 +4;
    userInputDigit++;
    [self digitfulfill];
}

- (IBAction)buttonFive:(id)sender {
    if (firstLabelFlag) {
        firstLabel.text = [firstLabel.text stringByAppendingString:@"5"];
    }else if(secondLabelFlag){
        secondLabel.text = [secondLabel.text stringByAppendingString:@"5"];
    }else if(algebraLabelFlag){
        return;
    }
    userInput = userInput*10 +5;
    userInputDigit++;
    [self digitfulfill];
}

- (IBAction)buttonSix:(id)sender {
    if (firstLabelFlag) {
        firstLabel.text = [firstLabel.text stringByAppendingString:@"6"];
    }else if(secondLabelFlag){
        secondLabel.text = [secondLabel.text stringByAppendingString:@"6"];
    }else if(algebraLabelFlag){
        return;
    }
    userInput = userInput*10 +6;
    userInputDigit++;
    [self digitfulfill];
}

- (IBAction)buttonSeven:(id)sender {
    if (firstLabelFlag) {
        firstLabel.text = [firstLabel.text stringByAppendingString:@"7"];
    }else if(secondLabelFlag){
        secondLabel.text = [secondLabel.text stringByAppendingString:@"7"];
    }else if(algebraLabelFlag){
        return;
    }
    userInput = userInput*10 +7;
    userInputDigit++;
    [self digitfulfill];
}

- (IBAction)buttonEight:(id)sender {
    if (firstLabelFlag) {
        firstLabel.text = [firstLabel.text stringByAppendingString:@"8"];
    }else if(secondLabelFlag){
        secondLabel.text = [secondLabel.text stringByAppendingString:@"8"];
    }else if(algebraLabelFlag){
        return;
    }
    userInput = userInput*10 +8;
    userInputDigit++;
    [self digitfulfill];
}

- (IBAction)buttonNine:(id)sender {
    if (firstLabelFlag) {
        firstLabel.text = [firstLabel.text stringByAppendingString:@"9"];
    }else if(secondLabelFlag){
        secondLabel.text = [secondLabel.text stringByAppendingString:@"9"];
    }else if(algebraLabelFlag){
        return;
    }
    userInput = userInput*10 +9;
    userInputDigit++;
    [self digitfulfill];
}

- (IBAction)buttonZero:(id)sender {
    if (firstLabelFlag) {
        firstLabel.text = [firstLabel.text stringByAppendingString:@"0"];
    }else if(secondLabelFlag){
        secondLabel.text = [secondLabel.text stringByAppendingString:@"0"];
    }else if(algebraLabelFlag){
        return;
    }
    userInput = userInput*10 +0;
    userInputDigit++;
    [self digitfulfill];
}

- (IBAction)buttonCancel:(id)sender {
    if (firstLabelFlag) {
        firstLabel.text = [NSString stringWithFormat:@""];
        
    }else if(secondLabelFlag){
        secondLabel.text = [NSString stringWithFormat:@""];
    }else if(algebraLabelFlag){
        return;
    }
    userInput = 0;
    userInputDigit = 0;
}

- (IBAction)buttonBack:(id)sender {
    if(firstLabelFlag){
        firstLabel.text = previous;
    }
    else if(secondLabelFlag){
        secondLabel.text = previous;
    }
    backButtom.enabled = NO;
}
@end
