//
//  Key.m
//  extentionKeyboard
//
//  Created by swift on 6/23/14.
//  Copyright (c) 2014 swift. All rights reserved.
//

#import "CZ_Key.h"

@implementation CZ_Key




- (instancetype)initWithFrame:(CGRect)frame
{
    
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

-(instancetype)init
{
    self = [super init];
    if (self){
        
    }
    return self;
}

-(void)awakeFromNib
{
    [self setup];
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    static CGFloat cornerRadius = 5;
    CGRect keyRect = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    CGSize size = CGSizeMake(cornerRadius, cornerRadius);
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:keyRect byRoundingCorners:UIRectCornerAllCorners cornerRadii:size];
    [path addClip];
    [[UIColor whiteColor] setFill];
    UIRectFill(self.bounds);
    [[UIColor redColor] setStroke];
    [path stroke];
    UIButton *coverButton = [[UIButton alloc]init];
    [self addSubview:coverButton];
    [self drawLetter];
}

-(void)setup
{
    self.backgroundColor = nil;
    self.opaque = NO;
    self.contentMode = UIViewContentModeRedraw;
    self.tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(callTapped:)];
    [self.tapGesture setNumberOfTapsRequired:1];
    [self addGestureRecognizer:self.tapGesture];
}

-(void)callTapped:(id)sender
{
    [self.delegate tapped:sender];
}




-(void)drawLetter
{
    NSString *letter =  @"";
    if (self.content){
        letter = self.content;
    }

    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.alignment = NSTextAlignmentCenter;
    UIFont *letterFont = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    UIColor *letterColor = [UIColor blackColor];
    
    NSDictionary *attributesDictionary = @{NSFontAttributeName : letterFont, NSParagraphStyleAttributeName:paragraphStyle, NSForegroundColorAttributeName : letterColor};
    NSAttributedString *stringToDraw = [[NSAttributedString alloc]initWithString:letter attributes:attributesDictionary];
    
    CGFloat letterHeight = stringToDraw.size.height;
    CGFloat yMiddle = (self.frame.size.height - letterHeight) / 2.0;
    CGRect letterBox = CGRectMake(0, yMiddle, self.bounds.size.width, self.bounds.size.height);
    [stringToDraw drawInRect:letterBox];
}

@end

