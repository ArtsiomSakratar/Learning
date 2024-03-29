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
        
        let vertical = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.reportVerticalSwipe(_:)))
        vertical.direction = [.up, .down]
        view.addGestureRecognizer(vertical)
        
        let horizontal = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.reportHorizontalSwipe(_:)))
        horizontal.direction = [.left, .right]
        view.addGestureRecognizer(horizontal)
    }
    
    @objc func reportHorizontalSwipe(_ recognizer: UIGestureRecognizer) {
        label.text = "Horizontal swipe detected"
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(2 * NSEC_PER_SEC)) / Double(NSEC_PER_SEC), execute: {
            self.label.text = ""
        })
    }
    
    @objc func reportVerticalSwipe(_ recognizer: UIGestureRecognizer) {
        label.text = "Vertical swipe detected"
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(2 * NSEC_PER_SEC)) / Double(NSEC_PER_SEC), execute: {
            self.label.text = ""
        })
    }
    
    

}

