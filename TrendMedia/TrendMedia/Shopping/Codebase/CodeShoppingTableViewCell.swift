//
//  CodeShoppingTableViewCell.swift
//  TrendMedia
//
//  Created by useok on 2022/08/22.
//

import UIKit
import SnapKit

class CodeShoppingTableViewCell: UITableViewCell {
    static let identifier = "CodeShoppingTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addContentView()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 라벨
    let labelText: UILabel = {
        let label = UILabel()
        
        return label
    }()
    // 체크버튼
    let checkButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
        button.tintColor = .black
        
        return button
    }()
    //  별 버튼
    let starButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "star"), for: .normal)
        button.tintColor = .black
        
        return button
    }()

    
    func addContentView() {
        [labelText,checkButton,starButton].forEach {
            self.addSubview($0)
        }
    }
    func setLayout() {
        // 라벨
        labelText.snp.makeConstraints {
            
            
            $0.leading.equalTo(checkButton.snp.trailing)
            $0.trailing.equalTo(starButton.snp.leading)
            $0.top.equalTo(0)
            $0.bottom.equalTo(0)
            
        }
        // 체크박스
        checkButton.snp.makeConstraints {
            $0.leading.equalTo(self.safeAreaLayoutGuide).offset(10)
            $0.top.equalTo(self.safeAreaLayoutGuide)
            $0.bottom.equalTo(self.safeAreaLayoutGuide)
            $0.width.equalTo(50)
        }
        // 별 버튼
        starButton.snp.makeConstraints {
            $0.trailing.equalTo(self.safeAreaLayoutGuide).offset(-10)
            $0.top.equalTo(self.safeAreaLayoutGuide)
            $0.bottom.equalTo(self.safeAreaLayoutGuide)
            $0.width.equalTo(50)
        }
    }
    
}
