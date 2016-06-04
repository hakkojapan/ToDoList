//
//  ModelManager.m
//
//
//  Created by hakozaki on 2014/12/24.
//
//

#import "ModelManager.h"
#import "MagicalRecord.h"
#import "ToDoData.h"
#import "ToDoDataWrapper.h"

@implementation ModelManager

- (NSManagedObjectContext *)context {
    return [NSManagedObjectContext MR_defaultContext];
}

//create
- (void)insertToDoData:(NSString *)title timeStamp:(NSDate *)timeStamp{
    
    //新しいエンティティの作成
    [self updateToDoData:[ToDoData MR_createEntity]title:title timeStamp:timeStamp];
}
//update
- (void)updateToDoData:(ToDoData *)ToDoData title:(NSString *)title timeStamp:(NSDate *)timeStamp{
    ToDoData.title = title;
    ToDoData.timeStamp = timeStamp;
    
    [self.context MR_saveOnlySelfAndWait];
}

//delete
- (void)deleteToDoData:(ToDoData *)ToDoData {
    [ToDoData MR_deleteInContext:[self context]];
    [self.context MR_saveToPersistentStoreAndWait];
}

//read
- (NSFetchedResultsController *)ToDoData{
    
    return [ToDoData MR_fetchAllGroupedBy:nil withPredicate:nil sortedBy:@"timeStamp" ascending:YES];
}

//save
- (void)saveToDoData:(ToDoDataWrapper *)wrapper {
    
    ToDoData *data = wrapper.entity ?: [ToDoData MR_createEntity];
    [wrapper updateEntity:data];
    [data.managedObjectContext MR_saveOnlySelfAndWait];
    
}

@end
