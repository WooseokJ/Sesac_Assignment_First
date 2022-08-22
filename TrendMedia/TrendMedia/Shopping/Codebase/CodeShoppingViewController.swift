//
//  CodeShoppingViewController.swift
//  TrendMedia
//
//  Created by useok on 2022/08/22.
//

import UIKit
import RealmSwift
class CodeShoppingViewController: UIViewController, UIGestureRecognizerDelegate {
    
    
    //MARK: 뷰 그리기
    let mainview = CodeShoppingView()

    override func loadView() {
        super.view = mainview
    }
    
    
    //MARK: DB 가져오기
    let localRealm = try! Realm()
    var tasks: Results<PurchaseInfo>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // 테이블뷰 연결
        mainview.tableView.backgroundColor = .black
        mainview.tableView.dataSource = self
        mainview.tableView.delegate = self
        
        
        
        self.navigationItem.title = "쇼핑"
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        self.view.addGestureRecognizer(mainview.tapGesture)
        
        mainview.addButton.addTarget(self, action: #selector(addButtonClicked), for: .touchUpInside)
        CodeShoppingTableViewCell().checkButton.addTarget(self, action: #selector(checkBoxClicked), for: .touchUpInside)
        CodeShoppingTableViewCell().starButton.addTarget(self, action: #selector(checkStarClicked), for: .touchUpInside)
        
        print("Realm is located at:", localRealm.configuration.fileURL!)
        
        let deleteInfo = localRealm.objects(PurchaseInfo.self)
        try! localRealm.write {
            localRealm.delete(deleteInfo)
        }
        
        //데이터 삭제하는 두번쨰방법
//        try! localRealm.write {
//            localRealm.deleteAll()
//        }
        
        
    }
    // 체크박스 클릭시
    @objc func checkBoxClicked() {
        
    }
    // 체크박스 즐겨찾기
    @objc func checkStarClicked(_ sender : UIButton) {
        let starStatus = tasks[sender.tag].checkStar ? false : true
        if starStatus {
            CodeShoppingTableViewCell().starButton.setImage(UIImage(systemName: "star"), for: .normal)
        }
        else {
            CodeShoppingTableViewCell().starButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        }
    }
    
    // 추가 버튼클릭시
    @objc func addButtonClicked() {
        guard let inputText = CodeShoppingTableViewCell().labelText.text else { return }
        let ta = PurchaseInfo(titleName: inputText)
        try! localRealm.write{
            localRealm.add(ta)
            print("추가 성공")
            tasks = localRealm.objects(PurchaseInfo.self)
            mainview.tableView.reloadData()
        }
        mainview.inputTextField.text = ""
    }
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive event: UIEvent) -> Bool {
        self.view.endEditing(true)
    }
}

