//
//  CodeShoppingDetailView.swift
//  TrendMedia
//
//  Created by useok on 2022/08/24.
//

import Foundation
import UIKit
import SnapKit

class DetailView: BaseView {
    
    //MARK: 연결
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: 크기
    // 선택한 텍스트라벨
    let textLabel: UILabel = {
       let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    // 이미지뷰
    let imageView: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .lightGray
        return image
    }()
    // 이미지버튼
    let imageButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.setImage(UIImage(systemName: "photo"), for: .normal)
        return button
    }()
    //MARK: 뷰 등록
    override func configure() {
        [textLabel,imageView,imageButton].forEach {
            self.addSubview($0)
        }
    }
    
    //MARK: 위치
    override func setConstraints() {
        // 텍스트라벨
        textLabel.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide)
            $0.height.equalTo(50)
            $0.centerX.equalTo(self)
            $0.trailing.equalTo(-20)
            $0.leading.equalTo(20)
        }
        // 이미지뷰
        imageView.snp.makeConstraints {
            $0.top.equalTo(textLabel.snp.bottom).offset(30)
            $0.trailing.equalTo(textLabel.snp.trailing)
            $0.leading.equalTo(textLabel.snp.leading)
            $0.centerX.equalTo(textLabel.snp.centerX)
            $0.bottom.equalTo(self.safeAreaLayoutGuide).offset(-40)
        }
        // 이미지 버튼
        imageButton.snp.makeConstraints {
            $0.bottom.equalTo(imageView.snp.bottom).offset(-20)
            $0.trailing.equalTo(imageView.snp.trailing).offset(-20)
            $0.height.equalTo(70)
            $0.width.equalTo(70)
        }
        
    }
    
    
}
