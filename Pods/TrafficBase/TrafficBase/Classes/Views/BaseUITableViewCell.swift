//
//  BaseUITableViewCell.swift
//  TrafficFramework
//
//  Created by Faraz Hussain Siddiqui on 8/15/17.
//  Copyright © 2017 Faraz Hussain Siddiqui. All rights reserved.
//

import UIKit

open class BaseUITableViewCell: UITableViewCell, CornerDesignable, FillDesignable, BorderDesignable {
    
    // MARK: - CornerDesignable
    @IBInspectable open var isRounded: Bool = false {
        didSet {
            configureCornerRadius();
        }
    }
    
    @IBInspectable open var cornerRadius: CGFloat = CGFloat.nan {
        didSet {
            configureCornerRadius()
        }
    }
    
    open var cornerSides: CornerSides  = .allSides {
        didSet {
            configureCornerRadius()
        }
    }
    
    @IBInspectable var _cornerSides: String? {
        didSet {
            cornerSides = CornerSides(rawValue: _cornerSides)
        }
    }
    
    // MARK: - FillDesignable
    @IBInspectable open var fillThemeColor: String? {
        didSet {
            configureFillColor();
        }
    }
    
    
    @IBInspectable open var opacity: CGFloat = CGFloat.nan {
        didSet {
            configureOpacity();
        }
    }

    
    // MARK: - BorderDesignable
    open var borderType: BorderType  = .solid {
        didSet {
            configureBorder()
        }
    }
    
    @IBInspectable var _borderType: String? {
        didSet {
            borderType = BorderType(string: _borderType)
        }
    }
    
    @IBInspectable open var borderThemeColor: String? {
        didSet {
            configureBorder();
        }
    }
    
    @IBInspectable open var borderWidth: CGFloat = CGFloat.nan {
        didSet {
            configureBorder()
        }
    }
    
    open var borderSides: BorderSides  = .AllSides {
        didSet {
            configureBorder()
        }
    }
    
    @IBInspectable var _borderSides: String? {
        didSet {
            borderSides = BorderSides(rawValue: _borderSides)
        }
    }
    
    
    // MARK: - Initializers
    open override func awakeFromNib() {
        super.awakeFromNib()
        configureInspectableProperties()
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        configureAfterLayoutSubviews()
    }
    
    // MARK: - Private
    fileprivate func configureInspectableProperties() {
        configureOpacity()
    }
    
    fileprivate func configureAfterLayoutSubviews() {
        configureCornerRadius()
        configureBorder()
    }
}
