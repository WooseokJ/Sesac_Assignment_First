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
    let titleLabel: UILabel = {
        let label = LoginLabel()
        label.text = "JACKFLIX"
        return label
    }()
       
    // email or phoneNumber
    let idtextField: UITextField = {
        let textField = LoginTextField()
        textField.attributedPlaceholder = NSAttributedString(string: "이메일 및 핸드폰번호", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        textField.keyboardType = .emailAddress
        return textField
    }()
    // password
    let passwordTextField: UITextField = {
        let textField = LoginTextField()
        textField.attributedPlaceholder = NSAttributedString(string: "비밀번호", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        textField.keyboardType =  .numberPad
        textField.textContentType = .oneTimeCode
        textField.isSecureTextEntry = true
        
        return textField
    }()
    // nickname
    let nicknameTextField: UITextField = {
        let textField = LoginTextField()
        textField.attributedPlaceholder = NSAttributedString(string: "닉네임", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        textField.keyboardType = .emailAddress
        return textField
    }()
    // location
    let locationTextField: UITextField = {
        let textField = LoginTextField()
        textField.attributedPlaceholder = NSAttributedString(string: "위치", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        textField.keyboardType = .emailAddress
        return textField
    }()
    // recommendCode
    let recommendTextField: UITextField = {
        let textField = LoginTextField()
        textField.attributedPlaceholder = NSAttributedString(string: "추천인 코드", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        textField.keyboardType =  .numberPad
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
        [titleLabel,idtextField,passwordTextField,nicknameTextField,locationTextField,recommendTextField,signupButton,addInfoLabel,switchbutton].forEach {
            self.addSubview($0)
        }
    }
    
    //MARK: 위치
    func setConstants() {
        // jackflix
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(150)
            $0.bottom.equalTo(-700)
            $0.height.equalTo(40)
            $0.leading.equalTo(30)
            $0.trailing.equalTo(-30)
            $0.center.equalTo(self)
        }
        //email or phoneNumber
        idtextField.snp.makeConstraints {
            $0.center.equalTo(self)
            $0.height.equalTo(30)
            $0.leading.equalTo(50)
            $0.trailing.equalTo(-50)
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.bottom.equalTo(-550)
        }
        //password
        passwordTextField.snp.makeConstraints {
            $0.center.equalTo(self)
            $0.height.equalTo(idtextField.snp.height)
            $0.width.equalTo(idtextField.snp.width)
            $0.top.equalTo(idtextField.snp.bottom).offset(20)
            $0.bottom.equalTo(-500)
        }
        // nickname
        nicknameTextField.snp.makeConstraints {
            $0.center.equalTo(self)
            $0.height.equalTo(passwordTextField.snp.height)
            $0.width.equalTo(passwordTextField.snp.width)
            $0.top.equalTo(passwordTextField.snp.bottom).offset(20)
            $0.bottom.equalTo(-450)
        }
        
        // location
        locationTextField.snp.makeConstraints {
            $0.center.equalTo(self)
            $0.height.equalTo(nicknameTextField.snp.height)
            $0.width.equalTo(nicknameTextField.snp.width)
            $0.top.equalTo(nicknameTextField.snp.bottom).offset(20)
            $0.bottom.equalTo(-400)
        }
        //recommendcode
        recommendTextField.snp.makeConstraints {
            $0.center.equalTo(self)
            $0.height.equalTo(locationTextField.snp.height)
            $0.width.equalTo(locationTextField.snp.width)
            $0.top.equalTo(locationTextField.snp.bottom).offset(20)
            $0.bottom.equalTo(-350)
        }
        
       
        //signupButton
        signupButton.snp.makeConstraints {
            $0.center.equalTo(self)
            $0.height.equalTo(idtextField.snp.height)
            $0.width.equalTo(idtextField.snp.width)
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
