//
//  CancelButton.swift
//  TrendMedia
//
//  Created by useok on 2022/08/26.
//

import Foundation
import UIKit


class CancelButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        buttonStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buttonStyle() {
        self.setImage(UIImage(systemName: "xmark"), for: .normal)
    }
    
}
