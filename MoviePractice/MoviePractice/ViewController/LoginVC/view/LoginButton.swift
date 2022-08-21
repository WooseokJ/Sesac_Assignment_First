//
//  LoginButton.swift
//  MoviePractice
//
//  Created by useok on 2022/08/20.
//

import Foundation
import UIKit

class LoginButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        loginButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loginButton() {
        self.backgroundColor = .white
        self.setTitleColor(.black, for: .normal)
        self.layer.cornerRadius = 8
    }
    
    
}
