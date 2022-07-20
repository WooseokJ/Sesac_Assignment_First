//
//  TrendMediaTableViewController.swift
//  TrendMedia
//
//  Created by useok on 2022/07/20.
//

import UIKit

class TrendMediaTableViewController: UITableViewController {

    var moviewls = MovieInfo() // 초기화할 프로퍼티(속성)가 없어서 바로써도됨.
                                // 메모리구조로 볼떄 초기화할떄마다 MovieInfo를 재사용해서 활용할수있음.
                                //MovieInfo().movieContent 를써서 사용해도됨.
    
    // 방법1 : ["암살","괴물","해리포터 비밀의방","기묘한이야기"]
    //방법2
//    [   Movie(title: "암살", releaseDate: "22.22.22", overview: "암살줄거리", runtime: 140, rate: 4.5),
//        Movie(title: "괴물", releaseDate: "22.22.22", overview: "괴물줄거리", runtime: 80, rate: 4.3)]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    //색션 개수
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return moviewls.count
        return moviewls.movieContent.count
    }
    
    // 데이터삽입
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TrendMediaTableViewCell", for: indexPath) as! TrendMediaTableViewCell
        let moviedata = moviewls.movieContent[indexPath.row]
        
        
//        cell.configureCell(data: moviedata.movieTitle,
//                           rate: moviedata.movieRate) //너무 번거롭고 길다 그래서 아래와같이 한다.

        cell.configureCell(data: moviedata)
//        cell.TitleLabel.font = .boldSystemFont(ofSize: 15)
//        cell.TitleLabel.text = moviewls[indexPath.row]
//        cell.DateLabel.text = "2222.22.22"
//        cell.ContentLabel.text = "ddddd"
//        cell.ContentLabel.numberOfLines = 0
        //cell. 하면 tableViewCell에 접근해서 변수사용가능
        
        return cell
    }
    // 셀높이
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height / 6 // .height 까진 셀의전체높이
    }
    
   
}
