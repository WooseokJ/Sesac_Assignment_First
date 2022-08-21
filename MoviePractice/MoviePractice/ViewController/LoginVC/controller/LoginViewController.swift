//
//  LoginViewController.swift
//  MoviePractice
//
//  Created by useok on 2022/08/20.
//

import UIKit

@available(iOS 15.0, *)
class LoginViewController: UIViewController {

    let loginView = LoginView()
    override func loadView() {
        super.view = loginView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        loginView.signupButton.addTarget(self, action: #selector(signupClicked), for: .touchUpInside)
    }
    
    @objc func signupClicked() {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = sb.instantiateViewController(withIdentifier: MainViewController.reuseIdentifier) as? MainViewController else {return}
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: false)
    }
}
