//
//  BaseUIPageControl.swift
//  TrafficFramework
//
//  Created by Faraz Hussain Siddiqui on 8/20/17.
//  Copyright © 2017 Faraz Hussain Siddiqui. All rights reserved.
//

import UIKit

open class BaseUIPageControl: UIPageControl {
    
    //MARK: - Properties
    @IBInspectable open var pageIndicatorTintColorStyle:String? = nil {
        didSet {
            self.pageIndicatorTintColor = ColorManager.color(forKey: pageIndicatorTintColorStyle);
        }
    }
    
    @IBInspectable open var currentPageIndicatorTintColorStyle:String? = nil {
        didSet {
            self.currentPageIndicatorTintColor = ColorManager.color(forKey: currentPageIndicatorTintColorStyle);
        }
    }
    
    //MARK: - Overridden Methods
    override open func awakeFromNib() {
        super.awakeFromNib()
        
        self.configureView();
    }
    
    //MARK: - Methods
    func configureView(){
        if let pIndicatorTintCStyle = self.pageIndicatorTintColorStyle {
            self.pageIndicatorTintColorStyle = pIndicatorTintCStyle;
        }
        
        if let cPIndicatorTintColorStyle = self.currentPageIndicatorTintColorStyle {
            self.currentPageIndicatorTintColorStyle = cPIndicatorTintColorStyle;
        }
    }
}
