//
//  ViewController.swift
//  Swipes
//
//  Created by Artsiom Sakratar on 11/12/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    
    private var gestureStartPoint: CGPoint!
    private static let minimumGestureLength = Float(25.0)
    private static let maximumVariance = Float(5)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            gestureStartPoint = touch.location(in: self.view)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first, let gestureStartPoint = self.gestureStartPoint {
            let currentPosition = touch.location(in: self.view)
            
            let deltaX = fabsf(Float(gestureStartPoint.x - currentPosition.x))
            let deltaY = fabsf(Float(gestureStartPoint.y - currentPosition.y))
            
            if deltaX >= ViewController.minimumGestureLength && deltaY <= ViewController.maximumVariance {
                label.text = "Horizotal swipe detected"
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(2 * NSEC_PER_SEC)) / Double(NSEC_PER_SEC), execute: {
                    self.label.text = ""
                })
            } else if deltaY >= ViewController.minimumGestureLength && deltaX <= ViewController.maximumVariance {
                label.text = "Vertical swipe detected"
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(2 * NSEC_PER_SEC)) / Double(NSEC_PER_SEC), execute: {
                    self.label.text = ""
                })
            }
        }
    }
    
    

}

