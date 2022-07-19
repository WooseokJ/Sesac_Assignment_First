import UIKit




class ViewController: UIViewController {

    
    @IBOutlet weak var happyLabel: UILabel!
    @IBOutlet weak var loveLabel: UILabel!
    @IBOutlet weak var likeLabel: UILabel!

    @IBOutlet weak var panicLabel: UILabel!
    @IBOutlet weak var upsetLabel: UILabel!
    @IBOutlet weak var depressedLabel: UILabel!


    @IBOutlet weak var boringLabel: UILabel!
    @IBOutlet weak var disappointedLabel: UILabel!
    @IBOutlet weak var sadLabel: UILabel!
    
    enum LabelName {
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        emtionFirstButton.tag = 0
        let image  = UIImage(named:"sesac_slim4")?.withRenderingMode(.alwaysOriginal)
        emtionFirstButton.setImage(image, for: .normal)
        let literal = #imageLiteral(
        let systemImage = UIImage(systemName: <#T##String#>)
        view.backgroundColor = ex().0
        happyLabel.text = ex().1
        */
        
    }
    /*
    func ex()->(UIColor,String,String){
        let color : [UIColor] = [.yellow,.red,.green]
        let image : [String]=["1","2","3"]
        return (color.randomElement()!,"고래밥",image.randomElement()!)
    }
    */
 
    var emtionArray = [0,0,0,0,0,0,0,0,0]
    @IBAction func emtionClicked(_ sender: UIButton) {
//        print(sender.tag,sender.currentTitle,sender.currentImage)
        emtionArray[sender.tag]+=1
        
        
        let content = "\(sender.currentTitle!) \(emtionArray[sender.tag])"
        
                
        switch sender.tag{
        case 0 : happyLabel.text = content
        case 1 : loveLabel.text = content
        case 2: likeLabel.text = content
        case 3: panicLabel.text = content
        case 4: upsetLabel.text = content
        case 5: depressedLabel.text = content
        case 6: boringLabel.text = content
        case 7 : disappointedLabel.text = content
        default:
            sadLabel.text = content
        }
    }
    
    @IBAction func settingbutton(_ sender: UIBarButtonItem) {
        showAlertController()
    }

    func showAlertController(){
        // 1 흰 바탕: UIAlertController
        let alert = UIAlertController(title: "인터넷", message: "Internet access allowed", preferredStyle: .alert) //String? 은 써도되고 안써도됨.
        //2  버튼
        let okay = UIAlertAction(title: "확인", style: .destructive, handler: nil) // handler 는 버튼클릭시 특정기능구현되게 해주기위해 action연결 해야되는데 이거로 함. nil은 기능안함
        // destructive 는 빨간글씨
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        let web = UIAlertAction(title: "새창열기", style: .default, handler: nil)
        let copy = UIAlertAction(title: "복사", style: .default, handler: nil)
   
        // 3. 1+2번
        alert.addAction(okay)
        alert.addAction(copy) //추가순서로
        alert.addAction(web)
        alert.addAction(cancel)

        present(alert, animated: true, completion: nil)
    
    
    }
    
}

