//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Яна Крюкова on 07.06.2023.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    var photoView1, photoView2, photoView3, photoView4: UIImageView!
    
    var photosCollectionView: UIView = {
        let photosCollectionView = UIView()
        photosCollectionView.translatesAutoresizingMaskIntoConstraints = false
        return photosCollectionView
    }()
    
    var photosImage: UIImageView = {
        let photosImage = UIImageView()
        photosImage.translatesAutoresizingMaskIntoConstraints = false
        photosImage.contentMode = .scaleAspectFit
        photosImage.backgroundColor = .black
        photosImage.layer.cornerRadius = 6
        return photosImage
    }()
    
    var arrowImage: UIImageView = {
        let arrowImage = UIImageView()
        arrowImage.image = UIImage(systemName: "arrow.right")
        arrowImage.tintColor = .black
        arrowImage.translatesAutoresizingMaskIntoConstraints = false
        arrowImage.clipsToBounds = true
        arrowImage.contentMode = .scaleAspectFill
        return arrowImage
    }()
    
    var headerLabel: UILabel = {
        let headerLabel = UILabel()
        headerLabel.text = "Photos"
        headerLabel.textColor = .black
        headerLabel.font = .systemFont(ofSize: 24, weight: .bold)
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        return headerLabel
    }()
    
    // MARK: - Init
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        showPhotos()
        addSubviews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    private func showPhotos(){
        photoView1 = createImageView(nameImageView: "photoView1", nameImage: "cat1")
        photoView2 = createImageView(nameImageView: "photoView2", nameImage: "cat2")
        photoView3 = createImageView(nameImageView: "photoView3", nameImage: "cat3")
        photoView4 = createImageView(nameImageView: "photoView4", nameImage: "cat4")
    }
    
    private func addSubviews(){
        contentView.addSubview(photosCollectionView)
        contentView.addSubview(arrowImage)
        contentView.addSubview(headerLabel)
        contentView.addSubview(photoView1)
        contentView.addSubview(photoView2)
        contentView.addSubview(photoView3)
        contentView.addSubview(photoView4)
    }
    
    private func setConstraints(){
        
        let photoSize: CGFloat = contentView.frame.width / 4
        let photoInset: CGFloat = 12
        let labelInset: CGFloat = 12
        let photoLeftInset: CGFloat = 9
        let arrowInset: CGFloat = 30
        
        NSLayoutConstraint.activate([
            
            photosCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            photosCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            photosCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photosCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            headerLabel.topAnchor.constraint(equalTo: photosCollectionView.topAnchor, constant: labelInset),
            headerLabel.leadingAnchor.constraint(equalTo: photosCollectionView.leadingAnchor, constant: labelInset),
            
            arrowImage.widthAnchor.constraint(equalToConstant: arrowInset),
            arrowImage.trailingAnchor.constraint(equalTo: photosCollectionView.trailingAnchor, constant: -12),
            arrowImage.centerYAnchor.constraint(equalTo: headerLabel.centerYAnchor),
            
            photoView1.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: photoInset),
            photoView1.leadingAnchor.constraint(equalTo: photosCollectionView.leadingAnchor, constant: photoInset),
            photoView1.bottomAnchor.constraint(equalTo: photosCollectionView.bottomAnchor, constant: -photoInset),
            photoView1.widthAnchor.constraint(equalToConstant: photoSize),
            photoView1.heightAnchor.constraint(equalToConstant: photoSize),
            
            photoView2.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: photoInset),
            photoView2.leadingAnchor.constraint(equalTo: photoView1.trailingAnchor, constant: photoLeftInset),
            photoView2.bottomAnchor.constraint(equalTo: photosCollectionView.bottomAnchor, constant: -photoInset),
            photoView2.widthAnchor.constraint(equalToConstant: photoSize),
            photoView2.heightAnchor.constraint(equalToConstant: photoSize),
            
            photoView3.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: photoInset),
            photoView3.leadingAnchor.constraint(equalTo: photoView2.trailingAnchor, constant: photoLeftInset),
            photoView3.bottomAnchor.constraint(equalTo: photosCollectionView.bottomAnchor, constant: -photoInset),
            photoView3.widthAnchor.constraint(equalToConstant: photoSize),
            photoView3.heightAnchor.constraint(equalToConstant: photoSize),
            
            photoView4.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: photoInset),
            photoView4.leadingAnchor.constraint(equalTo: photoView3.trailingAnchor, constant: photoLeftInset),
            photoView4.bottomAnchor.constraint(equalTo: photosCollectionView.bottomAnchor, constant: -photoInset),
            photoView4.widthAnchor.constraint(equalToConstant: photoSize),
            photoView4.heightAnchor.constraint(equalToConstant: photoSize),
            
            
            
        ])
    }
}

extension PhotosTableViewCell {
    func createImageView(nameImageView: String, nameImage: String) -> UIImageView {
        
        let nameImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.layer.borderColor = UIColor.white.cgColor
            imageView.layer.borderWidth = 3
            imageView.layer.cornerRadius = 6
            imageView.image = UIImage(named: nameImage)
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        return nameImageView
    }
}
