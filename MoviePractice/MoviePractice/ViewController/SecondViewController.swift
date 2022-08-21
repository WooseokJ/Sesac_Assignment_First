//
//  SecondViewController.swift
//  MoviePractice
//
//  Created by useok on 2022/07/05.
//

import UIKit

class SecondViewController: UIViewController {
    
    //아웃렛변수 weak(일단넘어가) var(변수여야함:값바뀔수있으니)
    @IBOutlet weak var bannerImageView: UIImageView! //선언만되있음. 값이들어가있진않음
                    // var nickname:String
    // movieTitlelabel-> movieTitle 바꿀떄 에러-> 이는 스토리보드에서 스위프트파일과 연결이 끊겨서 그런거로 오른쪽창에서 연결을 끊었다가 해결.
    // 위에 변수바꾸려면 rename으로 바꿔도가능
    @IBOutlet weak var movieTitle: UILabel!
    
    // 뷰컨트롤러 생명주기 종류중 하나
    //사용자에게 화면에 보이기 이전에 실행되는부분(화면이 실시간으로 동그랗게 되면이상함)
    override func viewDidLoad() {
        super.viewDidLoad()
        bannerImageView.image = UIImage(named: "movie\(Int.random(in: 1...4))") // asset에있는 이미지 넣으면됨.
        bannerImageView.layer.cornerRadius=100
        bannerImageView.layer.borderWidth=3
        bannerImageView.layer.borderColor=UIColor.blue.cgColor
        
        movieTitle.text="택시운전사"
        movieTitle.backgroundColor=UIColor.yellow //.yellow
        movieTitle.textColor=UIColor.red //.red 도가능 생략해서
        movieTitle.font=UIFont.boldSystemFont(ofSize: 20)
    }
    
    @IBAction func changebuttonAction(_ sender: UIButton) {
        bannerImageView.image = UIImage(named: "movie\(Int.random(in: 1...4))")
    }
    
    

}
