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
    
    private lazy var photoCollection: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        viewLayout.scrollDirection = .vertical
        let photoCollection = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        photoCollection.translatesAutoresizingMaskIntoConstraints = false
        photoCollection.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.identifier)
        photoCollection.delegate = self
        photoCollection.dataSource = self
        return photoCollection
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
    
    //MARK: - Methods
    
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
}
extension PhotosViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.identifier, for: indexPath) as! PhotosCollectionViewCell
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
