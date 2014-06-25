//
//  Key.h
//  extentionKeyboard
//
//  Created by swift on 6/23/14.
//  Copyright (c) 2014 swift. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GestureProtocol.h"

@interface CZ_Key : UIView

@property (strong, nonatomic) NSString *content;
@property (weak, nonatomic) UIButton *coverButton;
@property (strong, nonatomic) UITapGestureRecognizer *tapGesture;
@property (weak, nonatomic) id <GestureProtocol> delegate;

@end
