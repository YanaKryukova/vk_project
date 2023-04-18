//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Яна Крюкова on 14.04.2023.
//


import UIKit

class ProfileHeaderView: UIView {
    
    private let avatarImageView: UIImageView = {
        let catImage = UIImageView()
        catImage.layer.borderColor = UIColor.white.cgColor
        catImage.layer.borderWidth = 3
        catImage.layer.cornerRadius = 50
        catImage.image = UIImage(named: "grumpy")
        catImage.contentMode = .scaleAspectFill
        catImage.clipsToBounds = true
        catImage.translatesAutoresizingMaskIntoConstraints = false
        return catImage
        
    }()
    
    private let fullNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        label.text = "Grumpy Cat"
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    private let statusLabel: UILabel = {
        let text = UILabel()
        text.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        text.textColor = .gray
        text.text = "Just being grumpy..."
        text.clipsToBounds = true
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
        
    }()
    
    private let setStatusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Show status", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = .init(width: 4, height: 4)
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 4
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addSubviews()
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setConstrains()
        
        setStatusButton.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
    }
    
    private func addSubviews(){
        addSubview(avatarImageView)
        addSubview(fullNameLabel)
        addSubview(statusLabel)
        addSubview(setStatusButton)
        
    }
    private func setConstrains() {
        
        NSLayoutConstraint.activate([
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            avatarImageView.widthAnchor.constraint(equalToConstant: 100),
            avatarImageView.heightAnchor.constraint(equalToConstant: 100),
            
            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 20),
            fullNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 27),
            fullNameLabel.widthAnchor.constraint(equalToConstant: 150),
            
            setStatusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 16),
            setStatusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),
            
            statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 20),
            statusLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 34 ),
            statusLabel.widthAnchor.constraint(equalToConstant: 150)
            
        ])
    }
        
        @objc func tapButton() {
            if statusLabel.text != nil {
                print(statusLabel.text ?? "no data")
            }
        }
}

