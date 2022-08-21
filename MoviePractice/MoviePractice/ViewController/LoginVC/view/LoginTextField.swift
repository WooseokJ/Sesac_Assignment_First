//
//  LoginTextField.swift
//  MoviePractice
//
//  Created by useok on 2022/08/20.
//

import Foundation
import UIKit

class LoginTextField: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        loginTextField()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loginTextField()  {
        self.backgroundColor = .lightGray
        self.textAlignment = .center // NSTextAlignment.center
        self.textColor = .white
        self.font = .systemFont(ofSize: 20)
        self.layer.cornerRadius = 8
        self.borderStyle = .roundedRect
        
    }
}
