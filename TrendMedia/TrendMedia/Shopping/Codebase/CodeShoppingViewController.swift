//
//  CodeShoppingViewController.swift
//  TrendMedia
//
//  Created by useok on 2022/08/22.
//

import UIKit
import RealmSwift
import SnapKit

class CodeShoppingViewController: UIViewController, UIGestureRecognizerDelegate {
    
    
    //MARK: 뷰 그리기
    let mainview = CodeShoppingView()
    
    override func loadView() {
        super.view = mainview
    }
    
    
    //MARK: DB 가져오기
    let localRealm = try! Realm()
    var tasks: Results<PurchaseInfo>! {
        didSet {
            mainview.tableView.reloadData()
            print("table view reloadData")
        }
    }
    // 정렬메뉴 액션
    var menuSortedItems: [UIAction] {
        return [
            UIAction(title: "이름순정렬", image: UIImage(systemName: "star.fill"), handler: { [self] _ in
                tasks = localRealm.objects(PurchaseInfo.self).sorted(byKeyPath: "titleName", ascending: true)
            }),
            UIAction(title: "즐겨찾기순", image: UIImage(systemName: "star.fill"), handler: { [self] _ in
                tasks = localRealm.objects(PurchaseInfo.self).sorted(byKeyPath: "checkStar", ascending: false)
            }),
            UIAction(title: "체크박스순", image: UIImage(systemName: "star.fill"), handler: { [self] _ in
                tasks = localRealm.objects(PurchaseInfo.self).sorted(byKeyPath: "checkBox", ascending: false)
            })
        ]
    }
    // 정렬메뉴
    var sortMenu: UIMenu {
        return UIMenu(title: "", image: nil, identifier: nil, options: [], children: menuSortedItems)
    }
    // 필터메뉴 액션
    var menuFilterItems: [UIAction] {
        return [
            UIAction(title: "A글자포함", image: UIImage(systemName: "star"), handler: { [self] _ in
                tasks = localRealm.objects(PurchaseInfo.self).filter("titleName CONTAINS[c] 'A'")
            }),
            UIAction(title: "B글자포함", image: UIImage(systemName: "star"), handler: { [self] _ in
                tasks = localRealm.objects(PurchaseInfo.self).filter("titleName CONTAINS[c] 'b'")
            }),
            UIAction(title: "체크박스 체크", image: UIImage(systemName: "star"), handler: { [self] _ in
                tasks = localRealm.objects(PurchaseInfo.self).filter("checkBox = true")
            }),
            UIAction(title: "즐겨찾기 체크", image: UIImage(systemName: "star"), handler: { [self] _ in
                tasks = localRealm.objects(PurchaseInfo.self).filter("checkStar = true")
            }),
            UIAction(title: "전체", image: UIImage(systemName: "star"), handler: { [self] _ in
                tasks = localRealm.objects(PurchaseInfo.self)
            })
        ]
    }
    // 필터메뉴
    var filterMenu: UIMenu {
        return UIMenu(title: "", image: nil, identifier: nil, options: [], children: menuFilterItems)
    }

    override func viewWillAppear(_ animated: Bool) { // overFullScreen보다 FullScreen으로 바꾸면 또달라져(vc.modalPresentationStyle = .overFullScreen)   present,overCurrentContext,overFullScrenn 은 viewwillAppear 실행 X
        super.viewWillAppear(animated)
        print(#function,"f")
        fetchRealm()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        mainview.tableView.dataSource = self
        mainview.tableView.delegate = self
        
        self.navigationItem.title = "쇼핑"
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.systemGray]
        //        self.view.addGestureRecognizer(mainview.tapGesture)
        
        mainview.addButton.addTarget(self, action: #selector(addButtonClick), for: .touchUpInside)
        print("Realm is located at:", localRealm.configuration.fileURL!)
        
        let deleteInfo = localRealm.objects(PurchaseInfo.self)
        try! localRealm.write {
            localRealm.delete(deleteInfo)
        }
        
        //데이터 삭제하는 두번쨰방법
        //        try! localRealm.write {
        //            localRealm.deleteAll()
        //        }
        
        if #available(iOS 14.0, *) { // ios14.0에서만 가능 , 14.0미만은 alert으로 띄우자!! (생략)
            let sortButton = UIBarButtonItem(title: "정렬", image: nil, primaryAction: nil, menu: sortMenu)
            let filterButton = UIBarButtonItem(title:"필터", image: nil, primaryAction: nil, menu: filterMenu)
            self.navigationItem.leftBarButtonItems = [sortButton, filterButton]
        }
        
        CodeShoppingTableViewCell().checkButton.addTarget(self, action: #selector(sortButtonClicked), for: .touchUpInside)
        
    }
    func  fetchRealm() {
        tasks = localRealm.objects(PurchaseInfo.self)
    }
    
    @objc func sortButtonClicked() {
        tasks = localRealm.objects(PurchaseInfo.self).sorted(byKeyPath: "titleName", ascending: true)
    }
    @objc func filterButtonClicked() {

    }
    
    // 추가 버튼클릭시
    @objc func addButtonClick() {
        guard let inputText = mainview.inputTextField.text else { return }
        let ta = PurchaseInfo(titleName: inputText)
        print(ta)
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

extension CodeShoppingViewController: ContentsMainTextDelegate {
    func checkButtonFunc(_ sender: UIButton) {
        try! self.localRealm.write {
            self.tasks[sender.tag].checkBox = !self.tasks[sender.tag].checkBox
        }
        self.fetchRealm()
    }
    func checkStarFunc(_ sender: UIButton) {
        try! self.localRealm.write {
            self.tasks[sender.tag].checkStar = !self.tasks[sender.tag].checkStar
        }
        print(tasks)
        self.fetchRealm()
    }
    
}
