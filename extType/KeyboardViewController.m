//
//  KeyboardViewController.m
//  extType
//
//  Created by swift on 6/22/14.
//  Copyright (c) 2014 swift. All rights reserved.
//

#import "KeyboardViewController.h"
#import "CZ_Key.h"

#define CGRectSetPos( r, x, y ) CGRectMake( x, y, r.size.width, r.size.height )

@interface KeyboardViewController () <UIGestureRecognizerDelegate>
@property (nonatomic, strong) UIButton *nextKeyboardButton;
@property (nonatomic, strong) UIButton *aButton;
@property (strong, nonatomic) NSArray *alphabet;
@property (strong, nonatomic) NSMutableArray *allKeys;

@end

@implementation KeyboardViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.alphabet = @[@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M"];
        self.allKeys = [[NSMutableArray alloc]init];
    }
    return self;
}

- (void)updateViewConstraints {
    [super updateViewConstraints];
    
    // Add custom view sizing constraints here
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Perform custom UI setup here
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
    [self createKeys];
    self.inputView.backgroundColor = [[UIColor alloc]initWithRed:10.0 green:50 blue:100 alpha:0.3];
}

- (void)createKeys
{
    CGFloat position = 0;
    for (NSString *letter in self.alphabet){
        CZ_Key *keyView = [[CZ_Key alloc]initWithFrame:CGRectMake(position, 40, 50, 30)];
        position += 50;
        keyView.content = letter;
        //[aButton setTitle:@"B" forState:UIControlStateNormal];
        //aButton.titleLabel.text = @"A";
        //aButton.layer.borderWidth = 1;
        //aButton.layer.borderColor = [UIColor redColor].CGColor;
        [self.view addSubview:keyView];
        UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapped:)];
        [tapRecognizer setNumberOfTapsRequired:1];
        [tapRecognizer setDelegate:self];
        [keyView addGestureRecognizer:tapRecognizer];
        [self.allKeys addObject:keyView];
    }
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


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated
}

- (void)textWillChange:(id<UITextInput>)textInput {
    // The app is about to change the document's contents. Perform any preparation here.
}

- (void)textDidChange:(id<UITextInput>)textInput {
    // The app has just changed the document's contents, the document context has been updated.
    
    UIColor *textColor = nil;
    if (self.textDocumentProxy.keyboardAppearance == UIKeyboardAppearanceDark) {
        textColor = [UIColor whiteColor];
    } else {
        textColor = [UIColor blackColor];
    }
    [self.nextKeyboardButton setTitleColor:textColor forState:UIControlStateNormal];
}






/*
- (BOOL)hasColided:(Key *)firstCircle
              with:(Key *)secondCircle
{
    CGFloat radiusFirstCircle;
    CGFloat radiusSecondCircle;
    CGFloat distance;
    do {
        CGFloat radiusFirstCircle = (firstCircle.frame.size.width / 2);
        CGFloat radiusSecondCircle = (secondCircle.frame.size.width / 2);
        
        CGFloat xFirstCircle = (firstCircle.frame.origin.x + radiusFirstCircle);
        CGFloat yFirstCircle = (firstCircle.frame.origin.y + radiusFirstCircle);
        
        CGFloat xSecondCircle = (secondCircle.frame.origin.x + radiusSecondCircle);
        CGFloat ySecondCircle = (secondCircle.frame.origin.y + radiusSecondCircle);
        
        CGFloat xdifference = (xFirstCircle - xSecondCircle);
        CGFloat ydifference = (yFirstCircle - ySecondCircle);
        CGFloat distance = sqrtf(powf(xdifference,2) + powf(ydifference, 2));
        if ((distance < (radiusFirstCircle + radiusSecondCircle))){
            firstCircle.frame = CGRectMake(firstCircle.frame.origin.x + 1, firstCircle.frame.origin.y, firstCircle.frame.size.width, firstCircle.frame.size.height);
        }
    } while (distance < (radiusFirstCircle + radiusSecondCircle));
    
    return YES;
}

- (void)repositionKeys
{
    for (Key *firstKey in self.allKeys){
        for (Key *collisionKey in self.allKeys){
            if (![firstKey isEqual:collisionKey]){
                // if ([self hasColided:firstKey with:collisionKey]){
                
                // }
            }
        }
    }
}
*/
@end
