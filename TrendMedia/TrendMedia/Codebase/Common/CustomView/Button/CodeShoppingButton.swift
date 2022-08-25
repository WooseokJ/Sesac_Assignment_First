//
//  CodeShoppingButton.swift
//  TrendMedia
//
//  Created by useok on 2022/08/22.
//

import Foundation
import UIKit

class CodeShoppingButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        buttonDesign()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buttonDesign() {
        self.layer.cornerRadius = 8
        self.setTitleColor(.systemGray, for: .normal)
        self.layer.borderWidth = 2
        self.layer.backgroundColor = UIColor.systemGray5.cgColor
        self.layer.borderColor = UIColor.black.cgColor
    }
    
}
