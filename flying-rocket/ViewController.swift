//
//  ViewController.swift
//  flying-rocket
//
//  Created by Rio on 06/11/18.
//  Copyright © 2018 Aurora. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var bgPowerDarkBlue: UIImageView!
    @IBOutlet weak var btnPower: UIButton!
    @IBOutlet weak var bgCloudHolder: UIView!
    @IBOutlet weak var ivRocket: UIImageView!
    @IBOutlet weak var lblRocket: UILabel!
    @IBOutlet weak var lblCycleRocket: UILabel!
    
    var player : AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let path = Bundle.main.path(forResource: "hustle-on", ofType: "wav")!
        let url = URL(fileURLWithPath: path)
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
        } catch let error as NSError {
            print(error.description)
        }
    }

    @IBAction func powerPressed(_ sender: Any) {
        bgCloudHolder.isHidden = false
        bgPowerDarkBlue.isHidden = true
        btnPower.isHidden = true
        
        player.play()
        
        UIView.animate(withDuration: 2.3, animations: {
            self.ivRocket.frame = CGRect(x: 0, y: 140, width: 381, height: 502)
        }) { (finished) in
            self.lblRocket.isHidden = false
            self.lblCycleRocket.isHidden = false
        }
        
    }
    
}

