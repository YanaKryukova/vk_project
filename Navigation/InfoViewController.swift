//
//  InfoViewController.swift
//  Navigation
//
//  Created by Яна Крюкова on 10.04.2023.
//

import UIKit
import SwiftUI

class InfoViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .magenta
        title = "Info"
        
        let alertButton = UIButton(type: .system)
        alertButton.frame = CGRect(x: 120, y: 120, width: 150, height: 30)
        alertButton.backgroundColor = .systemRed
        alertButton.setTitle("Alert", for: .normal)
        
        alertButton.addTarget(self, action: #selector(alertAction), for: .touchUpInside)
        view.addSubview(alertButton)
    }
    
    @objc func alertAction(){
        
        let alert = UIAlertController(title: "Post", message: "Create a post?", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default) {_ in
            print("Post created")}
        let cancel = UIAlertAction(title: "Cancel", style: .default) {_ in
            print("Nevermind")}
        
        alert.addAction(ok)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
}

