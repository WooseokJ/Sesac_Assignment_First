//
//  CodeShppingTextField.swift
//  TrendMedia
//
//  Created by useok on 2022/08/22.
//

import Foundation
import UIKit

class CodeShppingTextField: UITextField {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        textFieldDesign()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func textFieldDesign() {
        self.layer.cornerRadius = 8
        self.layer.backgroundColor = UIColor.systemGray5.cgColor
        self.textColor = .black
    }
}

