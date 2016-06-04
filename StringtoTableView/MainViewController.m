//
//  ViewController.m
//  StringtoTableView
//
//  Created by hakozaki on 2014/12/15.
//  Copyright (c) 2014年 hakozaki. All rights reserved.
//

#import "MainViewController.h"
#import "ToDoData.h"
#import "TextViewController.h"
#import "ToDoDataWrapper.h"


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,NSFetchedResultsControllerDelegate>


@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) ToDoData *data;
@property (weak, nonatomic) IBOutlet UIButton *addButton;
@property (strong ,nonatomic) NSFetchedResultsController *fetchedResultsController;
- (IBAction)addButton:(id)sender;

@end

@implementation ViewController


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    ModelManager *mod = [[ModelManager alloc]init];
    
    self.fetchedResultsController = [mod ToDoData];
    
    self.fetchedResultsController.delegate = self;
    
}


//編集がタップされた時
- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    [super setEditing:editing animated:animated];
    
    [self.tableView setEditing:editing animated:YES];
}

// 削除ボタンが押された行のデータを配列から削除する。
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        ModelManager *manager = [[ModelManager alloc]init];
        
        ToDoData *data = [self.fetchedResultsController objectAtIndexPath:indexPath];
        
        [manager deleteToDoData:data];
        
        self.fetchedResultsController = [manager ToDoData];
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        
    }
    
}

// テーブルに表示するデータ件数を返す
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    id sectionInfo = [[self.fetchedResultsController sections] objectAtIndex:section];
    
    return  [sectionInfo numberOfObjects];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return [[self.fetchedResultsController sections]count];
}

//テーブルに表示するセルを返す。
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 再利用できるセルがあれば再利用する
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    ToDoData *data = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    cell.textLabel.text = data.title;
    cell.detailTextLabel.text = [self TimetoString:data.timeStamp];
    
    return cell;
}

- (NSString *)TimetoString:(NSDate *)dateTime{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy/MM/dd"];
    
    NSString *date = [formatter stringFromDate:dateTime];
    
    return date;
}

//セルが押された時
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    ToDoData *data = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    [self performSegueWithIdentifier:@"pushDataView" sender:data];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier isEqualToString:@"pushDataView"]) {
        
        TextViewController *nextViewController = (TextViewController *)segue.destinationViewController;
        
        nextViewController.wrapper =  [[ToDoDataWrapper alloc]initWithEntity:sender];
        
    }
}

//セクションのタイトル設定
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"やること";
}

- (IBAction)addButton:(id)sender {
    [self performSegueWithIdentifier:@"pushDataView" sender:nil];
}

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView beginUpdates];
}

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath{
    
    switch (type) {
        case NSFetchedResultsChangeInsert:
            [self.tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeUpdate:
            [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeMove:
            [self.tableView moveRowAtIndexPath:indexPath toIndexPath:newIndexPath];
            
        default:
            break;
    }
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller{
    
    [self.tableView endUpdates];
    
}

@end

