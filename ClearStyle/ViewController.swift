//
//  ViewController.swift
//  ClearStyle
//
//  Created by babykang on 15/4/20.
//  Copyright (c) 2015年 Fiona. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource ,UITableViewDelegate,TableViewCellDelegate{

    @IBOutlet weak var tableView: UITableView!
    
    var toDoItems = [ToDoItem]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerClass(TableViewCell.self, forCellReuseIdentifier: "cell")
        
        tableView.separatorStyle = .None
        tableView.rowHeight = 50.0
        tableView.backgroundColor = UIColor.blackColor()
                if toDoItems.count > 0 {
            return
        }
        toDoItems.append(ToDoItem(text: "feed the cat"))
        toDoItems.append(ToDoItem(text: "buy eggs"))
        toDoItems.append(ToDoItem(text: "watch WWDC videos"))
        toDoItems.append(ToDoItem(text: "rule the Web"))
        toDoItems.append(ToDoItem(text: "buy a new iPhone"))
        toDoItems.append(ToDoItem(text: "darn holes in socks"))
        toDoItems.append(ToDoItem(text: "write this tutorial"))
        toDoItems.append(ToDoItem(text: "master Swift"))
        toDoItems.append(ToDoItem(text: "learn to draw"))
        toDoItems.append(ToDoItem(text: "get more exercise"))
        toDoItems.append(ToDoItem(text: "catch up with Mom"))
        toDoItems.append(ToDoItem(text: "get a hair cut"))
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return toDoItems.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath:indexPath) as UITableViewCell
        let item = toDoItems[indexPath.row]
        
        cell.textLabel?.backgroundColor = UIColor.clearColor()

        cell.textLabel?.text = item.text
        cell.selectionStyle = .None
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return tableView.rowHeight;
    }
    func colorForIndex(index:Int)->UIColor{
        let itemCount = toDoItems.count - 1
        let val = (CGFloat(index) / CGFloat(itemCount)) * 0.6
        return UIColor(red : 2.0, green: val, blue: 1.0, alpha: 1.0)
    }
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell,
        forRowAtIndexPath indexPath: NSIndexPath) {
            cell.backgroundColor = colorForIndex(indexPath.row)
    }
    
    func toDoItemDeleted(toDoItem: ToDoItem) {
        let index = (toDoItems as NSArray).indexOfObject(toDoItem)
        if index == NSNotFound { return }
        
        // could removeAtIndex in the loop but keep it here for when indexOfObject works
        toDoItems.removeAtIndex(index)
        
        // use the UITableView to animate the removal of this row
        tableView.beginUpdates()
        let indexPathForRow = NSIndexPath(forRow: index, inSection: 0)
        tableView.deleteRowsAtIndexPaths([indexPathForRow], withRowAnimation: .Fade)
        tableView.endUpdates()    
    }

}

