//
//  ViewController.swift
//  Mux Test
//
//  Created by Master on 2021/3/9.
//

import UIKit

class HomeViewController: BaseViewController {
    
}

extension HomeViewController {
    @IBAction func onScreen2(_ sender: Any) {
        performSegue(withIdentifier: "showScreen2", sender: nil)
    }
}
