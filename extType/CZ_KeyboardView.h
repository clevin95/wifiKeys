//
//  CZ_KeyboardView.h
//  extentionKeyboard
//
//  Created by swift on 6/24/14.
//  Copyright (c) 2014 swift. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CZ_Key.h"

@interface CZ_KeyboardView : UIView


@property (strong, nonatomic) IBOutletCollection(CZ_Key) NSArray *letterKeys;

@property (weak, nonatomic) NSMutableArray *allKeysArray;

@end
