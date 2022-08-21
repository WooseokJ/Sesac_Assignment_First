

import UIKit

class SignUpViewController: UIViewController{
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var Switch: UISwitch!
    @IBOutlet var userTextFieldCollection: [UITextField]!
    override func viewDidLoad() {
        super.viewDidLoad()
        let textcontent : [String] = ["이메일 입력","비밀번호","닉네임","위치","추천인코드"]
        let keyboardType : [UIKeyboardType] = [.emailAddress,.numberPad,.emailAddress,.emailAddress,.numberPad]
        
        for item in userTextFieldCollection{
            designTextField(item,Text:textcontent[item.tag],keyboardstyle: keyboardType[item.tag])
            if item.tag == 1{
                item.textContentType = .oneTimeCode
                item.isSecureTextEntry = true
            }
        }
        designButton(signupButton, Title: "회원가입")
        Switch.onTintColor = .green
        Switch.thumbTintColor = .white
    }
    
    func designTextField(_ TextFieldName: UITextField, Text : String, keyboardstyle : UIKeyboardType  ){
        TextFieldName.textColor = .white
        TextFieldName.backgroundColor = .gray
        TextFieldName.borderStyle = .roundedRect //가장자리 스타일
        TextFieldName.keyboardType = keyboardstyle
        TextFieldName.attributedPlaceholder = NSAttributedString(string: Text,attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        TextFieldName.textAlignment = NSTextAlignment.center //가운데정렬
        
    }
    func designButton(_ BtName : UIButton, Title: String){
        BtName.setTitle(Title, for: .normal)
        BtName.setTitleColor(.black, for: .normal)
        BtName.backgroundColor = .white
        BtName.layer.cornerRadius = 8
        
    }
  
    @IBAction func tapGesture(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    var check = true
    @IBAction func plusSwitch(_ sender: UISwitch) {
        let checkSelect = check ? true:false
        switch checkSelect {
        case true:
            Switch.setOn(false,animated: true)
            check=false
        default:
            Switch.setOn(true,animated: false)
            check = true
            break
        }
//        Switch.onTintColor = .red
//        Switch.thumbTintColor = .white
//        Switch.backgroundColor = .blue
//        Switch.layer.cornerRadius = 3
    }
    
    @IBAction func signUpButton(_ sender: UIButton) {
        func AlertShow(){
            let alertPW = UIAlertController(title: "경고", message: "pw 6자리이상입력해주세요.", preferredStyle: UIAlertController.Style.alert)
            let okay = UIAlertAction(title: "확인", style: .default, handler: nil)
            alertPW.addAction(okay)
            present(alertPW, animated: true, completion: nil)
        }
        
       // id 가 비어있으면 else 실행
        guard !userTextFieldCollection[0].text!.isEmpty else{
            userTextFieldCollection[0].attributedPlaceholder = NSAttributedString(string: "ID는 필수적으로 입력해야 합니다.", attributes: [NSAttributedString.Key.foregroundColor : UIColor.red])
            return
        }
        
        // pw 가 nil이면 else
        guard let PwLen = userTextFieldCollection[1].text?.count else {
            return
        }
        // pw가 입력되지않으면
        guard PwLen != 0 else{
            userTextFieldCollection[1].attributedPlaceholder = NSAttributedString(string: "PW를 입력해주세요.", attributes: [NSAttributedString.Key.foregroundColor : UIColor.red])
            return
        }
        // pw가 6자리 이상이 아니면 else 실행
        guard PwLen >= 6 else{
            AlertShow()
            return
        }
        
        
        
        //show 로 연결한 controller 보여주기
        if let mainviewController = self.storyboard?.instantiateViewController(withIdentifier: "mainView") as? ViewController{
            present(mainviewController, animated: true, completion: nil)
        }
        //pop로 연결한 controller 보여주기
        func BackButton(){
            self.navigationController?.popViewController(animated: true)
        }
        //push로 연결한 controller 보여주기
        @available (iOS 13.0 , *) // push의경우 13.0이상부터 가능
        func nextViewController() {
            guard let nextVC = self.storyboard?.instantiateViewController(identifier: "mainView") else {return}
            self.navigationController?.pushViewController(nextVC, animated: true) //push타입
        }
        //주의
        // instantiateViewController(identifier:creator:) ios 13.0이상
        // instantiateViewController(withIdentifier:) ios 5.0이상
    
        }
    
}

//        Int8 //2의 8승까지 범위지정
