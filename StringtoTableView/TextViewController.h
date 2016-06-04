//
//  TextViewController.h
//  StringtoTableView
//
//  Created by hakozaki on 2014/12/29.
//  Copyright (c) 2014年 hakozaki. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModelManager.h"
#import "ToDoDataWrapper.h"

@interface TextViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *ToDoTextField;
@property  (nonatomic) ToDoDataWrapper *wrapper;

@end
