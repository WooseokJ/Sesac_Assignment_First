//
//  ImageViewController.swift
//  TrendMedia
//
//  Created by useok on 2022/08/26.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher
import RealmSwift
class ImageViewController: BaseViewController {

    //MARK: 뷰 가져오기
    let imageView = ImageView()
    override func loadView() {
        super.view = imageView
    }
    var delegate: SelectImageDelegate? // 선택한 이미지 역전달
    var startPage: Int = 1 // 검색 이미지 시작 페이지번호
    var totalCount: Int = 0
    var selectedImage: String? //선택한 이미지 저장
    var selectIndexPath: IndexPath? // 인덱스페스 숫자 저장
    
    var imageData : [String] = [] //이미지 데이터 받기
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function)
        view.backgroundColor = .white
        // 네비바
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(backButtonClicked))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "선택", style: .plain, target: self, action: #selector(saveButtonClicked))
        // collectionview
        imageView.collectionView.delegate = self
        imageView.collectionView.dataSource = self
        imageView.collectionView.prefetchDataSource = self
        imageView.collectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: ImageCollectionViewCell.reuseIdentifier)
        // searchbar
        imageView.searchBar.delegate = self
        
    }
    // 뒤로가기 버튼클릭시
    @objc func backButtonClicked() {
        dismiss(animated: true)
    }
    //저장하기 버튼클릭시
    @objc func saveButtonClicked() {
        //이미지선택 안할시 else 실행
        guard let selectImage = selectedImage else {
            showAlert(title: "사진선택해줘요.")
            return
        }
        delegate?.sendImageData(image: selectImage) // 값전달
        dismiss(animated: true) // 닫기
        
    }
}

extension ImageViewController: UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDataSourcePrefetching{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.reuseIdentifier, for: indexPath) as? ImageCollectionViewCell else {return UICollectionViewCell()}

        // 셀이미지 띄우기
        let url = URL(string: imageData[indexPath.item])
        cell.searchImageView.kf.setImage(with: url)
        
        // 셀 선택시
        cell.layer.borderColor = (selectIndexPath == indexPath) ? UIColor.red.cgColor : nil // 선택된것만 붉은색, 아닌건 표시안함
        cell.layer.borderWidth = (selectIndexPath == indexPath) ? 4:0 //선택된건 굵기4, 안된건 0
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        for index in indexPaths {
            if (totalCount > index.count) && (imageData.count-2 == index.item) {
                startPage += 1
                addload()
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        guard let cell = collectionView.cellForItem(at: indexPath) as? ImageCollectionViewCell else {return}
        selectedImage = imageData[indexPath.row]
        selectIndexPath = indexPath
        imageView.collectionView.reloadData()
    }
    //두번선택시
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        selectedImage = nil
        selectIndexPath = nil
        imageView.collectionView.reloadData()
    }
}


extension ImageViewController: UISearchBarDelegate {

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        imageData.removeAll()
        searchReload()
    }
    
    func searchReload() {
        guard let query = imageView.searchBar.text else {return}
        APIManger.shared.request(page: startPage, query: query) { DataStruct,totalCount  in
            self.imageData = DataStruct
            self.totalCount = totalCount
            APIManger.shared.request(page: self.startPage+1, query: query) { imagedata, totalCount in
                self.imageData.append(contentsOf: imagedata)
            }
        }
        print("통신후 imageData.count:",imageData.count)
        DispatchQueue.main.async {
            self.imageView.collectionView.reloadData()
        }
    }
    func addload() {
        guard let query = imageView.searchBar.text else {return}
        APIManger.shared.request(page: startPage, query: query) { imagedata, totalCount in
            self.imageData.append(contentsOf: imagedata)
            DispatchQueue.main.async {
                self.imageView.collectionView.reloadData()
            }
        }
    }
    
    
    
}
