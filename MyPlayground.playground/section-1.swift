// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
class toDoItem{
    
}

var toDoItems = [toDoItem]()
func colorForIndex(index: Int) -> UIColor {
    let itemCount = toDoItems.count - 1
    let val = (CGFloat(index) / CGFloat(itemCount)) * 0.6
    return UIColor(red: 1.0, green: val, blue: 0.0, alpha: 1.0)
}

func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell,
    forRowAtIndexPath indexPath: NSIndexPath) {
        cell.backgroundColor = colorForIndex(indexPath.row)
}

 