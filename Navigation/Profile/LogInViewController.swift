//
//  LogInViewController.swift
//  Navigation
//
//  Created by Яна Крюкова on 20.04.2023.
//

import Foundation
import UIKit


class LogInViewController: UIViewController, UITextFieldDelegate {
    
    let notificationCenter = NotificationCenter.default
    
    // MARK: - Properties
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    private let colorSet = UIColor(red: 0x48 / 255.0, green: 0x85 / 255.0, blue: 0xCC / 255.0, alpha: 1.0)
    
    private let line: UIView = {
        let line = UIView()
        line.translatesAutoresizingMaskIntoConstraints = false
        line.backgroundColor = .systemGray4
        return line
    }()
    
    private let logoView: UIImageView = {
        let logoView = UIImageView()
        logoView.image = UIImage(named: "vkLogo")
        logoView.contentMode = .scaleAspectFill
        logoView.clipsToBounds = true
        logoView.translatesAutoresizingMaskIntoConstraints = false
        return logoView
    }()
    
    private lazy var loginForm: UITextField = {
        let loginForm = UITextField()
        loginForm.placeholder = "Email of phone"
        loginForm.textColor = .black
        loginForm.font = .systemFont(ofSize: 16, weight: .medium)
        loginForm.tintColor = colorSet
        loginForm.autocapitalizationType = .none
        loginForm.textAlignment = .left
        loginForm.leftViewMode = .always
        loginForm.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        loginForm.translatesAutoresizingMaskIntoConstraints = false
        loginForm.delegate = self
        return loginForm
    }()
    
    private lazy var passwordForm: UITextField = {
           let passwordForm = UITextField()
           passwordForm.placeholder = "Password"
           passwordForm.textColor = .black
           passwordForm.font = .systemFont(ofSize: 16, weight: .medium)
           passwordForm.tintColor = colorSet
           passwordForm.autocapitalizationType = .none
           passwordForm.textAlignment = .left
           passwordForm.leftViewMode = .always
           passwordForm.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
           passwordForm.translatesAutoresizingMaskIntoConstraints = false
           passwordForm.isSecureTextEntry = true
           passwordForm.delegate = self
           return passwordForm
       }()
    
    
    private let stackTextField: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        stackView.layer.borderWidth = 0.5
        stackView.layer.cornerRadius = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.clipsToBounds = true
        return stackView
    }()
   
    
    private lazy var loginButton: UIButton = {
        let loginButton = UIButton(type: .system)
        loginButton.setBackgroundImage((UIImage(named: "bluePixel")), for: .normal)
        loginButton.layer.cornerRadius = 10
        loginButton.clipsToBounds = true
        loginButton.setTitle("Log In", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.tintColor = .white
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.addTarget(self, action: #selector(logIn), for: .touchUpInside)
        switch loginButton.state {
        case .normal: loginButton.alpha = 1
        case .selected: loginButton.alpha = 0.8
        case .highlighted: loginButton.alpha = 0.8
        case .disabled: loginButton.alpha = 0.8
        default: loginButton.alpha = 1
        }
        return loginButton
    }()
    
    // MARK: - Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardAppear), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        notificationCenter.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        notificationCenter.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func layout(){
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        scrollView.addSubview(logoView)
        stackTextField.addArrangedSubview(loginForm)
        stackTextField.addArrangedSubview(line)
        stackTextField.addArrangedSubview(passwordForm)
        scrollView.addSubview(stackTextField)
        scrollView.addSubview(loginButton)
    
        let safeAreaGuide = view.safeAreaLayoutGuide
        let widthInset = view.frame.width - 32
    
        
        NSLayoutConstraint.activate([
            
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor),
            
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            logoView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logoView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            logoView.heightAnchor.constraint(equalToConstant: 100),
            logoView.widthAnchor.constraint(equalToConstant: 100),

            loginForm.heightAnchor.constraint(equalToConstant: 50),
            
            
            passwordForm.topAnchor.constraint(equalTo: line.bottomAnchor, constant: 0),
            passwordForm.heightAnchor.constraint(equalToConstant: 49),
            
            line.topAnchor.constraint(equalTo: loginForm.bottomAnchor, constant: 0),
            line.heightAnchor.constraint(equalToConstant: 1),
            line.bottomAnchor.constraint(equalTo: passwordForm.topAnchor),
            
            stackTextField.topAnchor.constraint(equalTo: logoView.bottomAnchor, constant: 120),
            stackTextField.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            stackTextField.widthAnchor.constraint(equalToConstant: widthInset),
            
            
            loginButton.topAnchor.constraint(equalTo: passwordForm.bottomAnchor, constant: 16),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            loginButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            loginButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            loginButton.widthAnchor.constraint(equalToConstant: widthInset)
            
        ])
    }
    
    
    @objc private func logIn(){
        navigationController?.pushViewController(ProfileViewController(), animated: true)
        
    }
    
    @objc private func keyboardAppear(notification: NSNotification){
        if let keyboardSize: CGRect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = keyboardSize.height + loginButton.frame.height + 16
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0,
                                                                    left: 0,
                                                                    bottom: keyboardSize.height + loginButton.frame.height + 16,
                                                                    right: 0)
        }
        
    }
    
    @objc private func keyboardHide(){
        scrollView.contentInset.bottom = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }

}
