//
//  ViewController.swift
//  Swipes
//
//  Created by Artsiom Sakratar on 11/12/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for touchCount in 0..<5 {
            let vertical = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.reportVerticalSwipe(_:)))
            vertical.direction = [.up, .down]
            vertical.numberOfTouchesRequired = touchCount
            view.addGestureRecognizer(vertical)
            
            let horizontal = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.reportHorizontalSwipe(_:)))
            horizontal.direction = [.left, .right]
            horizontal.numberOfTouchesRequired = touchCount
            view.addGestureRecognizer(horizontal)
        }
    }
    
    func descriptionForTouchCount (_ touchCount: Int) -> String {
        switch touchCount {
        case 1:
            return "Single"
        case 2:
            return "Double"
        case 3:
            return "Triple"
        case 4:
            return "Quadruple"
        case 5:
            return "Quintuple"
        default:
            return ""
        }
    }
    
    @objc func reportHorizontalSwipe(_ recognizer: UIGestureRecognizer) {
        label.text = "Horizontal swipe detected"
        let count = descriptionForTouchCount(recognizer.numberOfTouches)
        label.text = "\(count) - finger horizontal swipe detected"
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(2 * NSEC_PER_SEC)) / Double(NSEC_PER_SEC), execute: {
            self.label.text = ""
        })
    }
    
    @objc func reportVerticalSwipe(_ recognizer: UIGestureRecognizer) {
        label.text = "Vertical swipe detected"
        let count = descriptionForTouchCount(recognizer.numberOfTouches)
        label.text = "\(count) - finger vertical swipe detected"
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(2 * NSEC_PER_SEC)) / Double(NSEC_PER_SEC), execute: {
            self.label.text = ""
        })
    }
    
    
    
}

