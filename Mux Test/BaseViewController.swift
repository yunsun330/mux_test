//
//  BaseViewController.swift
//  Mux Test
//
//  Created by Master on 2021/3/9.
//

import UIKit

class BaseViewController: UIViewController {
    @IBOutlet weak var playerView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if GlobalPlayer.sharedInstance.parentView == nil {
            layoutPlayer(animated: false)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if GlobalPlayer.sharedInstance.parentView != nil {
            layoutPlayer(animated: true)
        }
        GlobalPlayer.sharedInstance.player.play()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        if let window = UIApplication.shared.windows.last {
            GlobalPlayer.sharedInstance.player.addAsSubview(of: window)
            GlobalPlayer.sharedInstance.parentView = window
            GlobalPlayer.sharedInstance.player.frame = self.playerView.convert(self.playerView.bounds, to: window)
        }
        GlobalPlayer.sharedInstance.player.pause()
    }
}

extension BaseViewController {
    @objc private func layoutPlayer(animated: Bool) {
        if let window = UIApplication.shared.windows.last {
            GlobalPlayer.sharedInstance.player.addAsSubview(of: window)
            GlobalPlayer.sharedInstance.parentView = window
            UIView.animate(withDuration: animated ? 0.2 : 0) {
                GlobalPlayer.sharedInstance.player.frame = self.playerView.convert(self.playerView.bounds, to: window)
            }
        } else {
            GlobalPlayer.sharedInstance.player.addAsSubview(of: playerView)
            GlobalPlayer.sharedInstance.parentView = playerView
            UIView.animate(withDuration: animated ? 0.2 : 0) {
                GlobalPlayer.sharedInstance.player.frame = self.playerView.bounds
            }
        }
    }
}
