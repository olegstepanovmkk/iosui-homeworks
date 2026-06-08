//
//  FeedViewController.swift
//  Navigation
//
//  Created by Oleg Stepanov on 22.03.2026.
//


import UIKit

class FeedViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Лента"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Открыть пост",
            style: .plain,
            target: self,
            action: #selector(openPost)
        )
    }
    
    @objc private func openPost() {
        let post = Post(title: "Важное объявление")
        
        let postVC = PostViewController()
        postVC.receivedPost = post
        
        navigationController?.pushViewController(postVC, animated: true)
    }
}
