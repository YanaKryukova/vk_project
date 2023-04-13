//
//  PostViewController.swift
//  Navigation
//
//  Created by Яна Крюкова on 09.04.2023.
//

import UIKit

class PostViewController: UIViewController {
    
    public var someInfo: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Post"
        
        let myButton = UIBarButtonItem(title: "Info", style: .plain, target: self, action:#selector(showInfoViewController))
        navigationItem.rightBarButtonItem = myButton
    }
    
    @objc func showInfoViewController(){
        let infoViewController = InfoViewController()
        present(infoViewController, animated: true)
    }
}

