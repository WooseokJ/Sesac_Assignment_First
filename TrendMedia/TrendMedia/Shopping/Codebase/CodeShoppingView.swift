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
        textField.attributedPlaceholder =  NSAttributedString(string:  "무엇을 구매하실건가요?", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        return textField
    }()
    // 추가 버튼
    let addButton: UIButton = {
        let button = CodeShoppingButton()
        button.setTitle("추가", for: .normal)
        return button
    }()

    // 상품 테이블뷰
    let tableView: UITableView = {
        let view = UITableView()
        view.register(CodeShoppingTableViewCell.self, forCellReuseIdentifier: CodeShoppingTableViewCell.identifier)
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

extension CodeShoppingViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let taskCount = tasks else { return 0 }
        return taskCount.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CodeShoppingTableViewCell.identifier, for: indexPath) as! CodeShoppingTableViewCell
        if tasks == nil {
            return cell
        }
        cell.labelText.text = tasks[indexPath.row].titleName
        cell.backgroundColor = .lightGray
        cell.starButton.tag = indexPath.row
        cell.checkButton.tag = indexPath.row
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let item = tasks?[indexPath.row]
            try! localRealm.write {
                localRealm.delete(item!)
            }
            tableView.reloadData()
        }
    }
    

    
    
}


