//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Яна Крюкова on 08.06.2023.
//

import UIKit

protocol CustomCellDelegate: AnyObject {
    func didTapImageInCell(_ image: UIImage?, frameImage: CGRect)
}

class PhotosCollectionViewCell: UICollectionViewCell {
    
    weak var delegate: CustomCellDelegate?
    
    private var indexPathCell = IndexPath()
    
    //MARK: - Properties
    
    var photosView: UIImageView = {
        let photosView = UIImageView()
        photosView.translatesAutoresizingMaskIntoConstraints = false
        photosView.contentMode = .scaleAspectFit
        photosView.isUserInteractionEnabled = true
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
        addGesture()
    }
    
    //MARK: - Func
    
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
        photosView.image = UIImage(named: model.image)
    }
    
    func setIndexPath(_ indexPath: IndexPath) {
        indexPathCell = indexPath
    }
    
    private func addGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        photosView.addGestureRecognizer(tapGesture)
    }
    
    @objc private func tapAction() {
        delegate?.didTapImageInCell(photosView.image, frameImage: photosView.frame)
    }
}
