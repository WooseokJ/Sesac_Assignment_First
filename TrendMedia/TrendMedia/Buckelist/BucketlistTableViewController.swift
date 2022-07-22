

import UIKit

class BucketlistTableViewController: UITableViewController {
    static let identifier = "BucketlistTableViewController" // 화면전환show시 필요
    
//  1.값전달
    var textfieldPlacceholder : String? //공간만들고
    
    
    @IBOutlet weak var userTextField: UITextField!
    var list = ["범죄도시2","탑건","토르"] //보고싶은 영화목록
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //3.값전달
        userTextField.placeholder = "\(textfieldPlacceholder ?? "영화")입력해주세요.!!" // textfieldPlacceholder 이거가 nil이면 대신 "영화" 를 써라
        
        
        
        tableView.rowHeight = 80 //default = 44
        list.append("마녀")
        list.append("ㅁㅁㅁ")
        navigationItem.title = "버킷리스트"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(closeButtonClicked)) // s를 붙이면 배열로도가능
        
        //아래것도 자주쓰임.
//        navigationItem.leftBarButtonItem = UIBarButtonItem(title: <#T##String?#>, style: <#T##UIBarButtonItem.Style#>, target: <#T##Any?#>, action: <#T##Selector?#>)
    }
    
    @objc
    func closeButtonClicked(){ // @bjc을써야 #selector해결
        self.dismiss(animated: true) // self는 BucketlistTableViewController
    }
    
    @IBAction func userTextFieldReturn(_ sender: UITextField) {
        //if let문
        /*if let textContent = sender.text?.trimmingCharacters(in: .whitespacesAndNewlines) , !textContent.isEmpty, (2...5).contains(textContent.count) {//공백지우기 , 비어있지않으면, 글자수가 2~5 사이일떄
            list.append(textContent)
            print(list)
        }
        else{
            //토스트 메세지 띄우기
        }*/
        //guard문
        guard let textContent = sender.text?.trimmingCharacters(in: .whitespacesAndNewlines) , !textContent.isEmpty, (2...5).contains(textContent.count) else{
            // Alert,토스트를 통해 알려줘야한다. (텍스트필드가 리턴이안되므로)
            return
        }
        list.append(textContent)
        print(list)
  
        
        // 중요
        
    tableView.reloadData() //테이블 전체 갱신(데이터가 많은때는 비추천)
        //tableView.reloadSections(<#T##sections: IndexSet##IndexSet#>, with: <#T##UITableView.RowAnimation#>) -> 데이터가 많을때 부분적(섹션별)으로만 갱신
        //tableView.reloadRows(at: <#T##[IndexPath]#>, with: <#T##UITableView.RowAnimation#>) -> 하나의 셀만 바꿔준다(활용: 클릭했을때 셀만 바뀌게 하는거 / [indexPath]두개의 순서를 바꿀때
//        tableView.reloadRows(at: [IndexPath(row: 0, section: 0), IndexPath(row: 1, section: 0)], with: .fade) with는 애니메이션효과
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: BucketlistTableViewCell.identifier, for: indexPath) as! BucketlistTableViewCell // as! 타입캐스팅
        cell.bucktlistLabel.text = list[indexPath.row]
        cell.bucktlistLabel.font = .boldSystemFont(ofSize: 18)
        return cell
    }
    //키보드가 셀을 가릴때 셀 위까지 키보드가 올라가게 하는 기능
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
//    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
//        <#code#>
//    }
    
    //왼쪽 스와이프
//    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        //즐겨찾기핀고정
//    }
    
    //오른쪽 스와이프
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
