//
//  CustomNavigationTitleView.swift
//  todolist
//
//  Created by Kagan Girgin on 15.07.2020.
//

import UIKit

final class CustomNavigationTitleView: UIView {
    
    @IBOutlet weak var ivAddNote: UIImageView!
    @IBOutlet weak var viewTitleAddNote: UIView!
    @IBOutlet weak var viewTitleHome: UIView!
    
    override var intrinsicContentSize: CGSize {
        return UIView.layoutFittingExpandedSize
    }
    
    class func instanceFromNib() -> CustomNavigationTitleView {
        return UINib(nibName: "CustomNavigationTitleView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! CustomNavigationTitleView
    }
    
    func setTitleUI(type: NavigationTitleTypes){
        switch type {
        case NavigationTitleTypes.TitleHome:
            viewTitleHome.isHidden = false
        case NavigationTitleTypes.TitleAddNote:
            viewTitleAddNote.isHidden = false
        }
    }
}

