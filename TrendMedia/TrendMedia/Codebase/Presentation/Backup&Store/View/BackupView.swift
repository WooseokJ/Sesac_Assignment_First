//
//  BackupView.swift
//  TrendMedia
//
//  Created by useok on 2022/08/25.
//

import Foundation
import UIKit
import SnapKit

class BackupView: BaseView {
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
    // 뒤로가기
    let cancelButton: UIButton = {
       let button = CancelButton()
        return button
    }()
    // 백업버튼
    let backupButton: UIButton = {
        let button = UIButton()
        button.setTitle("백업", for: .normal)
        button.backgroundColor = .red
        return button
    }()
    // 복구버튼
    let storeButton: UIButton = {
        let button = UIButton()
        button.setTitle("복구", for: .normal)
        button.backgroundColor = .red
        return button
    }()
    
    lazy var tableview: UITableView = {
        let tableView = UITableView()
        tableView.register(BackupTableViewCell.self, forCellReuseIdentifier: BackupTableViewCell.reuseIdentifier)
        tableView.backgroundColor = .systemGray5
        return tableView
    }()

    //MARK: 뷰 등록 tableview
    override func configure() {
        [cancelButton,backupButton,storeButton,tableview].forEach {
            self.addSubview($0)
        }
    }
    //MARK: 위치
    override func setConstraints() {
        //뒤로가기버튼
        cancelButton.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide).offset(5)
            $0.leading.equalTo(self.safeAreaLayoutGuide).offset(5)
            $0.height.width.equalTo(50)
        }
        //백업버튼
        backupButton.snp.makeConstraints {
            $0.centerX.equalTo(self).multipliedBy(0.8)
            $0.top.equalTo(self.safeAreaLayoutGuide).offset(50)
            $0.width.equalTo(self).multipliedBy(0.15)
            $0.height.equalTo(self).multipliedBy(0.05)
        }
        //복구버튼
        storeButton.snp.makeConstraints {
            $0.centerX.equalTo(self).multipliedBy(1.2)
            $0.top.equalTo(backupButton.snp.top)
            $0.height.equalTo(backupButton.snp.height)
            $0.width.equalTo(backupButton.snp.width)
        }
        //테이블뷰 
        tableview.snp.makeConstraints {
            $0.top.equalTo(cancelButton.snp.bottom).offset(50)
            $0.leading.equalTo(20)
            $0.trailing.equalTo(-20)
            $0.bottom.equalTo(-40)
        }
    }
    
}

extension BackUpViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BackupTableViewCell.reuseIdentifier, for: indexPath) as? BackupTableViewCell else {return UITableViewCell()}
        cell.backgroundColor = .systemGray5
        return cell
    }
}
