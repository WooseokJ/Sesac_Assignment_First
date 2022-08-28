//
//  ImageView.swift
//  TrendMedia
//
//  Created by useok on 2022/08/26.
//

import Foundation
import UIKit
import SnapKit

class ImageView: BaseView {
    //MARK: VC 연결
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: 크기
    let searchBar: UISearchBar = {
       let view = UISearchBar()
        return view
    }()
    
    let collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: CollectionViewlayout())
        return view
    }()
    //MARK: 뷰등록
    override func configure() {
        [searchBar,collectionView].forEach {
            self.addSubview($0)
        }
    }
    
    //MARK: 위치
    override func setConstraints() {
        searchBar.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(self.safeAreaLayoutGuide)
            make.height.equalTo(40)
        }
        collectionView.snp.makeConstraints { make in
            make.bottom.leading.trailing.equalTo(self.safeAreaLayoutGuide)
            make.top.equalTo(searchBar.snp.bottom)
        }
    }
    
    
    //MARK: 컬렉션뷰 레이아웃
    static func CollectionViewlayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        let deviceWidth: CGFloat = UIScreen.main.bounds.width
        let itemWidth: CGFloat = deviceWidth / 3
        let spacing : CGFloat = 0
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth)
        layout.scrollDirection = .vertical
        return layout
    }
}
