//
//  BaseViewController.swift
//  CatTestProject
//
//  Created by Yassine Chebil on 15/01/2018.
//  Copyright © 2018 Yassine Chebil. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    
    //MARK:- UIViewController lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setNavigationBarGlobalAppearance()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setNavigationBarGlobalAppearance() {
        self.navigationController?.navigationBar.barTintColor = UIColor.red
        self.navigationController?.navigationBar.isTranslucent = false
    }
    
    func setNavigationBarTitleText(title: String,titlePadding: CGFloat,fontName: String, fontSize: CGFloat,titlePosition: NSTextAlignment){
        
        let navBarTitleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.width - titlePadding, height: 44))
        navBarTitleLabel.backgroundColor = UIColor.clear
        navBarTitleLabel.numberOfLines = 1
        
        navBarTitleLabel.textColor = UIColor.white
        navBarTitleLabel.text  = title
        navBarTitleLabel.font = UIFont(name: fontName, size: fontSize)
        navBarTitleLabel.textAlignment = titlePosition
        navigationItem.titleView = navBarTitleLabel
    }
    
    func setNavigationBarButton(imageName: String,selector: Selector?, isShown: Bool, isEnabled: Bool, isRightButton: Bool) {
        if isShown {
            let button = UIButton.init(type: .custom)
            button.setImage(UIImage(named: imageName), for: UIControlState.normal)
            button.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
            button.isUserInteractionEnabled = isEnabled
        
            if let actionSelector = selector {
                button.addTarget(self, action: actionSelector, for: .touchUpInside)
            }
            
            let barButton = UIBarButtonItem(customView: button)
            if isRightButton {
               navigationItem.rightBarButtonItem = barButton
            }
            else {
               navigationItem.leftBarButtonItem = barButton
            }
            
        }
        else {
            if isRightButton {
                self.navigationItem.rightBarButtonItem = nil
            }
            else {
                self.navigationItem.leftBarButtonItem = nil
            }
            
        }
        
    }

}
