 //
//  TableViewCell.swift
//  iFixClone
//
//  Created by Cao Khac Le Duy on 10/24/15.
//  Copyright © 2015 Cao Khac Le Duy. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {

    var providers: [Offers]?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let collectionView = self.viewWithTag(8) as! UICollectionView
        //collectionView.registerClass(CollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "providerscell")
        collectionView.delegate = self
        collectionView.dataSource = self
        
        print("awake")
        
        //        collectionView.registerNib(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "providerscell")
        
    }

    
    func setData(issue: Issue){
        
        print("setData")
        let collectionView = self.viewWithTag(8) as! UICollectionView
        collectionView.reloadData()
        
        if(issue.providers.count > 0 ){
            self.providers = issue.providers.allObjects as? [Offers]
            self.contentView.frame.size.height = self.contentView.frame.height - collectionView.frame.height
        }else
        {
            self.providers = issue.providers.allObjects as? [Offers]
        }
        let device = self.viewWithTag(2) as! UILabel
        device.text = issue.device.model
        
        let time = self.viewWithTag(3) as! UILabel
        let timestamp : Int64 = Int64.init(issue.timeCreated)!
        let date = NSDate(timeIntervalSince1970: NSTimeInterval(timestamp)/1000)
        
        time.text = issue.getTime(date) + " " + issue.getDay(date)
        
        let descript = self.viewWithTag(4) as! UILabel
        descript.text = issue.descript
        
        let status = self.viewWithTag(7) as! UILabel
        status.text = issue.getStatusConvert()
        
        self.addicon(issue)
        
    }
    
    func addicon(issue: Issue){
        let view = self.viewWithTag(5)
        let subview = view?.subviews.count
        //remove all views
        if subview != nil && subview > 0{
            for subviewi in (view?.subviews)!{
                subviewi.removeFromSuperview()
            }
        }
        let emailimageview = UIImageView(image: UIImage(named: "emailico"))
        let deliverimageview = UIImageView(image: UIImage(named: "deliverico"))
        let frame = CGRect(x: 0, y: 0, width: 20, height: 20)

        if (issue.isNotifyEmail == true){
            emailimageview.frame = frame
            
            view?.addSubview(emailimageview)
            if(issue.isTravelToConsumer == true){
                emailimageview.setFrameRightFor(deliverimageview, padding: 2, viewHeight: 20, viewWidth: 20)
                view?.addSubview(deliverimageview)
            }
            
        }else{
            deliverimageview.frame = frame
            view?.addSubview(deliverimageview)
        }
    }
    
    
    
        
   
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("providerscell", forIndexPath: indexPath) as! CollectionViewCell
        if(providers != nil && providers!.count > indexPath.row)
            {
                cell.setData(providers![indexPath.row])
            }
        
        
        return cell
    }
    
    
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let a = providers {
            return a.count
        }
        return 0
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
