

import UIKit

@available (iOS 15.0,*)
class HomeTableViewController: UITableViewController {

    var birthdayFriend : [String] = ["김","나","박","이"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        tableView.rowHeight = 100 //defalut = 44, 셀의높이


    }
    // 0. 색션의 개수(옵션)
    // section은 default가 1
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
     
    //해더
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return "생일인친구"
        case 1: return "즐겨찾기"
        case 2: return "친구 10명"
        default: return "색션" // 모든경우의수 고려 
        }
    }
    // 푸터
    
//    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
//        return "푸터"
//    }
    //1. 셀개수(필수)
    // ex) 카톡100명 -> 셀100개
    // num치면 tableview 자동완성으로 나옴
    
    
    // 이거로 cell 갯수 설정.(return값만큼 cell만들어짐)
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section :Int)->Int{
        switch section{
        case 0: return birthdayFriend.count
        case 1: return 2
        case 2: return 10
        default: return 4
        }
    }
    
  
    //2. 셀 디자인과데이터(필수)
    //ex)카톡 프로필사진,상태메세지 등
    override func tableView(_ tableView : UITableView, cellForRowAt indexPath : IndexPath) -> UITableViewCell{
        
        print("cellforrowat",indexPath)
        if indexPath.section == 2{
            // dequeueReusableCell 재사용 매커니즘 사용
            let cell =  tableView.dequeueReusableCell(withIdentifier: "rightDetailRight")!
            cell.textLabel?.text = "2번 셀 텍스트"
            cell.textLabel?.textColor = .systemBlue
            cell.textLabel?.font = .boldSystemFont(ofSize: 15)
            cell.detailTextLabel?.text = "디테일레이블"
            
            // 1. indexPath.row % 2 == 0,1을 이용
            /*
            if indexPath.row % 2 == 0{
                cell.imageView?.image = UIImage(systemName: "star")
                cell.backgroundColor = .lightGray
            }else{
                cell.imageView?.image = UIImage(systemName: "star.fill")
                cell.backgroundColor = .yellow
            }*/
            
            //2.  0,1처럼 두가지경우 삼항연산자를쓰는걸 권장(if문과 속도는 차이없음)
            cell.imageView?.image = (indexPath.row % 2) == 0 ? UIImage(systemName: "star") : UIImage(systemName: "star.fill")
            
            cell.backgroundColor = (indexPath.row % 2) == 0 ? .lightGray : .yellow
            return cell
        }
        else{
        
        // *100 , 클래스라서 cell의값이 바껴도괜찮.(cell의 주소값이변하면 안되는것)
        let cell =  tableView.dequeueReusableCell(withIdentifier: "settingCell")!
        if indexPath.section == 0{
            cell.textLabel?.text = birthdayFriend[indexPath.row] //위와같은 주석에의해 가능
            cell.textLabel?.textColor = .systemMint //.systemMint는 ios 15.0이상부터
            cell.textLabel?.font = .boldSystemFont(ofSize: 20) //클래스라서 cell의값이 바껴도괜찮.(cell의 주소값이변하면 안되는것)
        }else if indexPath.section == 1{
            cell.textLabel?.text = "1번 셀 텍스트" //글자내용
            cell.textLabel?.textColor = .systemPink //글자색
            cell.textLabel?.font = .boldSystemFont(ofSize: 24) // 글자크기
            }
            return cell
        }
        
        
    }
    // 셀의 높이 지정(옵션,사용빈도는높음)   rowheight와 heightForRowAt 차이점 알아보자 (heightForRowAt이 더 우선순위높음) //둘다 기능은 동일
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 100 //모든 셀의높이가 100
        //첫번쨰 색션,셀 0 만 높이올리기(특정색션 열만 높이기)
        if indexPath.section == 0 && indexPath.row == 0{ //indexPath == [0,0]v
            return 300
        }
        else{
            return 44 //기본높이크기
        }
    }

}
