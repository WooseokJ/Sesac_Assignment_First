//
//  ShoppingTableViewController.swift
//  TrendMedia
//
//  Created by useok on 2022/07/19.
//

import UIKit

class ShoppingTableViewController: UITableViewController {

    
    @IBOutlet weak var AddButton: UIButton!
    @IBOutlet weak var inputTextField: UITextField!
    var list : [String?] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 100
        AddButton.setTitle("추가", for: .normal)
        AddButton.setTitleColor(.black, for: .normal)
        AddButton.backgroundColor = .systemGray
        inputTextField.attributedPlaceholder = NSAttributedString(string: "무엇을 구매하실 건가요?", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        inputTextField.backgroundColor = .systemGray3
        AddButton.designButton()
        
        
    }
    @IBAction func AddButton(_ sender: UIButton) {
//        guard let inputContent = inputTextField.text else {
//            return
//        }
        list.append(inputTextField.text!)
        tableView.reloadData()
        inputTextField.text = ""
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppingTableViewCell", for: indexPath) as! ShoppingTableViewCell
        
        cell.contentLabel.text = list[indexPath.row]
        cell.contentLabel.textAlignment = .left
        cell.contentLabel.font = .boldSystemFont(ofSize: 18)
        cell.checkImage.image = UIImage(systemName: "checkmark.square")
        cell.bookmarkButton2.titleLabel?.text = ""
        cell.bookmarkButton2.imageView?.image = UIImage(systemName: "star")
        cell.shopView.backgroundColor = .systemGray3
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // 테이블뷰 삭제
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        list.remove(at: indexPath.row)
        tableView.reloadData()
    }
    
    
    
    
    
    
    
}
