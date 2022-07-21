//
//  TrendTableViewController.swift
//  TrendMedia
//
//  Created by useok on 2022/07/21.
//

import UIKit

class TrendTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

   
    @IBAction func movieButtonClicked(_ sender: UIButton) {
        // 영화버튼클릭 -> 버킷리스트테이블뷰컨트롤러 present
        // 화면전환순서: 전환할 스토리보드파일찾기 -> 스토리보드내 뷰컨트롤러 찾기-> 화면전환
        // step 1 전환할 스토리보드파일찾기
        let next = UIStoryboard(name: "trend", bundle: nil) //nil을하면 기본위치, 라이브버리같은거 가져올떈 nil아님,  name:은 스토리보드 이름쓰기
        
        // step 2
        let vc = next.instantiateViewController(withIdentifier: BucketlistTableViewController.identifier) as! BucketlistTableViewController
        
        // 네비게이션 뷰컨트롤 띄우기
        let nav = UINavigationController(rootViewController: vc)

        // step 2.5 어떤 방식으로 띄울지 결정(옵션)
        nav.modalPresentationStyle = .fullScreen
        
        // step 3
        self.present(nav,animated: true) //self는 클래스 자기자신의 인스턴스(TrendTableViewController)
        
        
        
    }
    

}
