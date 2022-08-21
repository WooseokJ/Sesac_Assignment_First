//
//  LoginViewController.swift
//  MoviePractice
//
//  Created by useok on 2022/08/20.
//

import UIKit

@available(iOS 15.0, *)
class LoginViewController: UIViewController, UIGestureRecognizerDelegate {
    
    let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer()
      
    let loginView = LoginView()
    override func loadView() {
        super.view = loginView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tapGesture.delegate = self
        self.view.addGestureRecognizer(tapGesture)
        view.backgroundColor = .black
        loginView.signupButton.addTarget(self, action: #selector(signupClicked), for: .touchUpInside)
    }
    
    @objc func signupClicked() {
        // id 입력확인
        guard let id = loginView.idtextField.text else {return}
        guard !id.isEmpty  else {
            loginView.idtextField.attributedPlaceholder = NSAttributedString(string: "ID는 필수적으로 입력해주세요", attributes: [NSAttributedString.Key.foregroundColor : UIColor.red])
            return
        }
        guard id.contains("@")  else {
            loginView.idtextField.text = ""
            loginView.idtextField.attributedPlaceholder = NSAttributedString(string: "@ 형식을 맞춰주세요", attributes: [NSAttributedString.Key.foregroundColor : UIColor.red])
            return
        }
        
        
        //패스워드 입력확인
        guard var pw = loginView.passwordTextField.text else {return}
        guard pw.count >= 6 else{
            loginView.passwordTextField.text = ""
            loginView.passwordTextField.attributedPlaceholder = NSAttributedString(string:"비밀번호 6자리이상입력해주세요", attributes: [NSAttributedString.Key.foregroundColor : UIColor.red])
            return
        }
        
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = sb.instantiateViewController(withIdentifier: MainViewController.reuseIdentifier) as? MainViewController else {return}
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: false)
    }

    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive event: UIEvent) -> Bool {
        self.view.endEditing(false)
    }
}
