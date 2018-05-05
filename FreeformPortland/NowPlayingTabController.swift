//
//  NowPlayingTabController.swift
//  FreeformPortland
//
//  Created by Mark Arciaga on 4/28/18.
//  Copyright © 2018 Mark Arciaga. All rights reserved.
//
import UIKit

class NowPlayingTabBarController: UITabBarController {
    var isFullScreen: Bool = false
    
    lazy var playerView: UIView = {
        var label: UILabel!
        var button: UIButton!
        
        let uiView = UIView(frame: CGRect(x: 10, y: 100, width: 300, height: 200))
        
        let heightAnchor = CGFloat(50)
        
        uiView.backgroundColor = UIColor(red: 50/255, green: 50/255, blue: 50/255, alpha: 1.0)
        
        heightConstraint = NSLayoutConstraint(item: uiView, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: uiView.frame.height)
        
        heightConstraint.constant = heightAnchor
        
        uiView.addConstraint(heightConstraint)
        
        
        // Add Label
        label = UILabel(frame: CGRect(x: 12, y: 8, width: uiView.frame.size.width-90, height: 50))
        label.text = "Audio Player!"
        label.textColor = UIColor.white
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16)
        uiView.addSubview(label)
        
        // Add Button
        button = UIButton(frame: CGRect(x: uiView.frame.size.width-87, y: 8, width: 86, height: 50))
        button.setTitle("Click Me", for: .normal)
        button.setTitleColor(UIColor(red: 76/255, green: 175/255, blue: 80/255, alpha: 1.0), for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        uiView.addSubview(button)

        return uiView
    }()
    
    @objc func buttonAction(sender: UIButton!) {
        self.isFullScreen = !self.isFullScreen
        let height = self.isFullScreen ? UIScreen.main.bounds.height - 50 : 50
        heightConstraint.constant = height
        
        UIView.animate(withDuration: 0.25) {
            self.view.layoutIfNeeded()
        }
    }
    
    var tabBarTopAnchor: NSLayoutYAxisAnchor?
    var heightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        // add a container view above the tabBar
        let currentLeftAnchor = view.leftAnchor // NSLayoutXAxisAnchor
        let currentRightAnchor = view.rightAnchor // NSLayoutXAxisAnchor
        tabBarTopAnchor = tabBar.topAnchor // NSLayoutYAxisAnchor
      
        

        view.addSubview(playerView)
        
        // this enables auto layout
        playerView.translatesAutoresizingMaskIntoConstraints = false
        
        // add constraints
        playerView.leftAnchor.constraint(equalTo: currentLeftAnchor).isActive = true
        playerView.rightAnchor.constraint(equalTo: currentRightAnchor).isActive = true

        // anchor your view right above the tabBar
        playerView.bottomAnchor.constraint(equalTo: tabBarTopAnchor!).isActive = true

    }

}

