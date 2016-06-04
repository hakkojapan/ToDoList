//
//  ModelManager.h
//  
//
//  Created by hakozaki on 2014/12/24.
//
//

#import <Foundation/Foundation.h>
#import "ToDoDataWrapper.h"

@class ToDoData;
@class NSFetchedResultsController;

@interface ModelManager : NSObject

- (void)insertToDoData:(NSString *)title timeStamp:(NSDate *)timeStamp;

- (void)updateToDoData:(ToDoData *)ToDoData title:(NSString *)title timeStamp:(NSDate *)timeStamp;

- (void)deleteToDoData:(ToDoData *)ToDoData;

- (void)saveToDoData:(ToDoDataWrapper *)toDoDataWrapper;

- (NSFetchedResultsController *)ToDoData;



@end
