//
//  YellowViewController.swift
//  View Switcher
//
//  Created by Artsiom Sakratar on 6/5/20.
//  Copyright © 2020 Artsiom Sakratar. All rights reserved.
//

import UIKit

class YellowViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func yellowButtonPressed(sender: UIButton) {
        let alert = UIAlertController(title: "Yellow View Button Pressed", message: "You pressed the button on the yellow view", preferredStyle: .alert)
        let action = UIAlertAction(title: "Yes, I did", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}
