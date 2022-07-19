
import UIKit

var newkeyword : [String:String] = [
    "오뱅있":"오늘 방송 있나요?",
    "오뱅알":"오늘 방송 알찼다",
    "트수":"트위치를 보는 사람",
    "그스그청" : "그 스트리머에 그 스청자",
    "영도" : "영상 도네이션",
    "음도" : "음성 도네이션",
    "유하" : "유투브 하이",
    "오겜무" : "오늘게임무엇",
    "버근가" : "버그인가",
    "방플" : "방송플레이",
    "방방봐" : "방송은 방송으로 봐",
    "난죽택" : "난죽음을 택하겠다."
]
enum

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet var recordButton: [UIButton]!
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.placeholder = "신조어를 입력해주세요."
        designHashTagButton()
       
    }
    
    func designHashTagButton(){
        for item in recordButton {
            item.layer.borderWidth = 1
            item.layer.cornerRadius = 5
            item.tintColor = .black
                    }
    }
    @IBAction func tapGesture(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    @IBAction func searchButton(_ sender: UIButton) {
        for keyword in newkeyword{
            if keyword.key == searchTextField.text!{
                resultLabel.text = keyword.value
                break
            }
            else{
                resultLabel.text = "찾으시는 키워드가 없습니다."
            }
        }
        
        let newKeyWordLs = newkeyword.keys.shuffled()
        for (bt,keyword) in zip(recordButton,newKeyWordLs){
            bt.setTitle(keyword, for: .normal)
        }
        
        view.endEditing(true)
    }
    @IBAction func searchfunc(_ sender: UITextField) {
        
    }4
    
    
    
    
    @IBAction func firstButton(_ sender: UIButton) {
        resultLabel.text = newkeyword[sender.currentTitle!]
    }
}

