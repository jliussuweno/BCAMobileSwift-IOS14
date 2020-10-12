//
//  MainTabBar.swift
//  BCAMobileSwift-IOS14
//
//  Created by Jlius Suweno on 11/10/20.
//

import UIKit

class MainTabBar: UITabBar {
    
    private var middleButton = UIButton()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupMiddleButton()
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if self.isHidden {
            return super.hitTest(point, with: event)
        }
        
        let from = point
        let to = middleButton.center
        
        return sqrt((from.x - to.x) * (from.x - to.x) + (from.y - to.y) * (from.y - to.y)) <= 39 ? middleButton : super.hitTest(point, with: event)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        middleButton.center = CGPoint(x: UIScreen.main.bounds.width / 2, y: 0)
    }
    
    func setupMiddleButton() {
        middleButton.frame.size = CGSize(width: 50, height: 50)
        
        let img = UIImage(systemName: "qrcode")
        middleButton.setImage(img , for: .normal)
        
//        middleButton.setImage(UIImage.init(named: "qrcode.viewfinder"), for: .normal)
        middleButton.backgroundColor = .systemBackground
        middleButton.layer.cornerRadius = 10
        middleButton.layer.masksToBounds = true
        middleButton.center = CGPoint(x: UIScreen.main.bounds.width / 2, y: 0)
        middleButton.addTarget(self, action: #selector(test), for: .touchUpInside)
        addSubview(middleButton)
    }
    
    @objc func test() {
        print("my name is jeff")
    }
    
}
