//
//  LoveView.swift
//  9420
//
//  Created by 黄启明 on 2018/4/8.
//  Copyright © 2018年 Himin. All rights reserved.
//

import UIKit

let unit: CGFloat = 30
let width: CGFloat = unit * 2
let height: CGFloat = unit * 3

let rectWidth: CGFloat = width * 5
let rectHeight: CGFloat = height * 4

class LoveView: UIView {

    fileprivate let lineWidth: CGFloat = 4
    fileprivate let lineColor: UIColor = UIColor.orange
    fileprivate let line4space: CGFloat = 4
    
    let animationTime = 13.0
    fileprivate var lineAnimation: CAKeyframeAnimation!
    fileprivate var lineAnimationEnd: CAKeyframeAnimation!
    
    fileprivate var frameLayer: CAShapeLayer!//边框
    fileprivate var lineLayer: CAShapeLayer!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupRect(frame: frame)
        //self.backgroundColor = UIColor.gray
        setupLine()
        setupAnimation()
        setupAnimationEnd()
        lineLayer.add(lineAnimation, forKey: "lineAnimation")
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + animationTime) {
            self.setupAnimationEnd()
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    fileprivate func setupLine() {
        let bezierPath = UIBezierPath()
        //20
        bezierPath.move(to: CGPoint(x: unit*3, y: unit))
        bezierPath.addLine(to: CGPoint(x: unit*3+unit, y: unit))
        
        bezierPath.move(to: CGPoint(x: unit*3+unit, y: unit*2))
        bezierPath.addLine(to: CGPoint(x: unit*3+unit*2, y: unit*2))
        
        bezierPath.move(to: CGPoint(x: unit*3+width+unit, y: unit))
        bezierPath.addLine(to: CGPoint(x: unit*3+width+unit, y: unit*2))
        
        //520
        bezierPath.move(to: CGPoint(x: unit*2+unit, y: height+unit))
        bezierPath.addLine(to: CGPoint(x: unit*2+unit*2, y: height+unit))
        
        bezierPath.move(to: CGPoint(x: unit*2, y: height+unit*2))
        bezierPath.addLine(to: CGPoint(x: unit*2+unit, y: height+unit*2))
        
        bezierPath.move(to: CGPoint(x: unit*2+width, y: height+unit))
        bezierPath.addLine(to: CGPoint(x: unit*2+width+unit, y: height+unit))
        
        bezierPath.move(to: CGPoint(x: unit*2+width+unit, y: height+unit*2))
        bezierPath.addLine(to: CGPoint(x: unit*2+width+unit*2, y: height+unit*2))
        
        bezierPath.move(to: CGPoint(x: unit*2+width*2+unit, y: height+unit))
        bezierPath.addLine(to: CGPoint(x: unit*2+width*2+unit, y: height+unit*2))
        
        //9420
        bezierPath.move(to: CGPoint(x: unit+unit, y: height*2+unit/2))
        bezierPath.addLine(to: CGPoint(x: unit+unit, y: height*2+unit/2+unit))
        
        bezierPath.move(to: CGPoint(x: unit, y: height*2+unit*2))
        bezierPath.addLine(to: CGPoint(x: unit+unit, y: height*2+unit*2))
        bezierPath.addLine(to: CGPoint(x: unit+unit, y: height*2+unit*2+unit/2))
        
        bezierPath.move(to: CGPoint(x: unit+width+unit, y: height*2))
        bezierPath.addLine(to: CGPoint(x: unit+width+unit, y: height*2+unit*2))
        
        bezierPath.move(to: CGPoint(x: unit+width+unit*2-line4space, y: height*2))
        bezierPath.addLine(to: CGPoint(x: unit+width+unit*2-line4space, y: height*2+unit*2))
        
        bezierPath.move(to: CGPoint(x: unit+width, y: height*3-line4space))
        bezierPath.addLine(to: CGPoint(x: unit+width+unit, y: height*3-line4space))
        
        bezierPath.move(to: CGPoint(x: unit+width+unit*2-line4space, y: height*2+2*unit+unit/2))
        bezierPath.addLine(to: CGPoint(x: unit+width+unit*2-line4space, y: height*2+2*unit+unit))
        
        bezierPath.move(to: CGPoint(x: unit+width*2, y: height*2+unit))
        bezierPath.addLine(to: CGPoint(x: unit+width*2+unit, y: height*2+unit))
        
        bezierPath.move(to: CGPoint(x: unit+width*2+unit, y: height*2+unit*2))
        bezierPath.addLine(to: CGPoint(x: unit+width*2+unit*2, y: height*2+unit*2))
        
        bezierPath.move(to: CGPoint(x: unit+width*3+unit, y: height*2+unit))
        bezierPath.addLine(to: CGPoint(x: unit+width*3+unit, y: height*2+unit*2))
        
        //59420
        bezierPath.move(to: CGPoint(x: unit, y: height*3+unit))
        bezierPath.addLine(to: CGPoint(x: unit*2, y: height*3+unit))
        
        bezierPath.move(to: CGPoint(x: 0, y: height*3+unit*2))
        bezierPath.addLine(to: CGPoint(x: unit, y: height*3+unit*2))
        
        bezierPath.move(to: CGPoint(x: width+unit, y: height*3+unit/2))
        bezierPath.addLine(to: CGPoint(x: width+unit, y: height*3+unit/2+unit))
        
        bezierPath.move(to: CGPoint(x: width, y: height*3+unit*2))
        bezierPath.addLine(to: CGPoint(x: width+unit, y: height*3+unit*2))
        bezierPath.addLine(to: CGPoint(x: width+unit, y: height*3+unit*2+unit/2))
        //4
        bezierPath.move(to: CGPoint(x: width*2+unit, y: height*3))
        bezierPath.addLine(to: CGPoint(x: width*2+unit, y: height*3+unit*2))
        
        bezierPath.move(to: CGPoint(x: width*2+unit*2-line4space, y: height*3))
        bezierPath.addLine(to: CGPoint(x: width*2+unit*2-line4space, y: height*3+unit*2))
        
        bezierPath.move(to: CGPoint(x: width*2, y: height*4-line4space))
        bezierPath.addLine(to: CGPoint(x: width*2+unit, y: height*4-line4space))
        
        bezierPath.move(to: CGPoint(x: width*2+unit*2-line4space, y: height*3+2*unit+unit/2))
        bezierPath.addLine(to: CGPoint(x: width*2+unit*2-line4space, y: height*3+2*unit+unit))
        
        bezierPath.move(to: CGPoint(x: width*3, y: height*3+unit))
        bezierPath.addLine(to: CGPoint(x: width*3+unit, y: height*3+unit))
        
        bezierPath.move(to: CGPoint(x: width*3+unit, y: height*3+unit*2))
        bezierPath.addLine(to: CGPoint(x: width*3+unit*2, y: height*3+unit*2))
        
        bezierPath.move(to: CGPoint(x: width*4+unit, y: height*3+unit))
        bezierPath.addLine(to: CGPoint(x: width*4+unit, y: height*3+unit*2))
        
        lineLayer = CAShapeLayer()
        lineLayer.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        lineLayer.path = bezierPath.cgPath
        lineLayer.strokeColor = UIColor.orange.cgColor
        lineLayer.fillColor = UIColor.clear.cgColor
        lineLayer.lineWidth = lineWidth
        
        lineLayer.strokeEnd = 0.0
        
        lineLayer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        lineLayer.position = self.center
        
        self.layer.addSublayer(lineLayer)
    }
    
    fileprivate func setupRect(frame: CGRect) {
    
        let bezierPath = UIBezierPath()
        //1
        bezierPath.move(to: CGPoint(x: unit*3, y: 0))
        bezierPath.addLine(to: CGPoint(x: unit*3+width*2, y: 0))
        bezierPath.addLine(to: CGPoint(x: unit*3+width*2, y: height))
        bezierPath.addLine(to: CGPoint(x: unit*3, y: height))
        bezierPath.addLine(to: CGPoint(x: unit*3, y: 0))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: unit*3+width, y: 0))
        bezierPath.addLine(to: CGPoint(x: unit*3+width, y: height))
        //2
        bezierPath.move(to: CGPoint(x: unit*2, y: height))
        bezierPath.addLine(to: CGPoint(x: unit*2+width*3, y: height))
        bezierPath.addLine(to: CGPoint(x: unit*2+width*3, y: height*2))
        bezierPath.addLine(to: CGPoint(x: unit*2, y: height*2))
        bezierPath.addLine(to: CGPoint(x: unit*2, y: height))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: unit*2+width, y: height))
        bezierPath.addLine(to: CGPoint(x: unit*2+width, y: height*2))
        bezierPath.move(to: CGPoint(x: unit*2+width*2, y: height))
        bezierPath.addLine(to: CGPoint(x: unit*2+width*2, y: height*2))
        //3
        bezierPath.move(to: CGPoint(x: unit, y: height*2))
        bezierPath.addLine(to: CGPoint(x: unit+width*4, y: height*2))
        bezierPath.addLine(to: CGPoint(x: unit+width*4, y: height*3))
        bezierPath.addLine(to: CGPoint(x: unit, y: height*3))
        bezierPath.addLine(to: CGPoint(x: unit, y: height*2))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: unit+width, y: height*2))
        bezierPath.addLine(to: CGPoint(x: unit+width, y: height*3))
        bezierPath.move(to: CGPoint(x: unit+width*2, y: height*2))
        bezierPath.addLine(to: CGPoint(x: unit+width*2, y: height*3))
        bezierPath.move(to: CGPoint(x: unit+width*3, y: height*2))
        bezierPath.addLine(to: CGPoint(x: unit+width*3, y: height*3))
        //4
        bezierPath.move(to: CGPoint(x: 0, y: height*3))
        bezierPath.addLine(to: CGPoint(x: 0+width*5, y: height*3))
        bezierPath.addLine(to: CGPoint(x: 0+width*5, y: height*4))
        bezierPath.addLine(to: CGPoint(x: 0, y: height*4))
        bezierPath.addLine(to: CGPoint(x: 0, y: height*3))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: 0+width, y: height*3))
        bezierPath.addLine(to: CGPoint(x: 0+width, y: height*4))
        bezierPath.move(to: CGPoint(x: 0+width*2, y: height*3))
        bezierPath.addLine(to: CGPoint(x: 0+width*2, y: height*4))
        bezierPath.move(to: CGPoint(x: 0+width*3, y: height*3))
        bezierPath.addLine(to: CGPoint(x: 0+width*3, y: height*4))
        bezierPath.move(to: CGPoint(x: 0+width*4, y: height*3))
        bezierPath.addLine(to: CGPoint(x: 0+width*4, y: height*4))
        
        //
        frameLayer = CAShapeLayer()
        frameLayer.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        frameLayer.path = bezierPath.cgPath
        frameLayer.strokeColor = lineColor.cgColor
        frameLayer.lineWidth = lineWidth
        frameLayer.fillColor = UIColor.clear.cgColor
        frameLayer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        frameLayer.position = self.center
        self.layer.addSublayer(frameLayer)
    }
    
    fileprivate func setupAnimation() {
        //动画
        lineAnimation = CAKeyframeAnimation(keyPath: "strokeEnd")
        lineAnimation.duration = animationTime
        lineAnimation.repeatCount = 1
        lineAnimation.keyTimes = [NSNumber(value: 0.0), NSNumber(value: 1.0)]
        lineAnimation.values = [NSNumber(value: 0.0), NSNumber(value: 1.0)]
    }
    @objc fileprivate func setupAnimationEnd() {
        //动画
        lineAnimationEnd = CAKeyframeAnimation(keyPath: "strokeEnd")
        lineAnimationEnd.duration = 1
        lineAnimationEnd.repeatCount = MAXFLOAT
        lineAnimationEnd.keyTimes = [NSNumber(value: 1.0), NSNumber(value: 1.0)]
        lineAnimationEnd.values = [NSNumber(value: 1.0), NSNumber(value: 1.0)]
        lineLayer.add(lineAnimationEnd, forKey: "lineAnimationEnd")
    }
}
