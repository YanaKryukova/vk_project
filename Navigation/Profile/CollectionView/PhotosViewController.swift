//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Яна Крюкова on 08.06.2023.
//

import UIKit

class PhotosViewController: UIViewController {
    
    //MARK: - Properties
    
    private var photos = Photos.makePost()
    
    private var initialImageRect: CGRect = .zero
    
    private lazy var photoCollection: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        viewLayout.scrollDirection = .vertical
        let photoCollection = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        photoCollection.translatesAutoresizingMaskIntoConstraints = false
        photoCollection.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.identifier)
        photoCollection.delegate = self
        photoCollection.dataSource = self
        photoCollection.isUserInteractionEnabled = true
        return photoCollection
    }()
    
    private let blackView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        view.backgroundColor = .black
        view.alpha = 0.5
        return view
    }()
    
    private lazy var crossButton: UIButton = {
        let button = UIButton(frame: CGRect(x: UIScreen.main.bounds.width - 66, y: 110, width: 50, height: 50))
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.tintColor = .black
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(crossButtonAction), for: .touchUpInside)
        return button
    }()
    
    private let animatingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        return imageView
    }()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = false
        addSubviews()
        setConstraints()
        
        title = "Photo Gallery"
    }
    
    //MARK: - Func
    
    private func addSubviews(){
        view.addSubview(photoCollection)
        
    }
    
    private func setConstraints(){
        
        NSLayoutConstraint.activate([
            
            photoCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            photoCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            photoCollection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            photoCollection.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    @objc private func crossButtonAction() {
        crossButton.removeFromSuperview()
        blackView.removeFromSuperview()
        animateImageToInitial(rect: initialImageRect)
    }
    
    private func animateImage(_ image: UIImage?, imageFrame: CGRect) {
        view.addSubview(blackView)
        view.addSubview(crossButton)
        view.addSubview(animatingImageView)
        animatingImageView.image = image
        animatingImageView.alpha = 1.0
        animatingImageView.frame = CGRect(x: imageFrame.origin.x,
                                          y: imageFrame.origin.y,
                                          width: imageFrame.width,
                                          height: imageFrame.height)
        animatingImageView.center = view.center
        
        UIView.animate(withDuration: 0.6) {
            self.animatingImageView.frame.size = CGSize(width: UIScreen.main.bounds.width,
                                                        height: UIScreen.main.bounds.width)
            self.animatingImageView.center = self.view.center
        }
    }
    
    private func animateImageToInitial(rect: CGRect) {
        UIView.animate(withDuration: 0.6) {
            self.animatingImageView.frame = rect
            self.animatingImageView.center = self.view.center
            self.animatingImageView.layer.cornerRadius = 0
        } completion: { _ in
            self.animatingImageView.removeFromSuperview()
        }
    }
}

    //MARK: - Extensions

extension PhotosViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.identifier, for: indexPath) as! PhotosCollectionViewCell
        cell.delegate = self
        cell.setupCell(model: photos[indexPath.row])
        return cell
    }
}

extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    private var inset: CGFloat {return 8}
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - inset * 4) / 3
        return CGSize(width: width, height: width)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        inset
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        inset
    }
}

extension PhotosViewController: CustomCellDelegate {
    func didTapImageInCell(_ image: UIImage?, frameImage: CGRect) {
        initialImageRect = CGRect(x: frameImage.origin.x,
                                  y: frameImage.origin.y + frameImage.origin.y,
                                  width: frameImage.width,
                                  height: frameImage.height)
        animateImage(image, imageFrame: initialImageRect)
    }
}
    
    

