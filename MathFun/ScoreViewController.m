//
//  ScoreViewController.m
//  MathFun
//
//  Created by Chun-Da Jimmy Chen on 12/6/26.
//  Copyright (c) 2012年 chundachen1230@gmail.com. All rights reserved.
//

#import "ScoreViewController.h"
#import "PlayViewController.h"

@interface ScoreViewController ()

@end

@implementation ScoreViewController
@synthesize nameTextField;
@synthesize firstName;
@synthesize firstScore;

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
    PlayViewController *playPage = [[PlayViewController alloc] initWithNibName:nil bundle:nil];
    NSLog(@"pass value here is %@", passedValue);
    NSLog(@"score is %@", playPage.correctNum.text);
    firstScore.text = playPage.correctNum.text;

    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [self setNameTextField:nil];
    [self setFirstName:nil];
    [self setFirstScore:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction) textFieldDoneEditing: (id)sender {
    [sender resignFirstResponder];
    firstName.text = nameTextField.text;
}

- (IBAction)backgroundTap:(id)sender{
    [firstName resignFirstResponder];
}

@end
