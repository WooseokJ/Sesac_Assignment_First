//
//  CodeShoppingViewController.swift
//  TrendMedia
//
//  Created by useok on 2022/08/22.
//

import UIKit
import RealmSwift
import SnapKit
// UIGestureRecognizerDelegate
class CodeShoppingViewController: UIViewController {
    
    //MARK: 뷰 가져오기
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

    override func viewWillAppear(_ animated: Bool) { 
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
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black]
        //        self.view.addGestureRecognizer(mainview.tapGesture)
        
        mainview.addButton.addTarget(self, action: #selector(addButtonClick), for: .touchUpInside)
        print("Realm is located at:", localRealm.configuration.fileURL!)
        
        let deleteInfo = localRealm.objects(PurchaseInfo.self)
        try! localRealm.write {
            localRealm.delete(deleteInfo)
        }
        
        // 데이터 삭제하는 두번쨰방법
        //        try! localRealm.write {
        //            localRealm.deleteAll()
        //        }
        
        //MARK: 왼쪽 네비바
        if #available(iOS 14.0, *) { // ios14.0에서만 가능 , 14.0미만은 alert으로 띄우자!! (생략)
            let sortButton = UIBarButtonItem(title: "정렬", image: nil, primaryAction: nil, menu: sortMenu)
            let filterButton = UIBarButtonItem(title:"필터", image: nil, primaryAction: nil, menu: filterMenu)
            self.navigationItem.leftBarButtonItems = [sortButton, filterButton]
        }

        //MARK: 오른쪽 네비바
        let backupButton = UIBarButtonItem(title: "백업 및 복구", style: .plain, target: self, action: #selector(backupButtonClicked))
        self.navigationItem.rightBarButtonItem = backupButton

        // 체크박스 클릭시
        CodeShoppingTableViewCell().checkButton.addTarget(self, action: #selector(sortButtonClicked), for: .touchUpInside)
    }
    
    //MARK: 버튼클릭시
    // 오른쪽 네비바 백업버튼 클릭시
    @objc func backupButtonClicked() {
        let vc = BackUpViewController()
        transition(vc, transitionStyle: .presentFullNavigation)
    }

    func fetchRealm() {
        tasks = localRealm.objects(PurchaseInfo.self)
    }
    //정렬버튼
    @objc func sortButtonClicked() {
        tasks = localRealm.objects(PurchaseInfo.self).sorted(byKeyPath: "titleName", ascending: true)
    }

    //MARK: 추가 버튼클릭시
    @objc func addButtonClick() {
        guard let inputText = mainview.inputTextField.text else { return }
        let ta = PurchaseInfo(titleName: inputText)
        print(ta)
        try! localRealm.write {
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
        self.fetchRealm()
    }
    
}

extension CodeShoppingViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let taskCount = tasks else { return 0 }
        return taskCount.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CodeShoppingTableViewCell.reuseIdentifier, for: indexPath) as! CodeShoppingTableViewCell
        // 셀디자인
        cell.backgroundColor = .systemGray5
        cell.layer.cornerRadius = 8
        cell.clipsToBounds = true

        // 셀 내용입력
        guard tasks != nil else{return cell}
        cell.labelText.text = tasks[indexPath.row].titleName

        // 체크박스
        cell.checkButton.tag = indexPath.row
        cell.checkBoxCellDelegate = self
        let checkButtonImage = tasks[indexPath.row].checkBox ? "checkmark.square.fill" : "checkmark.square"
        cell.checkButton.setImage(UIImage(systemName: checkButtonImage), for: .normal)

        // 즐겨찾기
        cell.checkStar.tag = indexPath.row
        cell.checkStarCellDelegate = self
        let checkStarImage = tasks[indexPath.row].checkStar ? "star.fill" : "star"
        cell.checkStar.setImage(UIImage(systemName: checkStarImage), for: .normal)
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

    // 선택시
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "Shopping", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: CodeShoppingDetailViewController.reuseIdentifier) as! CodeShoppingDetailViewController
        vc.labelContent = tasks[indexPath.row].titleName
        self.navigationController?.pushViewController(vc, animated: true)
    }
}


