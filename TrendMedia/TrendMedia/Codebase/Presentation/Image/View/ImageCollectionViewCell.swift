//
//  ImageCollectionViewCell.swift
//  TrendMedia
//
//  Created by useok on 2022/08/26.
//

import UIKit
import SnapKit
import Kingfisher

class ImageCollectionViewCell: BaseCollectionViewCell {
    //MARK: 연결
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: 크기
    let searchImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleToFill
        return view
    }()
    
    //MARK: 뷰등록
    override func configure() {
        self.addSubview(searchImageView)
    }
    //MARK: 위치
    override func setConstraints() {
        searchImageView.snp.makeConstraints {
            $0.edges.equalTo(self)
        }
    }
    func setImage(data: String) {
        let url = URL(string: data)
        searchImageView.kf.setImage(with: url)
    }
}
