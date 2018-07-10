//
//  BaseLayoutConstraint.swift
//  TrafficFramework
//
//  Created by Faraz Hussain Siddiqui on 8/13/17.
//  Copyright © 2017 Faraz Hussain Siddiqui. All rights reserved.
//

import UIKit

open class BaseLayoutConstraint: NSLayoutConstraint {
    
    override open func awakeFromNib() {
        
        super.awakeFromNib();
        self.constant = DesignUtility.convertToRatio(constant, sizedForIPad: false, sizedForNavi:false)
        
    }
}

public extension NSLayoutConstraint {
    @IBInspectable var setConstraint: CGFloat {
        get { return constant }
        set {
            constant = DesignUtility.getValueFromRatio(newValue)
        }
    }
}

public extension UIView {
    
    public func topConstraint() -> NSLayoutConstraint {
        
        return getOriginConstraint(type: .top)
    }
    
    public func bottomConstraint() -> NSLayoutConstraint {
        
        return getOriginConstraint(type: .bottom)
    }
    
    
    public func leadingConstraint() -> NSLayoutConstraint {
        
        return getOriginConstraint(type: .leading)
    }
    
    public func traillingConstraint() -> NSLayoutConstraint {
        
        return getOriginConstraint(type: .trailing)
    }
    
    
    public func leftConstraint() -> NSLayoutConstraint {
        
        return getOriginConstraint(type: .left)
    }
    
    public func rightConstraint() -> NSLayoutConstraint {
        
        return getOriginConstraint(type: .right)
    }
    
    public func centerXConstraint() -> NSLayoutConstraint {
        
        return getOriginConstraint(type: .centerX)
    }
    
    public func centerYConstraint() -> NSLayoutConstraint {
        
        return getOriginConstraint(type: .centerY)
    }
    
    
    public func heightConstraint() -> NSLayoutConstraint {
        
        return getSizeConstraint(type: .height)
    }
    
    
    public func widthConstraint() -> NSLayoutConstraint {
        
        return getSizeConstraint(type: .width)
    }
    
    private func getOriginConstraint( type : NSLayoutAttribute) -> NSLayoutConstraint{
        
        
        for constraint in (self.superview?.constraints)! {
            
            if constraint.firstItem  as? UIView == self && constraint.firstAttribute == type{
                return constraint
            }
            else {
                if constraint.secondItem as? UIView == self && constraint.secondAttribute == type {
                    return constraint
                    
                }
            }
        }
        
        return NSLayoutConstraint()
    }
    
    
    func getSizeConstraint( type : NSLayoutAttribute) -> NSLayoutConstraint{
        
        for constraint in self.constraints {
            if  constraint.firstAttribute == type{
                return constraint
            }
        }
        return NSLayoutConstraint()
    }
    
    private func log(_ text : NSLayoutAttribute){
        print("NO \(text) Constraint Found")
    }
}







