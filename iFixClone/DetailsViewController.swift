//
//  DetailsViewController.swift
//  iFixClone
//
//  Created by Cao Khac Le Duy on 10/31/15.
//  Copyright © 2015 Cao Khac Le Duy. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var issue : Issue!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.scrollViewEdit()
        self.setData()
        self.title = "Request Detail"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewEdit(){
        let sv = self.view.viewWithTag(55) as! UIScrollView
        sv.frame = self.view.frame
        sv.contentSize = CGSize(width: self.view.frame.width,height: 1500)
    
    }
    
    func setData(){
        addImage(issue, index: 0, imageview: nil)
        let tableview = self.view.viewWithTag(8) as! UITableView
        tableview.delegate = self
        tableview.dataSource = self
        
        let service = self.view.viewWithTag(1) as! UILabel
        service.text = "Mobile phone problem"
        
        let serviceType = self.view.viewWithTag(2) as! UILabel
        serviceType.text = issue.getServiceType()
        
        let platform = self.view.viewWithTag(3) as! UILabel
        platform.text = issue.device.platform
        
        let manufacturer = self.view.viewWithTag(4) as! UILabel
        manufacturer.text = issue.device.manufacture
        
        let model = self.view.viewWithTag(5) as! UILabel
        model.text = issue.device.model
        
        let timestamp : Int64 = Int64.init(issue.timeCreated)!
        let date = NSDate(timeIntervalSince1970: NSTimeInterval(timestamp)/1000)
        let createdOn = self.view.viewWithTag(6) as! UILabel
        createdOn.text = issue.getDay(date)
        
        let status = self.view.viewWithTag(7) as! UILabel
        status.text = issue.getStatusConvert()
    }
    
    func addImage(issue : Issue,index : Int, imageview : UIImageView?){
//        if (index == issue.previewImgUrl.count) {return}
//        let scroll  = self.view.viewWithTag(9) as! UIScrollView
//        GlobalService.httpService.connect(issue.previewImgUrl[index], handlerComplete: {
//            (content) -> Void in
//            let image = UIImage(data: content, scale: 2.0)
//            let imageview2 = UIImageView(image: image)
//            if ( index == 0)
//            {
//                self.removesubViewFromView(scroll)
//                imageview2.frame = CGRect(x: 0, y: 0, width: 50, height: 60)
//                scroll.addSubview(imageview2)
//            }else{
//                imageview?.setFrameRightFor(imageview2, padding: 5, viewHeight: 50, viewWidth: 60)
//                scroll.addSubview(imageview2)
//            }
//            self.addImage(issue, index: index+1, imageview: imageview2)
//        })
    }
    
    func removesubViewFromView(view: UIView){
        for i in view.subviews{
            i.removeFromSuperview()
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.imageView?.image = UIImage(named: "issue_ico")
        //cell.textLabel?.text = issue.issues[indexPath.row]
        return cell
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if let a = issue.issues {
//            return a.count
//        }
        return 0
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
