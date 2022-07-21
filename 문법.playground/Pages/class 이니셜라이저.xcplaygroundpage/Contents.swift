import Foundation



class Monster{
    var name = "쉬운몬스터"
    var level = 1
}

let easy = Monster()
var hard = easy
hard.name = "어려운몬스터"
hard.level = 100

print(easy.name,easy.level)
print(hard.name,hard.level)

//nil을 담을수 있는 프로퍼티(속성)은 나중에 초기화해도됨.
// nil을 담을수없는 프로퍼티(속성)는 값이 무조건있어야해.그래서 초기화 필요. => 이니셜라이저
class Monster2{
//    var name2 = String? // nil을 가질수있는상태
//    var level2 = Int? // nil을 가질수있는상태
    
    var name : String
    var level : Int
    
    init(name : String, level : Int){ // name,level는 매개변수     // 초기화(이니셜라이저)구문
        self.name = name // self.name는 위에선언한name, name 는 매개변수
        self.level = level
    }
}

//let easy2 = Monster2() //클래스를 초기화 한것. 인스턴스를 만들었다.
let easy2 = Monster2(name: "달팽이몬스터", level: 3) //클래스를 초기화 한것. 인스턴스를 만들었다.

struct StructMonster{
    var name : String
    var level : Int
}

let Smonter =  StructMonster(name: "구조체몬스터", level:3) // 구조체는 init안해도 쓸수있음. 자동으로제공됨.(멤버와이즈 초기화구문)
                                                                                            // 멤버: 프로퍼티(속성)+메서드(함수)
// Smonter.name = "구조체몬스터2" //오류 구조체의 name은 스택에 저장되있어서 바꿀수없음.
easy2.name = "클래스 몬스터 " // 바뀜.   클래스의 주소값은 바뀌지않음. 하지만 힙영역에 name값은 바뀜.


