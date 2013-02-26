//
//  ScoreViewController.h
//  MathFun
//
//  Created by Chun-Da Jimmy Chen on 12/6/26.
//  Copyright (c) 2012年 chundachen1230@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayViewController.h"

@interface ScoreViewController : UIViewController{
    int firstScoreNum;
    NSString *passedValue;
}
@property (strong, nonatomic) IBOutlet UITextField *nameTextField;
@property (strong, nonatomic) IBOutlet UILabel *firstName;
@property (strong, nonatomic) IBOutlet UILabel *firstScore;

@end
