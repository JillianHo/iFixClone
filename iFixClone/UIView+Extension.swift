//
//  UIView+Extension.swift
//  Fb Login screen
//
//  Created by Cao Khac Le Duy on 9/13/15.
//  Copyright © 2015 Cao Khac Le Duy. All rights reserved.
//

import UIKit

extension UIView {
    
    // it has a height before
    func setFrameOverFor(view : UIView , padding : CGFloat, align : NSString, viewHeight : CGFloat, viewWidth: CGFloat){
        view.frame = CGRect(x: self.frame.origin.x, y: self.frame.origin.y - viewHeight - padding, width: viewWidth, height: viewHeight)
        if align.lowercaseString == "center" {
            view.center.x = self.center.x
        }
    }
    
    func setFrameUnderFor(view : UIView , padding : CGFloat, align : NSString, viewHeight : CGFloat, viewWidth: CGFloat) {
        view.frame = CGRect(x: self.frame.origin.x, y: self.frame.origin.y + self.frame.height + padding, width: viewWidth, height: viewHeight)
        if align.lowercaseString == "center" {
            view.center.x = self.center.x
        }
    }
    
    func setFrameRightFor(view : UIView , padding : CGFloat, viewHeight : CGFloat, viewWidth: CGFloat) {
        view.frame = CGRect(x: self.frame.origin.x + self.frame.width + padding, y: self.frame.origin.y, width: viewWidth, height: viewHeight)
    }
    
    func setFrameLeftFor(view : UIView , padding : CGFloat, viewHeight : CGFloat, viewWidth: CGFloat) {
        view.frame = CGRect(x: self.frame.origin.x - padding - viewWidth, y: self.frame.origin.y, width: viewWidth, height: viewHeight)
    }

    func setBorderBottom(color : UIColor, thickness: CGFloat){
        //border use CA Layer to generate
        let border = CALayer()
        //border width
        let borderwidth = thickness
        //border color use CGColor
        border.borderColor = color.CGColor
        
        //bottom border y will be at the bottom
        border.frame = CGRect(x: 0, y: self.frame.size.height-borderwidth, width: self.frame.size.width, height: self.frame.size.height)
        
        //borderwidth
        border.borderWidth = borderwidth
        //add border
        self.layer.addSublayer(border)
        
        //
        self.layer.masksToBounds = true

    }
}


