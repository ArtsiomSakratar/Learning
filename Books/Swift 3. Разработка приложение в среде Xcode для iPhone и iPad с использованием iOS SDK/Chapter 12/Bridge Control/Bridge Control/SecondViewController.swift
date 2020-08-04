//
//  SecondViewController.swift
//  Bridge Control
//
//  Created by Artsiom Sakratar on 8/3/20.
//  Copyright © 2020 Artsiom Sakratar. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet var engineSwitch: UISwitch!
    @IBOutlet var warpFactorSlider: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        refreshFields()
        
        let app = UIApplication.shared
        NotificationCenter.default.addObserver(self, selector: #selector(self.applicationWillEnterForeground(notification:)), name: Notification.Name.NSExtensionHostWillEnterForeground, object: app)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    func refreshFields() {
        let defaults = UserDefaults.standard
        engineSwitch.isOn = defaults.bool(forKey: warpDriveKey)
    }

    @IBAction func engineSwitchTapped(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(engineSwitch.isOn, forKey: warpDriveKey)
        defaults.synchronize()
    }
    
    @IBAction func warpSliderTouched(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(warpFactorSlider.value, forKey: warpFactorKey)
        defaults.synchronize()
    }
    
    @IBAction func onSettingButtonTapped(_ sender: Any) {
        let application = UIApplication.shared
        let url = URL(string: UIApplication.openSettingsURLString)! as URL
        if application.canOpenURL(url) {
            application.open(url, options: [:], completionHandler: nil)
        }
    }
    
    @objc func applicationWillEnterForeground(notification: NSNotification) {
        let defaults = UserDefaults.standard
        defaults.synchronize()
        refreshFields()
    }

}

