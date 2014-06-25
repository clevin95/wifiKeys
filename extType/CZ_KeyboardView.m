//
//  CZ_KeyboardView.m
//  extentionKeyboard
//
//  Created by swift on 6/24/14.
//  Copyright (c) 2014 swift. All rights reserved.
//

#import "CZ_KeyboardView.h"

@implementation CZ_KeyboardView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initializeKeys];
    }
    return self;
}

-(void)awakeFromNib
{
    [self initializeKeys];
}

- (void)initializeKeys
{
    NSArray *alphabet = @[@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z"];
    NSInteger alphCount = 0;
    for (CZ_Key *key in self.letterKeys) {
        if (alphCount < [alphabet count]){
            key.content = alphabet[alphCount];
        }
        alphCount ++;
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/


/*

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
 */

@end
