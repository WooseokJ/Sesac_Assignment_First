//
//  BucketlistTableViewController.swift
//  TrendMedia
//
//  Created by useok on 2022/07/19.
//

import UIKit

class BucketlistTableViewController: UITableViewController {

    var list = ["범죄도시2","탑건","토르"] //보고싶은 영화목록
    
    override func viewDidLoad() {
        super.viewDidLoad()

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

}
