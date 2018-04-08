//
//  ViewController.swift
//  9420
//
//  Created by 黄启明 on 2018/4/8.
//  Copyright © 2018年 Himin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var loveView: LoveView!
    var logoLabel: UILabel!
    let logo: String = "By Himin"

    override func viewDidLoad() {
        super.viewDidLoad()
        loveView = LoveView(frame: CGRect(x: 0, y: 0, width: rectWidth, height: rectHeight))
        loveView.center = view.center
        
        view.addSubview(loveView)
        
        logoLabel = UILabel(frame: CGRect(x: rectWidth-100, y: loveView.frame.origin.y+rectHeight+30, width: 150, height: 40))
        logoLabel.text = logo
        logoLabel.font = UIFont.boldSystemFont(ofSize: 23)
        logoLabel.textAlignment = .center
        logoLabel.textColor = UIColor.orange
        logoLabel.alpha = 0.0
        view.addSubview(logoLabel)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + loveView.animationTime-1) {
            UIView.animate(withDuration: 1.5) {
                self.logoLabel.alpha = 1.0
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

