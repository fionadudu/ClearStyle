//
//  ToDoItem.swift
//  ClearStyle
//
//  Created by babykang on 15/4/20.
//  Copyright (c) 2015年 Fiona. All rights reserved.
//

import UIKit

class ToDoItem: NSObject {
    var text : String
    var complete : Bool
    init (text: String){
        self . text = text
        self . complete = false
    }
   
}
