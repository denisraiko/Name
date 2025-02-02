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
        label.textAlignment = .center
        return label
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("Show Full Name", for: .normal)
        button.backgroundColor = .green
        button.frame = CGRect(x: 100, y: 150, width: 150, height: 50)
        button.layer.cornerRadius = 15
        return button
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "dog")
        imageView.frame = CGRect(x: 0, y: 0, width: 200, height: 140)
        imageView.layer.cornerRadius = 15
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let imageContainerView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 100, y: 300, width: 200, height: 140)
        view.layer.masksToBounds = false
        return view
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUsers()
        view.backgroundColor = .yellow
        view.alpha = 1
        
        setupTextLabel(textLabel)
        setupButton(button)
        setupImageView()
        setupStackView()
        setupLayout()
        
        imageContainerView.addShadow(color: .black, offset: CGSize(width: 5, height: 5), opacity: 0.5, radius: imageView.layer.cornerRadius)
    
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
    
    private func setupImageView() {
        imageContainerView.addSubview(imageView)
    }
    
    private func setupStackView() {
        stackView.addArrangedSubview(textLabel)
        stackView.addArrangedSubview(button)
        stackView.addArrangedSubview(imageContainerView)
        view.addSubview(stackView)
    }
    
    private func setupLayout() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.widthAnchor.constraint(equalToConstant: 200),
            stackView.heightAnchor.constraint(equalToConstant: 400),
            
            imageView.topAnchor.constraint(equalTo: imageContainerView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: imageContainerView.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: imageContainerView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: imageContainerView.trailingAnchor)
        ])
        
        
        
    }
    
}

extension UIView {
    func addShadow(color: UIColor, offset: CGSize, opacity: Float, radius: CGFloat) {
        layer.shadowColor = color.cgColor
        layer.shadowOffset = offset
        layer.shadowOpacity = opacity
        layer.cornerRadius = radius
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: radius).cgPath
    }
}

