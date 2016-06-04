#import "_ToDoDataWrapper.h"
#import "ToDoData.h"

@interface _ToDoDataWrapper ()
@end

@implementation _ToDoDataWrapper {
}
- (instancetype)initWithEntity:(ToDoData *)entity {
    self = [super init];
    if (self) {
        _entity = entity;
        self.timeStamp = entity.timeStamp;
        self.title = entity.title;
    }
    return self;
}

- (void)updateEntity:(ToDoData *)entity {
    entity.timeStamp = self.timeStamp;
    entity.title = self.title;
}
@end
