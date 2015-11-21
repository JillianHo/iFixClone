//
//  CollectionViewCell.swift
//  iFixClone
//
//  Created by Cao Khac Le Duy on 10/24/15.
//  Copyright © 2015 Cao Khac Le Duy. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell  {
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setData(offer: Offers?){
        if(offer == nil) {return}
        let name = self.viewWithTag(11) as! UILabel
        name.text = offer!.name
        
        self.setrate(offer!)
        
        let price = self.viewWithTag(9) as! UILabel
        price.text = ""
        price.text = offer!.totalPrice.description + " " + offer!.currency
    }
    
    
    func setrate(offer: Offers){
        if(offer.votedStars==0){return}
        let view  = self.viewWithTag(12)
        
        //Remove views in rate view
        for viewchild in (view?.subviews)!{
            viewchild.removeFromSuperview()
        }
        
        // add stars
        var img  = UIImageView(image: UIImage(named: "star"))
        let x = CGFloat(offer.votedStars.integerValue*20 + 4*(offer.votedStars.integerValue))
        
        let x2 = ((self.contentView.frame.width) - x-20)/2
        
        img.frame = CGRect(x: x2, y: 0, width: 20, height: 20)
        view?.addSubview(img)
        
        //print(offer.votedStars)
        
        for _ in 0...offer.votedStars.integerValue-1{
            let img2 = UIImageView(image: UIImage(named: "star"))
            img.setFrameRightFor(img2, padding: 4, viewHeight: 20, viewWidth: 20)
            view?.addSubview(img2)
            img = img2
        }
    }
    

}
