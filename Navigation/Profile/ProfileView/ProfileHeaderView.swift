//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Яна Крюкова on 14.04.2023.
//


import UIKit

class ProfileHeaderView: UIView {
    
    //MARK: - Properties
    
    private let avatarAnimationView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let transparent: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        view.layer.opacity = 0.5
        view.isHidden = true
        return view
    }()
    
    private lazy var avatarImageView: UIImageView = {
        let catImage = UIImageView()
        catImage.layer.borderColor = UIColor.white.cgColor
        catImage.layer.borderWidth = 3
        catImage.layer.cornerRadius = 50
        catImage.image = UIImage(named: "grumpy")
        catImage.contentMode = .scaleAspectFill
        catImage.clipsToBounds = true
        catImage.translatesAutoresizingMaskIntoConstraints = false
        catImage.isUserInteractionEnabled = true
        catImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapAvatar)))
        return catImage
    }()
    
    private lazy var closeAnimation: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "xmark.app")
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.tintColor = .black
        view.layer.opacity = 0
        view.layer.borderColor = UIColor.black.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapCloseAvatar)))
        return view
    }()
    
    
    private let fullNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        label.text = "Grumpy Cat"
        //label.clipsToBounds = true
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
    
    
    private var leadingAvatarView = NSLayoutConstraint()
    private var trailingAvatarView = NSLayoutConstraint()
    private var topAvatarView = NSLayoutConstraint()
    private var widthAvatarView = NSLayoutConstraint()
    private var heightAvatarView = NSLayoutConstraint()
    private var heightTransparent = NSLayoutConstraint()
    
    
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
        
        addSubview(fullNameLabel)
        addSubview(statusLabel)
        addSubview(setStatusButton)
        addSubview(statusTextField)
        addSubview(avatarAnimationView)
        addSubview(transparent)
        addSubview(avatarImageView)
        addSubview(closeAnimation)
        
        
    }
    
    private func statusButton(){
        setStatusButton.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
    }
    
    //MARK: - Constraints
    
    private func setConstraints() {
        
        leadingAvatarView = avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)
        topAvatarView = avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16)
        widthAvatarView = avatarImageView.widthAnchor.constraint(equalToConstant: 95)
        heightAvatarView = avatarImageView.heightAnchor.constraint(equalToConstant: 95)
        heightTransparent = transparent.heightAnchor.constraint(equalToConstant: 0)
        NSLayoutConstraint.activate([leadingAvatarView, topAvatarView, widthAvatarView, heightAvatarView, heightTransparent])
        
        NSLayoutConstraint.activate([
            
            transparent.leadingAnchor.constraint(equalTo: leadingAnchor),
            transparent.topAnchor.constraint(equalTo: topAnchor),
            transparent.trailingAnchor.constraint(equalTo: trailingAnchor),
                        
            avatarAnimationView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            avatarAnimationView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            avatarAnimationView.widthAnchor.constraint(equalToConstant: 95),
            avatarAnimationView.heightAnchor.constraint(equalToConstant: 95),
            
            
            closeAnimation.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            closeAnimation.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            closeAnimation.widthAnchor.constraint(equalToConstant: 30),
            closeAnimation.heightAnchor.constraint(equalToConstant: 30),
            
            
            fullNameLabel.widthAnchor.constraint(equalToConstant: 100),
            fullNameLabel.topAnchor.constraint(equalTo: avatarAnimationView.topAnchor ,constant: 0),
            fullNameLabel.leadingAnchor.constraint(equalTo: avatarAnimationView.trailingAnchor,constant: 20),
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
    
    @objc func tapAvatar(){
        
        UIView.animateKeyframes(withDuration: 0.8, delay: 0) {
            
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.6) {
                self.transparent.isHidden = false
                
                self.widthAvatarView.constant = UIScreen.main.bounds.width - 60
                self.leadingAvatarView.constant = 30
                self.trailingAvatarView.constant = 30
                self.topAvatarView.constant = 30
                self.heightAvatarView.constant = UIScreen.main.bounds.height - 220
                self.heightTransparent.constant = UIScreen.main.bounds.height
                self.avatarImageView.layer.cornerRadius = 0
                
                self.avatarAnimationView.layoutIfNeeded()
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.6, relativeDuration: 0.8) {
                self.closeAnimation.layer.opacity = 1
                self.transparent.layer.opacity = 0.3
            }
        }
    }
    
    
    @objc func tapCloseAvatar(){
        
        UIView.animateKeyframes(withDuration: 0.4, delay: 0){
            
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.5) {
                self.closeAnimation.layer.opacity = 0
                self.transparent.layer.opacity = 0
            }
            UIView.addKeyframe(withRelativeStartTime: 0.4, relativeDuration: 0.5) {
                self.transparent.isHidden = true
                
                
                self.heightTransparent.constant = UIScreen.main.bounds.height
                self.widthAvatarView.constant = 95
                self.leadingAvatarView.constant = 16
                self.trailingAvatarView.constant = 30
                self.topAvatarView.constant = 16
                self.heightAvatarView.constant = 95
            }
        }
    }
    
}
