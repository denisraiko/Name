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
    
    private let textLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.textColor = .blue
        label.frame = CGRect(x: 100, y: 100, width: 100, height: 50)
        return label
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("Show FullName", for: .normal)
        button.backgroundColor = .green
        button.frame = CGRect(x: 100, y: 150, width: 150, height: 50)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUsers()
        view.backgroundColor = .yellow
        view.alpha = 1
        
        setupTextLabel(textLabel)
        setupButton(button)
    }
    
    private func updateUsers() {
        let users = userRepository.getUsers()
        helper.addUsers(users)
        
        
        for user in helper.getUsers() {
            print("\(user.personInfo.firstName) \(user.personInfo.lastName)")
        }
    }
    
    private func setupTextLabel(_ label: UILabel) {
        guard let randomUser = helper.getUsers().randomElement() else {
            textLabel.text = "Нет пользователей"
            return
        }
        textLabel.text = "\(randomUser.personInfo.firstName) \(randomUser.personInfo.lastName)"
        view.addSubview(textLabel)
    }
    
    private func setupButton(_ button: UIButton) {
        view.addSubview(button)
    }
}

