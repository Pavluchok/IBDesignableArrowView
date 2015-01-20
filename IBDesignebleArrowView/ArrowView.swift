//
//  ArrowView.swift
//  IBDesignebleArrowView
//
//  Created by Vitaliy on 20.01.15.
//  Copyright (c) 2015 Vitaliy Pavlyuk. All rights reserved.
//

import UIKit

@IBDesignable class ArrowView: UIView {
    
    @IBInspectable var headWidth : CGFloat = 10.0
    @IBInspectable var headLenght : CGFloat = 10.0
    
    @IBInspectable var startPoint : CGPoint = CGPoint(x: 20, y: 320)//CGPointZero
    @IBInspectable var endPoint: CGPoint = CGPoint(x: 120, y: 20)//CGPointZero
    
    @IBInspectable var arrowColor : UIColor = UIColor.whiteColor()
    
    var isInterfaceBuilder: Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // Initialization code
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func prepareForInterfaceBuilder() {
        self.isInterfaceBuilder = true
    }
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        
        arrowColor.setStroke()
        
        CGContextMoveToPoint(context, self.startPoint.x, self.startPoint.y)
        
        if (self.startPoint.x == self.endPoint.x || self.startPoint.y == self.endPoint.y)
        {
            CGContextAddLineToPoint(context, self.endPoint.x, self.endPoint.y)
        }
        else
        {
            CGContextAddLineToPoint(context, self.endPoint.x, self.startPoint.y)
            CGContextAddLineToPoint(context, self.endPoint.x, self.endPoint.y)
        }

        
        let halfHeadWidth = self.headWidth / 2.0
        
        
        if self.startPoint.y == self.endPoint.y
        {
            let convertHeight = self.startPoint.x > self.endPoint.x ? self.headLenght : -self.headLenght
            CGContextAddLineToPoint(context, self.endPoint.x + convertHeight , self.endPoint.y + halfHeadWidth)
            CGContextMoveToPoint(context, self.endPoint.x, endPoint.y)
            CGContextAddLineToPoint(context, self.endPoint.x + convertHeight , self.endPoint.y - halfHeadWidth)
        }
        else
        {
            let convertHeight = self.startPoint.y > self.endPoint.y ? self.headLenght : -self.headLenght
            CGContextAddLineToPoint(context, self.endPoint.x - halfHeadWidth , self.endPoint.y + convertHeight)
            CGContextMoveToPoint(context, self.endPoint.x, endPoint.y)
            CGContextAddLineToPoint(context, self.endPoint.x + halfHeadWidth , self.endPoint.y + convertHeight)
        }
        
        CGContextStrokePath(context)
        // Drawing code
    }
    

}
