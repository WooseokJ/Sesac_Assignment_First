//
//  BucketlistTableViewController.swift
//  TrendMedia
//
//  Created by useok on 2022/07/19.
//

import UIKit

class BucketlistTableViewController: UITableViewController {

    @IBOutlet weak var userTextField: UITextField!
    var list = ["범죄도시2","탑건","토르"] //보고싶은 영화목록
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 80 //default = 44
        list.append("마녀")
        list.append("ㅁㅁㅁ")
    }
    
    @IBAction func userTextFieldReturn(_ sender: UITextField) {
        list.append(sender.text!)
        print(list)
        // 중요
        tableView.reloadData()
//        tableView.reloadSections(<#T##sections: IndexSet##IndexSet#>, with: <#T##UITableView.RowAnimation#>) //with는 애니메이션효과
//        tableView.reloadRows(at: [IndexPath(row:0,section:0),IndexPath(row:0,section:1], with: .fade)//with는 애니메이션효과
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BucketlistTableViewCell", for: indexPath) as! BucketlistTableViewCell // as! 타입캐스팅
        cell.bucktlistLabel.text = list[indexPath.row]
        cell.bucktlistLabel.font = .boldSystemFont(ofSize: 18)
        return cell
        
    }
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
//    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
//        <#code#>
//    }
//    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        //즐겨찾기핀고정
//    }
//    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        <#code#>
//    }
    //우측 스와이프 디폴트 가능 , 우측 악세서리뷰에 아이콘을넣으려면 다른방식사용
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //배열삭제후 테이블뷰 갱신
            list.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    

}
