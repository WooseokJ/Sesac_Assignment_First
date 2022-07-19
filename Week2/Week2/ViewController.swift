import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sampleView1: UIView!
    
    
    
     let nickname = "고래밥"
    override func viewDidLoad() {
        super.viewDidLoad()
        let nickname =  "칙촉"
        print(nickname) //칙촉
        print(self.nickname) //고래밥
        print(ViewController().nickname)//고래밥
        
        
        sampleView1.layer.cornerRadius = 20 //sampleView1.frame.width/2
        sampleView1.layer.shadowRadius = 30 // shadow
        sampleView1.clipsToBounds = false
                                            // Bounds와 shadow(그림자)는 함께 쓸수없다
                                            // 두가지를 겹쳐서 같이쓰는것처럼 보이게 해야한다 .
//        sampleView1.isUserInteractionEnabled 
        //clipstobounds vs cornerredius vs shadow
        
        sampleView1.layer.maskedCorners = [.layerMaxXMaxYCorner]
        
        
        //                                      년    월  일 시  분  초
        // DateFormatter : 알아보기 쉬운날짜 + 시간대 (yyyy MM dd hh:mm:ss) 주의:mm은 분단위
        //                                      2022 07 14

        //                                      yy m dd : 22 7 14
        
        
        let format = DateFormatter()
        format.dateFormat = "M월 d일, yy년 입니다"
        let DateToString = format.string(from: Date() ) //Date()는 현재시간 나옴.
        print(DateToString)
        print(Date())
        
        let word = "10월 10일 21년"
        let StringToDate = format.date(from: word)
        print(StringToDate)
        //시간이 차이나는건 영국표준시간을 기준으로하기떄문 그래서 지역설정같은것을 해야지 정확하게 나옴.
        

        
    }

    @IBAction func sliderValueChanged(_ sender: Any) {
        print("sliderChanged")
    }
    @IBAction func datepicker(_ sender: Any) {
    }
    @IBAction func search(_ sender: Any) {
    }
    
}




