//
//  NowPlayingTabController.swift
//  FreeformPortland
//
//  Created by Mark Arciaga on 4/28/18.
//  Copyright © 2018 Mark Arciaga. All rights reserved.
//
import UIKit

class NowPlayingTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //...do some of your custom setup work
        // add a container view above the tabBar
        let currentLeftAnchor = view.leftAnchor // NSLayoutXAxisAnchor
        let currentRightAnchor = view.rightAnchor // NSLayoutXAxisAnchor
        let tabBarTopAnchor = tabBar.topAnchor // NSLayoutYAxisAnchor
        let heightAnchor = CGFloat(50)
        
        let containerView = PlayerView(frame: CGRect(x: 10, y: 100, width: 300, height: 200))

        view.addSubview(containerView)
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.leftAnchor.constraint(equalTo: currentLeftAnchor).isActive = true
        containerView.rightAnchor.constraint(equalTo: currentRightAnchor).isActive = true

        // anchor your view right above the tabBar
        containerView.bottomAnchor.constraint(equalTo: tabBarTopAnchor).isActive = true

//        containerView.heightAnchor.constraint(equalToConstant: heightAnchor).isActive = true
        containerView.heightConstraint.constant = heightAnchor
    }

}

