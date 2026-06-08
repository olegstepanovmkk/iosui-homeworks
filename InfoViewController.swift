//
//  InfoViewController.swift
//  Navigation
//
//  Created by Oleg Stepanov on 22.03.2026.
//


import UIKit

class InfoViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Информация"
        
        let button = UIButton(type: .system)
        button.setTitle("Показать Alert", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
        button.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc private func showAlert() {
        let alert = UIAlertController(
            title: "Внимание",
            message: "Это тестовое сообщение.\nВыберите действие:",
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "OK", style: .default) { _ in
            print("Нажата кнопка OK")
        })
        
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel) { _ in
            print("Нажата кнопка Отмена")
        })
        
        present(alert, animated: true)
    }
}
