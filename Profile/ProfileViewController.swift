//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Oleg Stepanov on 29.03.2026.
//



import UIKit

class ProfileViewController: UIViewController {

    
    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 60
        imageView.clipsToBounds = true
        imageView.backgroundColor = .systemGray5
        imageView.image = UIImage(systemName: "person.crop.circle.fill")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Имя Фамилия"
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .label
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "@username"
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = .secondaryLabel
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let logoutButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Выйти", for: .normal)
        button.setTitleColor(.systemRed, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupActions()
        
        view.backgroundColor = .systemBackground
        title = "Профиль"
        
        navigationItem.hidesBackButton = false
    }

   
    private func setupUI() {
        view.addSubview(avatarImageView)
        view.addSubview(nameLabel)
        view.addSubview(usernameLabel)
        view.addSubview(logoutButton)
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            avatarImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            avatarImageView.widthAnchor.constraint(equalToConstant: 120),
            avatarImageView.heightAnchor.constraint(equalToConstant: 120),
            
            nameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            
            usernameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            usernameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            usernameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            
            logoutButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            logoutButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            logoutButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            logoutButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setupActions() {
        logoutButton.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
    }
    
   
    @objc private func logoutButtonTapped() {
        let alert = UIAlertController(title: "Выход",
                                    message: "Вы действительно хотите выйти?",
                                    preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel))
        alert.addAction(UIAlertAction(title: "Выйти", style: .destructive) { _ in
            self.navigateToLoginScreen()
        })
        
        present(alert, animated: true)
    }
    
    private func navigateToLoginScreen() {
        navigationController?.popToRootViewController(animated: true)
    }
}
