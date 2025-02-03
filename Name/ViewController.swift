//
//  ViewController.swift
//  Name
//
//  Created by Denis Raiko on 20.01.25.
//

import UIKit

class ViewController: UIViewController {
    
    private let helper = Helper()
    private let userRepository = UserRepository()
    
    private let textLabel = UILabel()
    private let button = UIButton()
    private let stackView = UIStackView()
    
    private let shadowView = ShadowView(imageName: "dog")
    private let secondShadowView = ShadowView(imageName: "cat")
    private let thirdShadowView = ShadowView(imageName: "racoon")

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUsers()
        addGradient()
        setupTextLabel()
        setupStackView()
        setupLayout()
        
    }
    
    private func updateUsers() {
        let users = userRepository.getUsers()
        helper.addUsers(users)
        
        for user in helper.getUsers() {
            print("\(user.personInfo.firstName) \(user.personInfo.lastName)")
        }
    }
    
    private func setupTextLabel() {
        textLabel.font = .systemFont(ofSize: 15)
        textLabel.textColor = .blue
        textLabel.frame = CGRect(x: 100, y: 100, width: 100, height: 50)
        textLabel.textAlignment = .center
        
        guard let randomUser = helper.getUsers().randomElement() else {
            textLabel.text = "Нет пользователей"
            return
        }
        textLabel.text = "\(randomUser.personInfo.firstName) \(randomUser.personInfo.lastName)"
        view.addSubview(textLabel)
    }
    
    //    private func setupButton(_ button: UIButton) {
    //        button.setTitle("Show Full Name", for: .normal)
    //        button.backgroundColor = .green
    //        button.frame = CGRect(x: 100, y: 150, width: 150, height: 50)
    //        button.layer.cornerRadius = 15
    //        view.addSubview(button)
    //    }
    
    private func setupStackView() {
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        
        stackView.addArrangedSubview(textLabel)
        stackView.addArrangedSubview(shadowView)
        stackView.addArrangedSubview(secondShadowView)
        stackView.addArrangedSubview(thirdShadowView)
        view.addSubview(stackView)
    }
    
    private func setupLayout() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            stackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.8),
        ])
    }
    
    private func addGradient() {
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [UIColor.green.cgColor, UIColor.blue.cgColor]
        gradient.opacity = 0.6
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        view.layer.insertSublayer(gradient, at: 0)
    }
    
}


