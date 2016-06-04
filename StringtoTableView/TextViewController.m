//
//  TextViewController.m
//  StringtoTableView
//
//  Created by hakozaki on 2014/12/29.
//  Copyright (c) 2014年 hakozaki. All rights reserved.
//

#import "TextViewController.h"
#import "ToDoData.h"
#import "ToDoDataWrapper.h"
#import "ModelManager.h"


@interface TextViewController ()

@end

@implementation TextViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.ToDoTextField.text = self.wrapper.title;
    
    
    UIBarButtonItem *done = [[UIBarButtonItem alloc]initWithTitle:@"完了"
                                                            style:UIBarButtonItemStyleDone
                                                           target:self
                                                           action:@selector(insertNewObject:)
                             ];
    
    self.navigationItem.rightBarButtonItem = done;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)insertNewObject:(id)sender {
    
    self.wrapper.title = self.ToDoTextField.text;
    self.wrapper.timeStamp = [NSDate date];
    
    ModelManager *model = [[ModelManager alloc]init];
    
    [model saveToDoData:self.wrapper];
    
    [self.navigationController popViewControllerAnimated:YES];
    
}




@end
