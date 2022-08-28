//
//  ImageViewController.swift
//  TrendMedia
//
//  Created by useok on 2022/08/26.
//

import UIKit

class ImageViewController: BaseViewController {

    //MARK: 뷰 가져오기
    let imageView = ImageView()
    override func loadView() {
        super.view = imageView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(backButtonClicked))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "선택", style: .plain, target: self, action: #selector(saveButtonClicked))
        
        imageView.collectionView.delegate = self
        imageView.collectionView.dataSource = self
        imageView.collectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: ImageCollectionViewCell.reuseIdentifier)
    }
    
    @objc func backButtonClicked() {
        dismiss(animated: true)
    }
    @objc func saveButtonClicked() {
                
    }
    
    

}

extension ImageViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.reuseIdentifier, for: indexPath) as? ImageCollectionViewCell else {return UICollectionViewCell()}
        cell.backgroundColor = .blue
        return cell
        
    }
    
    
}
