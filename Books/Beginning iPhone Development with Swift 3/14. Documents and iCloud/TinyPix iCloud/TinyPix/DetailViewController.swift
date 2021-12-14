//
//  DetailViewController.swift
//  TinyPix
//
//  Created by Artsiom Sakratar on 20.01.21.
//  Copyright © 2021 Artsiom Sakratar. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

//    @IBOutlet weak var detailDescriptionLabel: UILabel!
    @IBOutlet weak var pixView: TinyPixView!
    

    func configureView() {
        // Update the user interface for the detail item.
        if detailItem != nil && isViewLoaded {
            pixView.document = detailItem! as! TinyPixDocument
            pixView.setNeedsDisplay()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureView()
        updateTintColor()
        NotificationCenter.default.addObserver(self, selector: #selector(DetailViewController.onSettingsChanged(_:)), name: UserDefaults.didChangeNotification , object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let doc = detailItem as? UIDocument {
            doc.close(completionHandler: nil)
        }
    }

    var detailItem: Event? {
        didSet {
            // Update the view.
            configureView()
        }
    }

    private func updateTintColor() {
        let prefs = UserDefaults.standard
        let selectedColorIndex = prefs.integer(forKey: "selectedColorIndex")
        let tintColor = TinyPixUtils.getTintColorForIndex(selectedColorIndex)
        pixView.tintColor = tintColor
        pixView.setNeedsDisplay()
    }
    
    @objc func onSettingsChanged(_ notification: Notification) {
        updateTintColor()
    }

    deinit {
        NotificationCenter.default.removeObserver(self, name: UserDefaults.didChangeNotification, object: nil)
    }
}

