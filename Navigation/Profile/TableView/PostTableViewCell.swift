//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Яна Крюкова on 12.05.2023.
//


import UIKit

class PostTableViewCell: UITableViewCell {
    
    
    // MARK: - Properties
    
    
    var cellView: UIView = {
        let cellView = UIView()
        cellView.backgroundColor = .white
        cellView.translatesAutoresizingMaskIntoConstraints = false
        return cellView
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
    
    var likes: UILabel = {
        let likes = UILabel()
        likes.translatesAutoresizingMaskIntoConstraints = false
        likes.font = .systemFont(ofSize: 16, weight: .regular)
        likes.textColor = .black
        return likes
    }()
    
    var views: UILabel = {
        let views = UILabel()
        views.translatesAutoresizingMaskIntoConstraints = false
        views.font = .systemFont(ofSize: 16, weight: .regular)
        views.textColor = .black
        return views
    }()
    
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Methods
    
    override func prepareForReuse(){
        super.prepareForReuse()
        postImage.image = nil
        authorText.text = nil
        descriptionText.text = nil
        likes.text = nil
        views.text = nil
    }
    
    func setupSell(model: Post) {
        postImage.image = UIImage(named: model.image)
        authorText.text = model.author
        descriptionText.text = model.description
        likes.text = "Likes: " + String(model.likes)
        views.text = "Views: " + String(model.views)
    }
    
    private func addSubviews() {
        [cellView, authorText, descriptionText, postImage, likes, views].forEach {
            contentView.addSubview($0)
        }
    }
    
    
    // MARK: - Constraints
    
    private func setConstraints(){
        
        NSLayoutConstraint.activate([
            
            cellView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            authorText.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 15),
            authorText.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: Metric.textInset),
            authorText.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: 200),
            authorText.heightAnchor.constraint(equalToConstant: 30),
            
            postImage.topAnchor.constraint(equalTo: authorText.bottomAnchor, constant: Metric.imageInset),
            postImage.leadingAnchor.constraint(equalTo: cellView.leadingAnchor),
            postImage.trailingAnchor.constraint(equalTo: cellView.trailingAnchor),
            postImage.heightAnchor.constraint(equalToConstant: 200),
            
            descriptionText.topAnchor.constraint(equalTo: postImage.bottomAnchor),
            descriptionText.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: Metric.textInset),
            descriptionText.trailingAnchor.constraint(equalTo: cellView.trailingAnchor),
            descriptionText.heightAnchor.constraint(equalToConstant: Metric.heightAnchor),
            
            likes.topAnchor.constraint(equalTo: descriptionText.bottomAnchor),
            likes.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: Metric.textInset),
            likes.heightAnchor.constraint(equalToConstant: Metric.heightAnchor),
            likes.bottomAnchor.constraint(equalTo: cellView.bottomAnchor),
            
            views.topAnchor.constraint(equalTo: descriptionText.bottomAnchor),
            views.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -Metric.textInset),
            views.heightAnchor.constraint(equalToConstant: Metric.heightAnchor),
            views.bottomAnchor.constraint(equalTo: likes.bottomAnchor)
        ])
    }
}

extension PostTableViewCell {
    enum Metric {
        static let heightAnchor: CGFloat = 50
        static let imageInset: CGFloat = 15
        static let textInset: CGFloat = 20
    }
    
}
