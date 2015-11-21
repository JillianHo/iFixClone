//
//  TableViewControlleriFix.swift
//  iFixClone
//
//  Created by Cao Khac Le Duy on 10/24/15.
//  Copyright © 2015 Cao Khac Le Duy. All rights reserved.
//

import UIKit

class TableViewControlleriFix: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "iFix"
        GlobalService.dataService.issues = Issue.fetchData(nil,context: GlobalService.coredataService.coreDataManagedObjectContext) as! [Issue]
        if (GlobalService.dataService.issues == nil || GlobalService.dataService.issues.count == 0)
        {
            GlobalService.dataService.ParseJSonListIssues("https://api.myjson.com/bins/qrkq", hanlder: {
                (content) -> Void in
                self.tableView.reloadData()
            })
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK : Onitemclick
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "selectionSegue"){
            let destination = segue.destinationViewController as! DetailViewController
            let tableviewcel = sender as! TableViewCell
            let indexpath = self.tableView.indexPathForCell(tableviewcel)
            destination.issue = GlobalService.dataService.issues[(indexpath?.row)!]
        }
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if( GlobalService.dataService.issues == nil)
        {
            return 0
        }
        else{
            return GlobalService.dataService.issues.count
        }
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("issueviewcell", forIndexPath: indexPath) as? TableViewCell
//        
        let collectionView = cell!.viewWithTag(8) as! UICollectionView
//        let numercell = collectionView.numberOfItemsInSection(0)
//        if numercell > 0{
//            for index in 0...numercell {
//                collectionView.deleteItemsAtIndexPaths([NSIndexPath(index: index)])
//            }
//        }
//        
        let isu = GlobalService.dataService.issues?[indexPath.row]
        cell!.setData(isu!)
        return cell!
    }

    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
