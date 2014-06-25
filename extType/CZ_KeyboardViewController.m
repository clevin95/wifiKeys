//
//  CZ_KeyboardViewController.m
//  extentionKeyboard
//
//  Created by swift on 6/24/14.
//  Copyright (c) 2014 swift. All rights reserved.
//

#import "CZ_KeyboardViewController.h"
#import "CZ_Key.h"
#import "CZ_KeyboardView.h"
#import "GestureProtocol.h"

@interface CZ_KeyboardViewController () <UIGestureRecognizerDelegate, GestureProtocol>

@property (nonatomic, strong) UIButton *nextKeyboardButton;
@property (strong, nonatomic) NSArray *alphabet;
@property (strong, nonatomic) NSMutableArray *allKeys;
@property (strong, nonatomic) CZ_KeyboardView *keyboardView;

@end

@implementation CZ_KeyboardViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.alphabet = @[@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M"];
        self.allKeys = [[NSMutableArray alloc]init];
        //self.keyboardView = [[CZ_KeyboardView alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"CZ_KeyboardViewController" owner:self options:nil];
    self.keyboardView = (CZ_KeyboardView *)[array objectAtIndex:0];

    /*
    self.nextKeyboardButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.nextKeyboardButton setTitle:NSLocalizedString(@"NEXT", @"Title for 'Next Keyboard' button") forState:UIControlStateNormal];
    [self.nextKeyboardButton sizeToFit];
    self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.nextKeyboardButton.layer.borderWidth = 1;
    self.nextKeyboardButton.layer.borderColor = ([UIColor redColor]).CGColor;
    [self.nextKeyboardButton addTarget:self action:@selector(advanceToNextInputMode) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.nextKeyboardButton];
    NSLayoutConstraint *nextKeyboardButtonLeftSideConstraint = [NSLayoutConstraint constraintWithItem:self.nextKeyboardButton attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0.0];
    NSLayoutConstraint *nextKeyboardButtonBottomConstraint = [NSLayoutConstraint constraintWithItem:self.nextKeyboardButton attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.8];
    [self.view addConstraints:@[nextKeyboardButtonLeftSideConstraint, nextKeyboardButtonBottomConstraint]];
    */
    
   // self.keyboardView.AButton.delegate = self;
    //[self.keyboardView.AButton.tapGesture addTarget:self action:@selector(tapped:)];
    
    
    self.inputView.backgroundColor = [[UIColor alloc]initWithRed:10.0 green:50 blue:100 alpha:1];
    [self setupKeys];
    // Do any additional setup after loading the view from its nib.
}


- (void)setupKeys
{
    for (CZ_Key *key in self.keyboardView.letterKeys){
        key.delegate = self;
    }
}

- (void)createKeyboard
{
    UIButton *testButton = [[UIButton alloc]init];
    testButton.layer.backgroundColor = [UIColor purpleColor].CGColor;
    testButton.layer.frame = CGRectMake(10, 10, 10, 10);
    //self.keyboardView.layer.backgroundColor = [UIColor redColor].CGColor;
    self.keyboardView.layer.borderWidth = 5;
    self.keyboardView.layer.borderColor = [UIColor orangeColor].CGColor;
    [self.keyboardView addSubview:testButton];
    CGRect keyboardFrame = CGRectMake(0, 0, 320, 219);
    self.keyboardView.frame = keyboardFrame;
}





- (void)tapped:(UITapGestureRecognizer *)sender
{
    NSString *textToAdd = @"";
    if ([sender.view isKindOfClass:[CZ_Key class]]){
        CZ_Key *tappedKey = (CZ_Key *)sender.view;
        textToAdd = tappedKey.content;
    }
    [self.textDocumentProxy insertText:textToAdd];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
