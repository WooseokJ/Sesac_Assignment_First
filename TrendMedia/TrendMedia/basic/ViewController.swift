import UIKit

class ViewController: UIViewController {

// 변수스코프
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var date2Label: UILabel!
    @IBOutlet var dateLabelCollection: [UILabel]!
    
   
//    let view2 = ViewController() // 원래선언해야지 사용가능.
    let format = DateFormatter() // 메모리에 차지하다 없어지는형태 그래서 함수안이아닌 위로옴.
    //DateFormatter.init() 과 동일하지만 생략해서자주씀.

    //여기선언못하는이유: 어떤시점에 표현을해줄지 결정할수없기떄문 함수안쪽에서 작성해줘야한다.
    //    format.dateFormat = "yyyy/MM/dd"
    @IBOutlet weak var yellowViewLeadingConstant: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        format.dateFormat = "yyyy/MM/dd"
//        UIAlertController(title: "1", message: "2", preferredStyle:.alert) // UIAlerController.init() 생략
        yellowViewLeadingConstant.constant = 120 //120만큼 여백생성 노란뷰가 오른쪽 밖으로밀림.
    }
    //언제 아웃렛컬렉션을 사용할까?
    func configureLabelDsign(){
        // 1. ouletcollection 이용
        for i in dateLabelCollection{
            i.font = .boldSystemFont(ofSize: 20)
            i.textColor = .brown
        }
        let labelArray = [dateLabel,date2Label] // 주의: 이곳에서 선언하면 다른함수에서 사용불가
        // 2. UILabel 이용
        for i in labelArray{
            i?.font = .boldSystemFont(ofSize: 20)
            i?.textColor = .brown
        }
        // dateLabel과같은 방식을 더 권장.
        dateLabel.text = "첫번쨰 텍스트" // dateLabelCollection[0].text 와 동일
        date2Label.text = "두번쨰 텍스트" //dateLabelCollection[1].text 와 동일
    }

    
    @IBAction func datePickerValueChaged(_ sender: UIDatePicker) {
        
        dateLabel.text = format.string(from: sender.date)
        
    }
    
    

}

