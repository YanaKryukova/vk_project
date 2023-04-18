//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Яна Крюкова on 14.04.2023.
//


import UIKit

class ProfileHeaderView: UIView {
    
    private let catView: UIImageView = {
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
    
    private let labelView: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        label.text = "Grumpy Cat"
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    private let secondLabelView: UILabel = {
        let text = UILabel()
        text.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        text.textColor = .gray
        text.text = "Just being grumpy..."
        text.clipsToBounds = true
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
        
    }()
    
    private let buttonView: UIButton = {
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
        setupAnyViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupAnyViews()
    }
    
    
    func setupAnyViews(){
        addSubview(catView)
        addSubview(labelView)
        addSubview(secondLabelView)
        addSubview(buttonView)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        buttonView.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            catView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            catView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            catView.widthAnchor.constraint(equalToConstant: 100),
            catView.heightAnchor.constraint(equalToConstant: 100),
            
            labelView.leadingAnchor.constraint(equalTo: catView.trailingAnchor, constant: 20),
            labelView.topAnchor.constraint(equalTo: topAnchor, constant: 27),
            labelView.widthAnchor.constraint(equalToConstant: 150),
            
            buttonView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            buttonView.topAnchor.constraint(equalTo: catView.bottomAnchor, constant: 16),
            buttonView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            buttonView.heightAnchor.constraint(equalToConstant: 50),
            
            secondLabelView.leadingAnchor.constraint(equalTo: catView.trailingAnchor, constant: 20),
            secondLabelView.topAnchor.constraint(equalTo: labelView.bottomAnchor, constant: 34 ),
            secondLabelView.widthAnchor.constraint(equalToConstant: 150)
            
        ])
    }
        
        @objc func tapButton() {
            if secondLabelView.text != nil {
                print(secondLabelView.text ?? "no data")
            }
        }
}

