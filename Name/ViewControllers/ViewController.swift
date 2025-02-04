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
    
    private let firstShadowView = ShadowView(imageName: ShadowViewType.dog.rawValue)
    private let secondShadowView = ShadowView(imageName: ShadowViewType.cat.rawValue)
    private let thirdShadowView = ShadowView(imageName: ShadowViewType.racoon.rawValue)
    
    private let firstButton = Button(buttonName: "Show New User", color: .red, isShadow: false)
    private let secondButton = Button(buttonName: "Hide User", color: .green, isShadow: true)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUsers()
        view.addGradient()
        view.addViews(views: [textLabel, stackView])
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
}

// MARK: - Nested Types

extension ViewController {
    enum ShadowViewType: String {
        case dog = "dog"
        case cat = "cat"
        case racoon = "racoon"
    }
}

// MARK: - Setup View

extension ViewController {
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
    }
    
    private func setupStackView() {
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        
        stackView.addArrangedSubview(firstButton)
        stackView.addArrangedSubview(secondButton)
        stackView.addSubview(views: firstShadowView, secondShadowView, thirdShadowView)
    }
}

// MARK: - Setup Layout

extension ViewController {
    private func setupLayout() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        textLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textLabel.heightAnchor.constraint(equalToConstant: 30),

            stackView.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 20),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            stackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5)
        ])
    }
}
