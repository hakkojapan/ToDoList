#import <Foundation/Foundation.h>

@class ToDoData;


@interface _ToDoDataWrapper : NSObject
@property(nonatomic, strong) NSDate *timeStamp;
@property(nonatomic, strong) NSString *title;
@property(readonly, strong, nonatomic) ToDoData *entity;

- (instancetype)initWithEntity:(ToDoData *)entity;

- (void)updateEntity:(ToDoData *)entity;
@end
