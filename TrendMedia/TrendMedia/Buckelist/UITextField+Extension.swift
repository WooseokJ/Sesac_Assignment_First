//
//  UITextField+Extention.swift
//  TrendMedia
//
//  Created by useok on 2022/07/19.
//

import UIKit

extension UITextField{
    
//    let placholder = "이메일 입력해줘" //아래 self.placholder와 함꼐 오류방생( 저장속성사용불가)
    
    func borderColor(){
        // textfield.layer.borderColor = .lightGray
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1.0
        self.borderStyle = .none
//        self.placholder = placholder // 오류
    }
        
    
    
}
