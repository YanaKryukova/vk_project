//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Яна Крюкова on 14.04.2023.
//


import UIKit

class ProfileHeaderView: UIView {
    
    //MARK: - Properties
    
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
    
    private lazy var statusTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 12
        textField.textColor = .black
        textField.textAlignment = .left
        textField.font = .systemFont(ofSize: 15, weight: .regular)
        textField.placeholder = " Set your status..."
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let setStatusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Set status", for: .normal)
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
    
    
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        statusButton()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    //MARK: - Func
    
    private func addSubviews(){
        addSubview(avatarImageView)
        addSubview(fullNameLabel)
        addSubview(statusLabel)
        addSubview(setStatusButton)
        addSubview(statusTextField)
        
    }
    
    private func statusButton(){
        setStatusButton.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
    }
    
    //MARK: - Constraints
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            
            avatarImageView.widthAnchor.constraint(equalToConstant: 100),
            avatarImageView.heightAnchor.constraint(equalToConstant: 100),
            avatarImageView.topAnchor.constraint(equalTo: topAnchor,constant: 16),
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 16),
            
            fullNameLabel.widthAnchor.constraint(equalToConstant: 100),
            fullNameLabel.topAnchor.constraint(equalTo: avatarImageView.topAnchor ,constant: 0),
            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor,constant: 20),
            fullNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -16),
            
            statusLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor,constant: 10),
            statusLabel.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor),
            statusLabel.trailingAnchor.constraint(equalTo: fullNameLabel.trailingAnchor),
            
            statusTextField.widthAnchor.constraint(equalTo: statusLabel.widthAnchor),
            statusTextField.heightAnchor.constraint(equalToConstant: 50),
            statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor,constant: 15),
            statusTextField.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor),
            statusTextField.trailingAnchor.constraint(equalTo: fullNameLabel.trailingAnchor),
            
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),
            setStatusButton.topAnchor.constraint(equalTo: statusTextField.bottomAnchor, constant: 15),
            setStatusButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            setStatusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            setStatusButton.trailingAnchor.constraint(equalTo: statusTextField.trailingAnchor)
        ])
    }
    //MARK: - Actions
    
    @objc func tapButton() {
        if statusLabel.text != nil {
            print(statusLabel.text ?? "no data")
        }
    }
}

