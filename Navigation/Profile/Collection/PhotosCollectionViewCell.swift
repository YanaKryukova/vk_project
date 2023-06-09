//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Яна Крюкова on 08.06.2023.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Properties
    
    var photosView: UIImageView = {
        let photosView = UIImageView()
        photosView.translatesAutoresizingMaskIntoConstraints = false
        photosView.contentMode = .scaleAspectFit
        return photosView
    }()
    
    //MARK: - Init
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        addSubviews()
        setConstraints()
    }
    
    //MARK: - Methods
    
    private func addSubviews() {
        contentView.addSubview(photosView)
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            
            photosView.topAnchor.constraint(equalTo: contentView.topAnchor),
            photosView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            photosView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photosView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    func setupCell(model: Photos) {
        photosView.image = UIImage(named: model.name)
    }
}
