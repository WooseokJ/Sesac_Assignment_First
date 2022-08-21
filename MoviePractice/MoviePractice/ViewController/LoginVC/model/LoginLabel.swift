//
//  LoginDesign.swift
//  MoviePractice
//
//  Created by useok on 2022/08/20.
//

import Foundation
import UIKit

class LoginLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        LabelDesign()
//        addLabelDesign()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func LabelDesign() {
        self.textColor = .red
        self.font = .systemFont(ofSize: 50)
//        self.backgroundColor = .orange
        self.textAlignment = .center
    }
//    func addLabelDesign() {
//        self.font = .systemFont(ofSize: 15)
//    }
}
