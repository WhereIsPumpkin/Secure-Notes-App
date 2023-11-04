//
//  LoginViewController.swift
//  Notes App
//
//  Created by Saba Gogrichiani on 05.11.23.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    private let mainStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 32
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isLayoutMarginsRelativeArrangement = true
        view.layoutMargins = UIEdgeInsets(top: 56, left: 16, bottom: 0, right: 16)
        
        return view
    }()
    
    private let logo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "TBC")
        imageView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 70).isActive = true
        
        return imageView
    }()
    
    private let welcomeStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .center
        view.spacing = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let accountStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "TBC x Academy"
        label.textColor = UIColor(red: 0, green: 165/255, blue: 231/255, alpha: 1)
        label.font = .systemFont(ofSize: 26, weight: UIFont.Weight(rawValue: 700))
        
        
        return label
    }()
    
    private let smallWelcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "We’re excited to see you!"
        label.font = .systemFont(ofSize: 13)
        label.textColor = UIColor(red: 80/255, green: 85/255, blue: 95/255, alpha: 1)
        
        return label
    }()
    
    private let accountInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "Account Information"
        label.font = .systemFont(ofSize: 12, weight: UIFont.Weight(rawValue: 700))
        label.textColor = UIColor(red: 80/255, green: 85/255, blue: 95/255, alpha: 1)
        
        
        return label
    }()
    
    private let usernameTextField: PaddedTextField = {
        let username = PaddedTextField()
        username.placeholder = "Username"
        username.textColor = UIColor(red: 118/255, green: 126/255, blue: 139/255, alpha: 1)
        username.backgroundColor = UIColor(red: 227/255, green: 229/255, blue: 232/255, alpha: 1)
        username.heightAnchor.constraint(equalToConstant: 46).isActive = true
        username.layer.cornerRadius = 4
        
        return username
    }()
    
    private let passwordTextField: PaddedTextField = {
        let password = PaddedTextField()
        password.placeholder = "Password"
        password.textColor = UIColor(red: 118/255, green: 126/255, blue: 139/255, alpha: 1)
        password.backgroundColor = UIColor(red: 227/255, green: 229/255, blue: 232/255, alpha: 1)
        password.heightAnchor.constraint(equalToConstant: 46).isActive = true
        password.layer.cornerRadius = 4
        
        return password
    }()
    
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.backgroundColor = UIColor(red: 90/255, green: 100/255, blue: 234/255, alpha: 1)
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.layer.cornerRadius = 4
        button.titleLabel?.font = .systemFont(ofSize: 13, weight: UIFont.Weight(rawValue: 700))
        return button
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        
    }
    
    func setUpView() {
        setUpSelfView()
        setUpMainStackView()
        setUpAccountStackView()
    }
    
    func setUpSelfView() {
        self.view.backgroundColor = .white
        view.addSubview(mainStackView)
    }
    
    func setUpMainStackView() {
        setUpMainStackViewHierarchy()
        setUpMainStackViewConstraints()
        setUpAccountStackView()
        setUpWelcomeStackView()
    }
    
    func setUpMainStackViewHierarchy() {
        mainStackView.addArrangedSubview(welcomeStackView)
        mainStackView.addArrangedSubview(accountStackView)
    }
    
    func setUpMainStackViewConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 0),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    func setUpAccountStackView() {
        setUpAccountStackViewHierarchy()
    }
    
    func setUpAccountStackViewHierarchy() {
        accountStackView.addArrangedSubview(accountInfoLabel)
        accountStackView.addArrangedSubview(usernameTextField)
        accountStackView.addArrangedSubview(passwordTextField)
        accountStackView.addArrangedSubview(loginButton)
    }
    
    func setUpWelcomeStackView() {
        setUpWelcomeStackViewHierarchy()
    }
    
    func setUpWelcomeStackViewHierarchy() {
        welcomeStackView.addArrangedSubview(logo)
        welcomeStackView.addArrangedSubview(welcomeLabel)
        welcomeStackView.addArrangedSubview(smallWelcomeLabel)
    }
    
    
    
}
