//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Яна Крюкова on 06.04.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private let profileHeaderView = ProfileHeaderView()
    
    private let emptyButton: UIButton = {
        let emptyButton = UIButton(type: .system)
        emptyButton.setTitle("empty button title", for: .normal)
        emptyButton.backgroundColor = .blue
        return emptyButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        title = "Profile"
        addSubviews()
        setConstrains()
    }
       
    private func addSubviews(){
        view.addSubview(profileHeaderView)
        view.addSubview(emptyButton)
    }
    
    
    private func setConstrains(){
        
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        emptyButton.translatesAutoresizingMaskIntoConstraints = false
            
        NSLayoutConstraint.activate([
            profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 200),
        
            emptyButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            emptyButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            emptyButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
}
