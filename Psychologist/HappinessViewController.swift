//
//  HappinessViewController.swift
//  Happiness
//
//  Created by chenjs on 15/3/29.
//  Copyright (c) 2015年 TOMMY. All rights reserved.
//

import UIKit

class HappinessViewController: UIViewController, FaceViewDataSource
{
    @IBOutlet weak var faceView: FaceView! {
        didSet {
            faceView.dataSource = self
            faceView.addGestureRecognizer(UIPinchGestureRecognizer(target: faceView, action: "scale:"))
            updateUI()
        }
    }
    
    var happiness: Int = 50 { // 0 = vary sad, 100 = ecstatic
        didSet {
            happiness = min(max(happiness, 0), 100)
            //println("happiness = \(happiness)")
            updateUI()
        }
    }
    
    func updateUI() {
        faceView?.setNeedsDisplay()
        title = "\(happiness)"
    }
    
    private struct Constants {
        static let HappinessGestureScale = 4
    }

    @IBAction func changeHappiness(gesture: UIPanGestureRecognizer) {
        switch gesture.state {
        case .Changed: fallthrough
        case .Ended:
            let translation = gesture.translationInView(faceView)
            let happinessChange = Int(translation.y) / Constants.HappinessGestureScale
            if happinessChange != 0 {
                happiness += happinessChange
                gesture.setTranslation(CGPointZero, inView: faceView)
            }
        default: break
        }
        
    }
    
    func smilinessForFaceview(faceView: FaceView) -> Double? {
        return Double(happiness - 50) / 50
    }
}
