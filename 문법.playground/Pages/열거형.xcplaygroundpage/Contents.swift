import UIKit

var email :  String = "jack@jack.com" // 선언과 초기화

var email2 : String? = "jack@jack.com"

type(of: email)
type(of: email2)

var array : [Int] = Array(repeating: 0, count:5) //숫자 0 을 5개 만들겟다
var array2 : [Int] = [Int](1...5) // 1,2,3,4,5
type(of: array2)
var arrayOptional : [Int]? = [Int](1...5) // 1,2,3,4,5
type(of: arrayOptional)

if arrayOptional?.count == 0{
    "값없어"
} // arrayOptional.count하면 nil일수도있기떄문에 count할수없음. 그래서 옵셔널체이닝으로 해결
else{
    "값있어"
}

//위 if문 줄이기(삼항연산자), 반환값은 무조건 모든상황에 대응가능해야함.
func example() ->String{
    let result = (arrayOptional == nil) ? "값이없다" : "값이있다" //return이라기보단 String문자가 어떤게 들어오냐의차이
    return (result != "값이없다") ? "no value" : "value"
}
//example()
//result //오류(함수벗어나면 변수없어짐)



func bmiResult() -> (String,Double){
    let result = Double.random(in: 1...30)
    if result < 18.5 {
        return ("가",1)
    }
    else if result < 24{
        return ("나",2)
    }
    return ("다",3)
}
print(bmiResult())
// 문자열 보간법
print("\(bmiResult().0)의 BMI 등급은 \(bmiResult().1)")
print(type(of: bmiResult()))
print(bmiResult().0 + "의 BIM 등급은 " + bmiResult().0) //bmiResult().1은 숫자형인데 전체적으로 문자열+숫자형 덧셈이라 오류

// swift 5.1 부터 return 생략가능
@discardableResult // return형을 안써도된다. 선언
func randomNum() -> Int{
    Int.random(in: 1...10) // 한줄에선 return 생략가능
}
print(randomNum()+10)

func sayHello(nickname:String? = "고래밥", gender : Int?, what:String = "무엇")->String{ //nickname이 nil인경우
    return nickname! + "님 hi" + "\(gender!)" + what
}
sayHello(gender: 1)
sayHello(nickname: "칙촉", gender:2)

func sayHello2(nickname:String? = "고래밥2")->String{
    return nickname!
}
sayHello2()
sayHello2(nickname: "칙촉2")
print("안 녕","하",separator: "(사이값)",terminator: "마지막꺼")



// 열거형

enum Gender : String{
    case man = "남"
    case woman = "여"
    case nothing
}

var gender : Gender = Gender.woman
gender.rawValue //여
var gender2 : Gender = Gender.nothing
gender2.rawValue //nothing

switch gender{
    case .man: print(Gender.man) //man
    case .woman : print(Gender.woman)//woman
    case .nothing : print(Gender.nothing)//nothing
}

enum HTTPCode : Int{
    case ok                     // 0
    case no_page                // 1
    case not_found = 404
    case server_error          // 405
    
    func showStatus()->String{
        switch self{
        case .ok: return "ok"
        case.server_error: return "서버오류"
        case.no_page: return "페이지 오류"
        case.not_found: return "찾을수없음"
        }
    }
}
var networkStatus: HTTPCode = .no_page //HTTPCode.no_page 생략
networkStatus.rawValue//1
networkStatus.showStatus() // 페이지오류
var net : HTTPCode = .server_error
net.rawValue //405

var ls = ["A":0]
ls["A"]! += 1







