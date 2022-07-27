

import UIKit

struct Todo{
    var title : String
    var done : Bool
}


class BucketlistTableViewController: UITableViewController {
    static let identifier = "BucketlistTableViewController" // 화면전환show시 필요
    
//  1.값전달
    var textfieldPlacceholder : String? //공간만들고
    
    @IBOutlet weak var userTextField: UITextField!{ // 한번만 작동

        didSet{
            userTextField.textAlignment = .center
            userTextField.font = .boldSystemFont(ofSize: 22)
            userTextField.textColor = .systemRed
            userTextField.text = "ㄸㄸㅉ"
      }
    }
//    var list = ["범죄도시2","탑건","토르","아이언","해리포터","탑건2","없는영화","있잖아"] {
//        didSet{ // 이렇게하면 값 바뀐후 출력됨.
//            tableView.reloadData()
//            print("\(list)가 \(oldValue)로 바뀜")
//
//        }
//    }
    
        var list = [Todo(title: "범죄도시2", done: true),Todo(title: "탑건", done: false)]
//    var list = ["범죄도시2":true,"탑건":true] -> 딕셔너리는 순서없어서 cell에 추가할수없음. (생각하지마라)
    // 클래스는 참조타입->인스턴스 자체를 변경하지않는이상 한번만 될거다.
    // IBOutlet viewDidLoad() 호출되기 직전에 nil이 아닌지 nil인지 알수있음.
    override func viewDidLoad() {
        super.viewDidLoad()
        //3.값전달
        userTextField.placeholder = "\(textfieldPlacceholder ?? "영화")입력해주세요.!!" // textfieldPlacceholder 이거가 nil이면 대신 "영화" 를 써라
        
        
        
        tableView.rowHeight = 80 //default = 44
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
        //guard문
        guard let textContent = sender.text?.trimmingCharacters(in: .whitespacesAndNewlines) , !textContent.isEmpty, (2...5).contains(textContent.count) else{
            // Alert,토스트를 통해 알려줘야한다. (텍스트필드가 리턴이안되므로)
            return
        }
        list.append(Todo(title: textContent, done: false))
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
        cell.bucktlistLabel.text = list[indexPath.row].title
        cell.bucktlistLabel.font = .boldSystemFont(ofSize: 18)
        cell.checkboxButton.tag = indexPath.row
        cell.checkboxButton.addTarget(self,action: #selector(checkclicked), for: .touchUpInside)
        let val = list[indexPath.row].done ? "checkmark.square.fill" : "checkmark.square"
        cell.checkboxButton.setImage(UIImage(systemName: val), for: .normal)
        // 시뮬레이터에서 체크되있는건 bool 타입 기본값이 false라서 그런거 
                                      
        return cell
    }
    @objc func checkclicked(sender : UIButton){
        print("\(sender.tag)버튼클")
        //재사용 셀 오류확인용 코드
//        sender.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal) // 화면기반으로만 바뀜. 데이터자체가 바뀐건아님 (그래서 아래스크롤시 기존에 언체크 표시가 보임  -> 구조체형태로바꾸자 리스트를

        // 배열 인덱스 찾아서 done을 바꿔야한다. 그리고 테이블뷰 갱신해야한다.
        list[sender.tag].done = !list[sender.tag].done
        // tableview.reloadData() 대신에 아래꺼가 더 효율적
        tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .fade) //하나의섹션이라 0
            
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
            tableView.reloadData() //데이터 갱신
        }
    }
    

    
    
    
    
    
}
