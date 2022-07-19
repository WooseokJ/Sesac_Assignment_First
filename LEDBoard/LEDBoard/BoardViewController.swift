
import UIKit
//import CoreLocation // GPS 요소들 작성가능

class LedBoardViewController: UIViewController { //UITextFieldDelegate
    
    // 1.product -> clean builder folder
    // 2. xcode 껏다킨다
    // 3. 아래처럼 직접입력(@IBOutlet weak var sendbutton: UIButton!)
    @IBOutlet weak var sendbutton: UIButton! // 무조건 버튼이다.
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var inputTextField : UITextField! // UITextField? 로하면 아래서 에러나는데 확실한 라벨이 아닌데 함수를써서
    
    @IBOutlet weak var textColorButton: UIButton!
    @IBOutlet var ButtonList: [UIButton]! //outlet collection
    
    @IBOutlet weak var TopUIView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        designTextField()
        designButton(a:sendbutton, b:"전송","빨리보내", bgColor2:.green)
        designButton(a:textColorButton, b:"색상전환", "색바뀜", bgColor2:.green)
        designLabel()
//        studyOutletCollection()
//        sendbuttonclick(sendbutton)
//        inputTextField.delegate = self
        
    }
    
    func designTextField(){
        inputTextField.placeholder = "내용을 입력하세요."
        inputTextField.text = "안녕하세요"
        inputTextField.keyboardType = .emailAddress
        
    }
    // a :외부 매개변수(argument label) ->생략가능 _(와일드카드식별자)이거로 (보통은 한개정도만 사용한다 관례로)
    // firstbuttonName: 내부 매개변수(parameter name)
    func designButton(a firstbuttonName: UIButton, b buttonTitle2:String,_ hightlightedTitle2:String, bgColor2:UIColor){ //() 는 함수호출연산자
        firstbuttonName.setTitle(buttonTitle2, for: .normal)
        firstbuttonName.setTitleColor(.red, for: .normal)
        
        firstbuttonName.setTitle(hightlightedTitle2, for: .highlighted)
        firstbuttonName.setTitleColor(.cyan, for: .highlighted) //hightlight는 누를떄상태
        
        firstbuttonName.backgroundColor = bgColor2
        firstbuttonName.layer.cornerRadius = 8
        firstbuttonName.layer.borderWidth=3
        firstbuttonName.layer.borderColor = UIColor.darkGray.cgColor
        
    }
    func designLabel(){
        resultLabel.numberOfLines = 0 // 라벨길이에서 라인개수 0은 제한없음
//        resultLabel.backgroundColor = .clear//배경색안쓰고싶다 //defalut랑 의미는비슷 디폴트로쓰면 오류남.
//        resultLabel.backgroundColor = .orange
        resultLabel.font = .systemFont(ofSize: 40)
    }
    func studyOutletCollection(){
        // 코드정리하기
        //1. 반복문
         let buttonArray: [UIButton] = [ sendbutton,textColorButton]
         
         for item in buttonArray{
         item.backgroundColor = .blue
         item.layer.cornerRadius=2
         }
        // 2. 아웃렛 컬렉션
        for item in ButtonList{
            item.backgroundColor = .blue
            item.layer.cornerRadius=2
        }
        
    }

//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        textField.resignFirstResponder()
//        resultLabel.text=inputTextField.text
//        return true
//    }
    
    
    
    
    
    
    @IBAction func sendbuttonclick(_ sender: UIButton) {
//        resultLabel.text = "이곳에 글자가 보입니다.\(Int.random(in: 1...10))"
        
        resultLabel.text = inputTextField.text
        
//        print(inputTextField.text?.count) //text가 스트링일떄 갯수 나옴.
        
        /* 이거와 동일
        if userTextField.text == nil{
            print("X")
        }
        else{
            userTextField.text!.count
        }
        */
//        print(sendbutton.currentTitle) // 버튼에 글자가 없을수도있으므로 옵셔널상태인거 (소리이미지같이)
        
//        let colorSelct : [UIColor] = [.red, .white, .gray, .black, .orange]
//        resultLabel.textColor = colorSelct.randomElement()
        
                
    }
    
    var select = true
    @IBAction func tapGestureClicked(_ sender: UITapGestureRecognizer) {
        if select {
            TopUIView.isHidden = true
            select = false
        }
        else{
            TopUIView.isHidden = false
            select = true
        }
        view.endEditing(true)
    }
    

    @IBAction func ColorChangeButtonClicked(_ sender: UIButton) {
        //랜덤으로 색깔 변화
                let r : CGFloat = CGFloat.random(in: 0...1)
                let g : CGFloat = CGFloat.random(in: 0...1)
                let b : CGFloat = CGFloat.random(in: 0...1)
                self.resultLabel.backgroundColor = UIColor(red:r,green: g,blue: b,alpha: 1)
        //        self.view.backgroundColor = UIColor(red:r+0.1,green: g+0.1,blue: b+0.1,alpha: 1)
    }
    

    @IBAction func TextfieldExit(_ sender: Any) {
//        let colorSelct : [UIColor] = [.red, .white, .gray, .black, .yellow, .orange]
//        resultLabel.textColor = colorSelct.randomElement()

    }
    
  
    
    
}




  
  /* UITextField?일떄
   if userTextField ==nil {
   print("문제발생")
   }
   else{
   userTextField.text= "안녕"
   }
   userTextField?.text = "안녕" //이런식으로 쓸수있음.
   */
  
  
  //문법
  /*
   var phoneNumber = "01012341234"
   
   let result=Int(phoneNumber)
   let result2=Int(phoneNumber)!
   print(result2)
   
   if result == nil{
   print("문제발생")
   }
   else{
   print(result)
   }
   
   var num : String? = "010102"
   num = nil
   print(num)
   //        let result3= Int(num)!
   */
  
