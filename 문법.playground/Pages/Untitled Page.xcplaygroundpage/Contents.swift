import UIKit

// 1. 옵셔널 바인딩

//ex. 쇼핑리스트 추가
var shoplist : String? = "모니터"
var shoplist2 : String? = "신발"
if shoplist != nil{
    print(shoplist!) //nil이 아니면 실행   ,  강제해제연산자(!)는 가능하면쓰지말자( 앱이꺼짐)
}else{
    print("3")
}
// 2글자("") 이상 꼭 입력해야한다면?
//shoplist = nil 이거하면 아래 if문실행 X

//ex)  ,잭플릭스 로그인화면
if let jack = shoplist, let jack2 = shoplist2,(2...5).contains(jack.count) { // nil이아니면 jack    옵셔널string -> jack에 string 담김            (2...5).contains(jack.count) : jack안의 문자열이 글자수가 2...5 사이면 true
    print(jack,"/",jack2)
}

func optionalBinding(){
    guard let jack = shoplist, let jack2 = shoplist2, (2...5).contains(jack.count) else{ // nil이 아니면 jack에 글자들어감.그리고 패스
        print("글자입력해줘") //jack사용불가 shopliat 가 nil이라서
        return
    }
    
    // guard let 이후에는 var jack = shoplist 와동일
    print(jack)
}
optionalBinding()


//2. 인스턴스 프로퍼티 vs 타입 프로퍼티

class User{
    var nickname = "고래밥" //저장 프로퍼티 (우리가쓰는 변수선언은 다 저장프로퍼티엿다)
                          // 인스턴스 프로퍼티( 인스턴스를 만들어야지만 쓸수있으므로)
    static var staticNickName = "고래밥2" // (저장 프로퍼티(상수/변수저장 프로퍼티), 타입 프로퍼티로도 불림
                                        // static이란건 많이 쓰는변수들앞에는 붙이자
    

}
// UIColor,UILabel,.. UIKit은 다 클래스(상속가능하므로)

let userPerson = User() //클래스 초기화(인스턴스 생성)
userPerson.nickname // 인스턴스생성해야 접근가능
//userPerson.staticNickName //오류 //static붙인거는 접근불가


let user2 = User()
let user3 = User()
let user4 = User()

//User().staticName // 사용불가 (staticName이 타입프로퍼티라서 안됨.)
User.staticNickName // static으로 선언한 변수는 인스턴스선언없이 사용가능
                    // 메모리에 호출시 올라감,    인스턴스 생성해도 초기화되지않고 사용할떄 초기화된다.
