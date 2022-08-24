//
//  CodeShoppingDetailView.swift
//  TrendMedia
//
//  Created by useok on 2022/08/24.
//

import Foundation
import UIKit
import SnapKit

class CodeShoppingDetailView: UIView {
    
    //MARK: 연결
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        setConstants()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: 크기
    let textLabel: UILabel = {
       let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.backgroundColor = .yellow
        return label
    }()
    
    let imageView: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .green
        return image
    }()
    
    let imageButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.setImage(UIImage(systemName: "photo"), for: .normal)
        return button
    }()
    //MARK: 뷰 등록
    func configure() {
        [textLabel,imageView,imageButton].forEach {
            self.addSubview($0)
        }
    }
    
    
    
    //MARK: 위치
    func setConstants() {
        textLabel.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide)
            $0.height.equalTo(50)
            $0.centerX.equalTo(self)
            $0.trailing.equalTo(-20)
            $0.leading.equalTo(20)
        }
        
        imageView.snp.makeConstraints {
            $0.top.equalTo(textLabel.snp.bottom).offset(30)
            $0.trailing.equalTo(textLabel.snp.trailing)
            $0.leading.equalTo(textLabel.snp.leading)
            $0.centerX.equalTo(textLabel.snp.centerX)
            $0.bottom.equalTo(self.safeAreaLayoutGuide).offset(-40)
        }
        imageButton.snp.makeConstraints {
            $0.bottom.equalTo(imageView.snp.bottom).offset(-20)
            $0.trailing.equalTo(imageView.snp.trailing).offset(-20)
            $0.height.equalTo(70)
            $0.width.equalTo(70)
        }
        
    }
    
    
}
