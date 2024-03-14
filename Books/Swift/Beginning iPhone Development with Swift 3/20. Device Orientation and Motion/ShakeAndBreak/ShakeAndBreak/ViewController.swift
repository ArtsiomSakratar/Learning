//
//  ViewController.swift
//  ShakeAndBreak
//
//  Created by Artsiom Sakratar on 14/12/2021.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

	@IBOutlet var imageView: UIImageView!
	private var fixed: UIImage!
	private var broken: UIImage!
	private var brokenScreenShowing = false
	private var crashPlayer: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()

//		if let url = Bundle(for: type(of: self)).url(forResource:"glass", withExtension:"wav") {
//			do {
//				crashPlayer = AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav)
//			} catch let error as NSError {
//				print("Audio error! \(error.localizedDescription)")
//			}
//		}

		fixed = UIImage(named: "Home")
		broken = UIImage(named: "HomeBroken")
		imageView.image = fixed
    }

	override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
		if !brokenScreenShowing && motion == .motionShake {
			imageView.image = broken;
			crashPlayer?.play()
			brokenScreenShowing = true;
		}
	}

	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		imageView.image = fixed
		brokenScreenShowing = false
	}
}

