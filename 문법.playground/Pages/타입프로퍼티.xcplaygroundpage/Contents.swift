//: [Previous](@previous)

import Foundation

//인스턴스생성여부상관없이 타입저장프로퍼티의 값은 오직하나.

struct User{
    static var originalName = "찐이름" //타입저장프로퍼티
    var nickname = "고래밥" //인스턴스 저장 프로퍼티
}


var user1 = User()
user1.nickname = "울라프"
User.originalName = "리잭"
print(user1.nickname,User.originalName)

var user2 = User()
print(user2.nickname,User.originalName)

var user3 = User()
print(user3.nickname,User.originalName)
var user4 = User()
print(user4.nickname,User.originalName)



/** 연산프로퍼티 (인스턴스 연산 프로퍼티/ 타입 연산 프로퍼티 **/

struct BMI{
    var nickname : String //저장 프로퍼티
    var weight : Double
    var height : Double

    // 저장 프로퍼티는 메모리 차지, 연산프로퍼티는 메모리올라가지 않음(주로 원하는값 반환용도)
    //get은 읽기전용 프로퍼티이지만 계산하는값에따라 결과가 달라질수있기떄문에 var를 많이사용
    var BMIResult : String{//오노테이션 //연산프로퍼티        // static붙이면 오류 (static끼리는 static끼리, 인스턴스는 인스턴스끼지 해줘야해)
        get {
            
            let bmivalue = (weight/weight) / height
            let bmistatus = bmivalue < 18.5 ? "저체중" : "정상이상"

            return "\(nickname)의 BMI는 \(bmivalue)로 \(bmistatus)입니다."
        }
        set{
            nickname = newValue
        }
    }
    //이렇게도되지만 연산프로퍼티 목적에 맞지않음.
    var sample: String{
        "\(Int.random(in: 1...10))" // 한줄사용시 return(String은 리턴타입)이나 get은 생략가능
    }

}

var bmi = BMI(nickname: "고래밥", weight: 50, height: 180)

/*    bmi.BMIResult와 동일
let bmivalue = (bmi.weight/bmi.weight) / bmi.height
let bmistatus = bmivalue < 18.5 ? "저체중" : "정상이상"
let result =  "\(bmi.nickname)의 BMI는 \(bmivalue)로 \(bmistatus)입니다."
print(result)
*/

print(bmi.BMIResult)

bmi.BMIResult = "바뀐이름"
print(bmi.BMIResult)



class FoodRestaurant{
    let name = "잭치킨"
    var totalOrderCnt = 0
    var nowOrder : Int {
        get{ //필수
            return totalOrderCnt * 5000
        }
        set(jack){ // 아무것도안적으면 아래에서는 jack대신 newValue로 쓰면됨.// 선택사항(옵션)
            totalOrderCnt += jack //기본 파라미터가 jack를 쓴다 . , 값이 얼마추가될지모르니
        }
    }
}

let food = FoodRestaurant()
print(food.nowOrder)

food.totalOrderCnt += 4

// food.totalOrderCnt += 2
// food.totalOrderCnt += 2 계속더해질수있음.
food.nowOrder = 10 // 10은 newValue에 넣음 , set만실행
print(food.nowOrder) //70000 , get만 실행

food.nowOrder = 2
print(food.nowOrder) // 80000

food.nowOrder = 2
print(food.nowOrder) //90000


//UIButton
//button.setTitle(title:String?,for:UIControl.State) // 버튼글자작성
//button.titleLabel?.text // set도있음 값을가져옴
//button.titleLabel?.text = "dd" //이게됨.
//button.currentTitle // get만있음, 값을가져옴
//button.currentTitle = "dd" //그래서 이게안됨.

//열거형은 타입자체, >인스턴스생성불가->초기화구문 없다.
// 인스턴스 생성통해 접근할수있는 인스턴스저장프로퍼티 사용불가,그러면 인스턴스연산 프로퍼티는? 사용가능
// 메모리 관점 + 연거형이 컴파일 타입에 확정되어야한다.
// 타입저장(static)프로퍼티 -> 열거형 사용가능
enum viewType{
    case start
    case change
    
    //인스턴스저장프로퍼티
//    var nickname : String = "고래밥" //오류 , 인스턴스저장프로퍼티 사용불가
    
    //인스턴스연산 프로퍼티
    var settitle : String{ //인스턴스연산 프로퍼티는? 사용가능
        get{
            return "설정"
        }
        
    }
    
    // 타입저장프로퍼티
    static var title = "시작하기"
}
viewType.title

// 타입저장, 타입연산, 인스턴스저장, 인스턴스연산   프로퍼티
//결론: 타입저장,인스턴스연산,타입연산은 열거형,구조체 다 사용가능,
//     인스턴스는 열거형에선 사용불가(초기화구문만들수없어서) 구조체는사용가능

// 타입연산프로퍼티
class TypeFoodResaurant{
    var name : String{
        willSet(newnickname){
            print("\(name) , \(newnickname)")
        }
        didSet{
            print(oldValue,"33333")
        }
    }
    init(name:String){
        self.name = name
    }
    
    static var totalOrderCnt = 1 //타입저장프로퍼티
    static var nowOrder : Int { //타입연산프로퍼티
        get{ //필수
            return totalOrderCnt * 5000
        }
        set(jack){ // 아무것도안적으면 아래에서는 jack대신 newValue로 쓰면됨.// 선택사항(옵션)
            totalOrderCnt += jack //기본 파라미터가 jack를 쓴다 . , 값이 얼마추가될지모르니
        }
    }
    
    static var noworder23 = 10{
        willSet{    // 변경직전에 실행
            print("\(noworder23)에서 \(newValue) 변경예정")
        }
        didSet{     // 변경직후에 실행
            print("\(noworder23)에서 \(oldValue) 변경완료")

        }
    }
    
}

let myFood = TypeFoodResaurant(name:"아") //인스턴스생성필요없음(타입프로퍼티경우)
myFood.name = "바뀜"

TypeFoodResaurant.nowOrder // 5000 get실행(값읽기)

TypeFoodResaurant.nowOrder = 2 // 15000 set실행
TypeFoodResaurant.nowOrder

// 속성감시자: 저장프로퍼티에서 주로사용, 값을 관찰하다가 변경될거같을떄 변경되었음 호출(willSet,didSet)

TypeFoodResaurant.noworder23 = 33



// 메소드 부분 이부분부터
struct Coffee{  //class Coffee
    static var name = "아아"
    static var shot = 2
    var price = 4000 //인스턴스(저장) 프로퍼티
    static func plusshot(){
        Coffee.shot += 1 //shot+=1은 오류 , 타입은타입/저장은저장끼리 논다
//        price+=300 //인스턴스(저장) 변수라서 static함수에서 사용불가
        
    }
    mutating func plusshot2(){ // 구조체에서쓴다. mutating
        price+=300
    }
//    class func minusshot(){   // struct하면 class못함,(상속못하므로) , class Coffee
//        shot -= 1
//    }
}

//class Latte: Coffee{ // 타입메소드는 ovveride가 class는 가능, static은 불가능
//    override class func minusshot() { // 슈퍼클래스 타입메서드를 재정의해서 쓰고싶다면 class
//
//    }
//}
