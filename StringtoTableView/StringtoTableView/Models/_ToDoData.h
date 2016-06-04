// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ToDoData.h instead.

#import <CoreData/CoreData.h>

extern const struct ToDoDataAttributes {
	__unsafe_unretained NSString *timeStamp;
	__unsafe_unretained NSString *title;
} ToDoDataAttributes;

@interface ToDoDataID : NSManagedObjectID {}
@end

@interface _ToDoData : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) ToDoDataID* objectID;

@property (nonatomic, strong) NSDate* timeStamp;

//- (BOOL)validateTimeStamp:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* title;

//- (BOOL)validateTitle:(id*)value_ error:(NSError**)error_;

@end

@interface _ToDoData (CoreDataGeneratedPrimitiveAccessors)

- (NSDate*)primitiveTimeStamp;
- (void)setPrimitiveTimeStamp:(NSDate*)value;

- (NSString*)primitiveTitle;
- (void)setPrimitiveTitle:(NSString*)value;

@end
