//
//  CodeShoppingView.swift
//  TrendMedia
//
//  Created by useok on 2022/08/22.
//

import Foundation
import UIKit
import RealmSwift
import SnapKit

class CodeShoppingView: UIView{
    
    // MARK: 연결
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        setConstants()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: 크기
    
    let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer() // 텝재스쳐
    //입력 텍스트필드
    let inputTextField: UITextField = {
        let textField = CodeShppingTextField()
        textField.attributedPlaceholder =  NSAttributedString(string:  "무엇을 구매하실건가요?", attributes: [NSAttributedString.Key.foregroundColor : UIColor.systemGray])
        return textField
    }()
    // 추가 버튼
    let addButton: UIButton = {
        let button = CodeShoppingButton()
        button.setTitle("추가", for: .normal)
        return button
    }()

    // 상품 테이블뷰
    lazy var tableView: UITableView = {
        let view = UITableView()
        view.register(CodeShoppingTableViewCell.self, forCellReuseIdentifier: CodeShoppingTableViewCell.reuseIdentifier)
        
        view.backgroundColor = .black
        view.rowHeight = 30
        return view
    }()


    //MARK: 뷰 등록
    func configure() {
        [inputTextField,addButton,tableView].forEach {
            self.addSubview($0)
        }
    }

    //MARK: 위치
    func setConstants() {
        // 텍스트입력
        inputTextField.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide)
            $0.leading.equalTo(20)
            $0.trailing.equalTo(-20)
            $0.height.equalTo(40)
        }
        // 추가버튼
        addButton.snp.makeConstraints {
            $0.center.equalTo(inputTextField)
            $0.trailing.equalTo(inputTextField.snp.trailing)
            $0.width.equalTo(inputTextField.snp.width).multipliedBy(0.25)
        }

        tableView.snp.makeConstraints { make in
            make.top.equalTo(inputTextField.snp.bottom).offset(30)
            make.bottom.equalTo(30)
            make.leading.equalTo(10)
            make.trailing.equalTo(-10)
        }
    }
}
