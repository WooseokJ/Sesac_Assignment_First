//
//  DetailViewController.swift
//  book
//
//  Created by useok on 2022/07/21.
//

import UIKit

class DetailViewController: UIViewController {

    static var identifier = "DetailViewController"
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func webButton(_ sender: UIButton) {
        let sb = UIStoryboard(name: "Web", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: WebViewController.identifier) as! WebViewController
        self.navigationController?.pushViewController(vc, animated: true)
        
        
        
    }
    

}
