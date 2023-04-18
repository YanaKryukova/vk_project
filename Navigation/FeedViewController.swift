//
//  FeedViewController.swift
//  Navigation
//
//  Created by Яна Крюкова on 06.04.2023.
//

import UIKit

class FeedViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        title = "Feed"
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
        let _: UIButton = {
            let button = UIButton()
            button.frame = CGRect(origin: CGPoint(x: 120, y: 120), size: CGSize(width: 150, height: 30))
            button.setTitle("Post", for: .normal)
            button.backgroundColor = .systemPink
            
            view.addSubview(button)
            button.addTarget(self, action: #selector(post), for: .touchUpInside)
            return button
        }()
    }
    
    @objc func post() {
        
        let postViewController = PostViewController()
        postViewController.someInfo = "some info"
        
        navigationController?.pushViewController(postViewController, animated: true)
    }
}

