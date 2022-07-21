//
//  SearchViewController.swift
//  book
//
//  Created by useok on 2022/07/21.
//

import UIKit

class SearchViewController: UIViewController {

    static var identifier = "SearchViewController"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image:UIImage(systemName: "xmark") , style: .plain, target: self, action: #selector(closeclicked))
        
        
    }
    @objc
    func closeclicked(){
        self.dismiss(animated: true)
    }
    
    
    
    


}
