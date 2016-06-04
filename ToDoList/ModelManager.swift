//
//  ModelManager.swift
//  ToDoList
//
//  Created by hakozaki on 2016/06/02.
//  Copyright © 2016年 hakozaki. All rights reserved.
//

import Foundation

class ModelManager{
    
    func context() -> NSManagedObjectContext{
        return NSManagedObjectContext.MR_defaultContext()
    }
    
    func insertData(title : NSString , timestamp : NSDate){
        updateData(ToDoData.MR_createEntity()!, title: title, timestamp: timestamp)
    }
    
    func updateData(data : ToDoData , title : NSString , timestamp : NSDate){
        data.title = title as String
        data.timeStamp = timestamp
        context().MR_saveToPersistentStoreAndWait()
    }
    
    func deleteData(data : ToDoData){
        data.MR_deleteEntity()
    }
    
    func MakeData() -> NSArray{
        return ToDoData.MR_findAll()!
    }
    
    func save(){
        context().MR_saveToPersistentStoreAndWait()
    }
    
}