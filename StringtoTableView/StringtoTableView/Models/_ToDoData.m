// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ToDoData.m instead.

#import "_ToDoData.h"

const struct ToDoDataAttributes ToDoDataAttributes = {
	.timeStamp = @"timeStamp",
	.title = @"title",
};

@implementation ToDoDataID
@end

@implementation _ToDoData

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"ToDoData" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"ToDoData";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"ToDoData" inManagedObjectContext:moc_];
}

- (ToDoDataID*)objectID {
	return (ToDoDataID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic timeStamp;

@dynamic title;

@end

