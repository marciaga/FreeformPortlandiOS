//
//  PlayerViewController.swift
//  FreeformPortland
//
//  Created by Mark Arciaga on 4/28/18.
//  Copyright © 2018 Mark Arciaga. All rights reserved.
//

import UIKit

public class PlayerView: UIView {
    var label: UILabel!
    var button: UIButton!
    var viewWidth: CGFloat!
    var viewHeight: CGFloat!
    var isFullScreen: Bool = false
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        
//        print(UIScreen.main.bounds.height)
        viewWidth = self.frame.width
        viewHeight = self.frame.height
        
        self.backgroundColor = UIColor(red: 50/255, green: 50/255, blue: 50/255, alpha: 1.0)
        
        
        label = UILabel(frame: CGRect(x: 12, y: 8, width: self.frame.size.width-90, height: 50))
        label.text = "Audio Player!"
        label.textColor = UIColor.white
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16)
        self.addSubview(label)
        
        button = UIButton(frame: CGRect(x: self.frame.size.width-87, y: 8, width: 86, height: 50))
        button.setTitle("Click Me", for: .normal)
        button.setTitleColor(UIColor(red: 76/255, green: 175/255, blue: 80/255, alpha: 1.0), for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.addSubview(button)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func buttonAction(sender: UIButton!) {
        self.isFullScreen = !self.isFullScreen
        let height = self.isFullScreen ? UIScreen.main.bounds.height : 200
        self.frame = CGRect(x: 0, y: 50, width: UIScreen.main.bounds.width, height: height);

    }
}
