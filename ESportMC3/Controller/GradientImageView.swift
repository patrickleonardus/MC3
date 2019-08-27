//
//  GradientImageView.swift
//  GradientView_Swift3
//
//  Created by HuyVuong on 1/10/17.
//  Copyright © 2017 HuyVuong. All rights reserved.
//

import Foundation
import UIKit

class UIGradientImageView: UIImageView
{
    let myGradientLayer: CAGradientLayer
    
    override init(frame: CGRect){
        myGradientLayer = CAGradientLayer()
        super.init(frame: frame)
        self.setup()
        addGradientLayer()
    }
    
    func addGradientLayer(){
        if myGradientLayer.superlayer == nil{
            self.layer.addSublayer(myGradientLayer)
        }
    }
    
    required init(coder aDecoder: NSCoder){
        myGradientLayer = CAGradientLayer()
        super.init(coder: aDecoder)!
        self.setup()
        addGradientLayer()
    }
    
    func getColors() -> [CGColor] {
        return [UIColor.clear.cgColor, UIColor(red: 87/255, green: 84/255, blue: 92/255, alpha: 1).cgColor]
    }
    
    func getLocations() -> [CGFloat]{
        return [0, 1]
    }
    
    func setup() {
        myGradientLayer.startPoint = CGPoint(x: 0.2, y: 0)
        myGradientLayer.endPoint = CGPoint(x: 0.2, y: 1)
        
        let colors = getColors()
        myGradientLayer.colors = colors
        myGradientLayer.isOpaque = false
        myGradientLayer.locations = getLocations() as [NSNumber]?
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        myGradientLayer.frame = self.layer.bounds
    }
}
