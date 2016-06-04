//
//  NextViewController.swift
//  ToDoList
//
//  Created by hakozaki on 2016/06/01.
//  Copyright © 2016年 hakozaki. All rights reserved.
//

import Foundation
import UIKit

class NextViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.text = "入力してください"
    }
    
    @IBAction func insertNewObject(sender: AnyObject) {
        let model = ModelManager()
        let date = NSDate()
        model.insertData(textField.text!, timestamp: date)
        model.save()
        self.navigationController?.popViewControllerAnimated( true )
    }
    
}

