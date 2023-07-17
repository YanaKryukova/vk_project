//
//  DetailViewController.swift
//  Navigation
//
//  Created by Яна Крюкова on 14.06.2023.
//

import UIKit

class DetailViewController: UIViewController {
    
    //MARK: - Properties
    
    private var indexPath = IndexPath()
    
    var moreViews: (() -> Void)? = nil
    
    weak var delegate: UITableViewDelegate?
    
    private let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var postImage: UIImageView = {
        let postImage = UIImageView()
        postImage.translatesAutoresizingMaskIntoConstraints = false
        postImage.contentMode = .scaleAspectFit
        postImage.backgroundColor = .black
        return postImage
    }()
    
    var authorText: UILabel = {
        let authorText = UILabel()
        authorText.translatesAutoresizingMaskIntoConstraints = false
        authorText.font = .systemFont(ofSize: 20, weight: .bold)
        authorText.textColor = .black
        authorText.numberOfLines = 2
        return authorText
    }()
    
    var descriptionText: UILabel = {
        let descriptionText = UILabel()
        descriptionText.translatesAutoresizingMaskIntoConstraints = false
        descriptionText.font = .systemFont(ofSize: 14, weight: .regular)
        descriptionText.textColor = .systemGray
        descriptionText.numberOfLines = 0
        return descriptionText
    }()
    
    private lazy var likes: UILabel = {
        let likes = UILabel()
        likes.translatesAutoresizingMaskIntoConstraints = false
        likes.font = .systemFont(ofSize: 16, weight: .regular)
        likes.textColor = .black
        likes.isUserInteractionEnabled = true
        return likes
    }()
    
    var views: UILabel = {
        let views = UILabel()
        views.translatesAutoresizingMaskIntoConstraints = false
        views.font = .systemFont(ofSize: 16, weight: .regular)
        views.textColor = .black
        return views
    }()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubviews()
        setupConstraints()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
        moreViews?()
        
    }
    
    //MARK: - Layout
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            authorText.topAnchor.constraint(equalTo: contentView.topAnchor),
            authorText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Metric.textInset),
            authorText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            authorText.heightAnchor.constraint(equalToConstant: 30),
            authorText.bottomAnchor.constraint(equalTo: postImage.topAnchor),
            
            postImage.topAnchor.constraint(equalTo: authorText.bottomAnchor),
            postImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            postImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            //postImage.heightAnchor.constraint(equalToConstant: 80),
            
            descriptionText.topAnchor.constraint(equalTo: postImage.bottomAnchor),
            descriptionText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Metric.textInset),
            descriptionText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            descriptionText.heightAnchor.constraint(equalToConstant: Metric.heightAnchor),
            
            likes.topAnchor.constraint(equalTo: descriptionText.bottomAnchor),
            likes.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Metric.textInset),
            likes.heightAnchor.constraint(equalToConstant: Metric.heightAnchor),
            likes.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            views.topAnchor.constraint(equalTo: descriptionText.bottomAnchor),
            views.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Metric.textInset),
            views.heightAnchor.constraint(equalToConstant: Metric.heightAnchor),
            views.bottomAnchor.constraint(equalTo: likes.bottomAnchor)
        ])
    }
    
    //MARK: - Func
    
    private func addSubviews(){
        view.addSubview(contentView)
        view.addSubview(authorText)
        view.addSubview(postImage)
        view.addSubview(descriptionText)
        view.addSubview(likes)
        view.addSubview(views)
    }
    
    
    func setupVC(model: Post, indexPath: IndexPath) {
        self.indexPath = indexPath
        postImage.image = UIImage(named: model.image)
        authorText.text = model.author
        descriptionText.text = model.description
        likes.text = "Likes: " + String(model.likes)
        views.text = "Views: " + String(model.views)
    }
}

    //MARK: - Extension

extension DetailViewController {
    enum Metric {
        static let heightAnchor: CGFloat = 50
        static let imageInset: CGFloat = 15
        static let textInset: CGFloat = 20
    }
}
    
    
