//
//  LoginView.swift
//  MoviePractice
//
//  Created by useok on 2022/08/20.
//

import Foundation
import UIKit
import SnapKit
class LoginView: UIView {
    //MARK: 연결
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        setConstants()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: 크기
    // jackflix
    let titleName: UILabel = {
        let label = LoginLabel()
        label.text = "JACKFLIX"
        return label
    }()
    
    // email or phoneNumber
    let id: UITextField = {
        let textField = LoginTextField()
        textField.attributedPlaceholder = NSAttributedString(string: "이메일 및 핸드폰번호", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        return textField
    }()
    // password
    let password: UITextField = {
        let textField = LoginTextField()
        textField.attributedPlaceholder = NSAttributedString(string: "비밀번호", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        
        return textField
    }()
    // nickname
    let nickname: UITextField = {
        let textField = LoginTextField()
        textField.attributedPlaceholder = NSAttributedString(string: "닉네임", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        return textField
    }()
    // location
    let location: UITextField = {
        let textField = LoginTextField()
        textField.attributedPlaceholder = NSAttributedString(string: "위치", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        return textField
    }()
    // recommendCode
    let recommendCode: UITextField = {
        let textField = LoginTextField()
        textField.attributedPlaceholder = NSAttributedString(string: "추천인 코드", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        return textField
    }()
    // signupButton
    let signupButton: UIButton = {
        let button = LoginButton()
        button.setTitle("회원가입", for: .normal)
        return button
    }()
    // addinfo
    let addInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "추가 정보 입력"
        label.textColor = .white
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    // switch
    let switchbutton: UISwitch = {
        let switchbutton = UISwitch()
        return switchbutton
    }()
    
    
    //MARK: 뷰에 등록
    func configure() {
        [titleName,id,password,nickname,location,recommendCode,signupButton,addInfoLabel,switchbutton].forEach {
            self.addSubview($0)
        }
    }
    
    //MARK: 위치
    func setConstants() {
        // jackflix
        titleName.snp.makeConstraints {
            $0.top.equalTo(150)
            $0.bottom.equalTo(-700)
            $0.height.equalTo(40)
            $0.leading.equalTo(30)
            $0.trailing.equalTo(-30)
            $0.center.equalTo(self)
        }
        //email or phoneNumber
        id.snp.makeConstraints {
            $0.center.equalTo(self)
            $0.height.equalTo(30)
            $0.leading.equalTo(50)
            $0.trailing.equalTo(-50)
            $0.top.equalTo(titleName.snp.bottom).offset(20)
            $0.bottom.equalTo(-550)
        }
        //password
        password.snp.makeConstraints {
            $0.center.equalTo(self)
            $0.height.equalTo(id.snp.height)
            $0.width.equalTo(id.snp.width)
            $0.top.equalTo(id.snp.bottom).offset(20)
            $0.bottom.equalTo(-500)
        }
        // nickname
        nickname.snp.makeConstraints {
            $0.center.equalTo(self)
            $0.height.equalTo(password.snp.height)
            $0.width.equalTo(password.snp.width)
            $0.top.equalTo(password.snp.bottom).offset(20)
            $0.bottom.equalTo(-450)
        }
        
        // location
        location.snp.makeConstraints {
            $0.center.equalTo(self)
            $0.height.equalTo(nickname.snp.height)
            $0.width.equalTo(nickname.snp.width)
            $0.top.equalTo(nickname.snp.bottom).offset(20)
            $0.bottom.equalTo(-400)
        }
        //recommendcode
        recommendCode.snp.makeConstraints {
            $0.center.equalTo(self)
            $0.height.equalTo(location.snp.height)
            $0.width.equalTo(location.snp.width)
            $0.top.equalTo(location.snp.bottom).offset(20)
            $0.bottom.equalTo(-350)
        }
        
       
        //signupButton
        signupButton.snp.makeConstraints {
            $0.center.equalTo(self)
            $0.height.equalTo(id.snp.height)
            $0.width.equalTo(id.snp.width)
            $0.bottom.equalTo(-300)
        }
        //addinfoLabel
        addInfoLabel.snp.makeConstraints {
            $0.leading.equalTo(signupButton.snp.leading)
            $0.height.equalTo(40)
            $0.top.equalTo(signupButton.snp.bottom).offset(30)
            $0.bottom.equalTo(-250)
        }
        // switchbutton
        switchbutton.snp.makeConstraints {
            $0.trailing.equalTo(signupButton.snp.trailing)
            $0.height.equalTo(40)
            $0.top.equalTo(signupButton.snp.bottom).offset(30)
            $0.bottom.equalTo(-250)
        }
        
    }
}
