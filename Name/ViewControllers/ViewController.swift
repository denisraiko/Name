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
//    private let secondShadowView = ShadowView(imageName: ShadowViewType.cat.rawValue)
//    private let thirdShadowView = ShadowView(imageName: ShadowViewType.racoon.rawValue)
    
    private let numberButton = Button(buttonName: "Change Number", color: .red, isShadow: true)
    private let imageButton = Button(buttonName: "Change Image", color: .green, isShadow: true)
    
    private let showUserButton = Button(buttonName: "Show New User", color: .cyan, isShadow: false)
    private let hideUserButton = Button(buttonName: "Hide User", color: .blue, isShadow: false)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUsers()
        view.addGradient()
        view.addViews(views: [textLabel, stackView])
        setupTextLabel()
        setupStackView()
        setupLayout()
        addAction()
        addActionForUserLabel()
    }
    
    private func updateUsers() {
        let users = userRepository.getUsers()
        helper.addUsers(users)
        
        for user in helper.getUsers() {
            print("\(user.personInfo.firstName) \(user.personInfo.lastName)")
        }
    }
    
    private func updateNumbers() {
        helper.addNumber(Int.random(in: 1...10))
    }
    
    @objc func numberButtonTapped() {
        updateNumbers()
        textLabel.text = helper.getRandomNumber().formatted()
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
    }
    
    private func setupStackView() {
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = .equalSpacing
        
        stackView.addSubview(views: textLabel, firstShadowView, numberButton, imageButton, showUserButton, hideUserButton)
    }
    
    private func addAction() {
        numberButton.addTarget(self,
                               action: #selector(numberButtonTapped),
                               for: .touchUpInside)
        let action = UIAction { _ in
            let randomImage = [ShadowViewType.cat, ShadowViewType.dog, ShadowViewType.racoon].randomElement()
            self.firstShadowView.updateImage(randomImage?.rawValue ?? ShadowViewType.racoon.rawValue)
        }
        imageButton.addAction(action, for: .touchUpInside)
    }
    
    private func addActionForUserLabel() {
        let action = UIAction { _ in
            guard let randomUser = self.helper.getUsers().randomElement() else {
                self.textLabel.text = "Нет пользователей"
                return
            }
            self.textLabel.text = "\(randomUser.personInfo.firstName) \(randomUser.personInfo.lastName)"
        }
        showUserButton.addAction(action, for: .touchUpInside)
        
        let hideAction = UIAction { _ in
            self.textLabel.text = ""
        }
        hideUserButton.addAction(hideAction, for: .touchUpInside)
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
            
            firstShadowView.heightAnchor.constraint(equalTo: stackView.widthAnchor)
        ])
    }
}
