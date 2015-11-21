//
//  DetailViewController.swift
//  iFixClone
//
//  Created by Cao Khac Le Duy on 11/15/15.
//  Copyright © 2015 Cao Khac Le Duy. All rights reserved.
//

import UIKit

class DetailViewController: UITableViewController {

    var issue : Issue!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        switch section {
        case 1:
            return 2
        default:
            return 1
        }
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        tableView.headerViewForSection(section)?.backgroundColor = UIColor.lightTextColor()
        switch section {
        case 0:
            return "Information"
        case 1:
            return "Issues"
        default:
            return "Photos"
        }
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let section = indexPath.section
        switch section{
        case 0:
            return 245
        case 1:
            return 80
        default:
            return 200
            
        }
    }

    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell : UITableViewCell!
        let section = indexPath.section
        switch section{
        case 0 :
            return infoCell(indexPath)
        case 1:
            return issueCell(indexPath)
        default:
            return photoCell(indexPath)
        }

        // Configure the cell...

    }

    func issueCell(indexpath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("issuecell", forIndexPath: indexpath)
        let label = cell.contentView.viewWithTag(8) as! UILabel
        label.text = issue.issues[indexpath.row]
        print(issue.issues[indexpath.row])
        return cell
    }

    //return photos cell
    func photoCell(indexpath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("photocell", forIndexPath: indexpath)
        let sv = cell.contentView.viewWithTag(9) as! UIScrollView
        self.addImage(issue, index: 0, imageview: nil, scroll: sv)
        return cell
    }
    
   
    
    func addImage(issue : Issue,index : Int, imageview : UIImageView?,scroll: UIScrollView){
                if (index == issue.previewImgUrl.count) {
                    return
                }
                GlobalService.httpService.connect(issue.previewImgUrl[index], handlerComplete: {
                    (content) -> Void in
                    let image = UIImage(data: content, scale: 2.0)
                    let imageview2 = UIImageView(image: image)
                    if ( index == 0)
                    {
                        self.removesubViewFromView(scroll)
                        imageview2.frame = CGRect(x: 0, y: 0, width: 50, height: 60)
                        scroll.addSubview(imageview2)
                    }else{
                        imageview?.setFrameRightFor(imageview2, padding: 5, viewHeight: 50, viewWidth: 60)
                        scroll.addSubview(imageview2)
                    }
                    self.addImage(issue, index: index+1, imageview: imageview2,scroll: scroll)
                    
                })
        
    }
    
    //Remove subviews from parentview
    func removesubViewFromView(view: UIView){
        for i in view.subviews{
            i.removeFromSuperview()
        }
    }

    
    // return information cell
    func infoCell(indexpath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("infocell", forIndexPath: indexpath)
        
        let service = cell.contentView.viewWithTag(1) as! UILabel
        service.text = "Mobile phone problem"
        
        let serviceType = cell.contentView.viewWithTag(2) as! UILabel
        serviceType.text = issue?.getServiceType()
        
        let platform = cell.contentView.viewWithTag(3) as! UILabel
        platform.text = issue?.device.platform
        
        let manufacturer = cell.contentView.viewWithTag(4) as! UILabel
        manufacturer.text = issue?.device.manufacture
        
        let model = cell.contentView.viewWithTag(5) as! UILabel
        model.text = issue?.device.model
        
        var timestamp : Int64!
        timestamp = 1
        if issue != nil {
            timestamp = Int64.init(issue.timeCreated)!
        }
        
        let date = NSDate(timeIntervalSince1970: NSTimeInterval(timestamp)/1000)
        let createdOn = cell.contentView.viewWithTag(6) as! UILabel
        createdOn.text = issue?.getDay(date)
        
        let status = cell.contentView.viewWithTag(7) as! UILabel
        status.text = issue?.getStatusConvert()
        
        
        return cell
    }
    
    //reload data
    override func viewDidAppear(animated: Bool) {
        self.tableView.reloadData()
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
