import UIKit


enum DrinkSize{
    case short,tall,grande,venti
}

class DrinkClass { // 상속받을떄 부모꺼 프로퍼티도 초기화가 잘되있어야하는데 안되있을수도있으므로 아래서 초기화구문이필요
    let name : String
    var count : Int
    var size : DrinkSize
    
    //클래스는 초기화 구문이 필요 -> 상속떄문
    init(name: String, count:Int, size:DrinkSize)
    {
        self.name = name
        self.count = count
        self.size = size
        
    }
}

struct DrinkStruct{
    let name : String
    var count : Int
    var size : DrinkSize
}
let drinkClass = DrinkClass(name: "스무디", count: 2, size: .grande)
drinkClass.count = 5
drinkClass.size = .tall

print(drinkClass.name,drinkClass.count,drinkClass.size)



let drinkStruct = DrinkStruct(name: "스무디", count: 2, size: .grande)
//drinkStruct.count = 10 //오류뜸(변경불가)
//drinkStruct.size = .tall //오류뜸(변경불가)
print(drinkStruct.name,drinkStruct.count,drinkStruct.size)


struct Poster {
    // 구조체를 인스턴스로 생성해야만 그인스턴스를 통해 image프로퍼티에 접근 가능
    var image: UIImage = UIImage(systemName: "star") ?? UIImage() //star가 아니면 빈이미지, 인스턴스프로퍼티
    
    // 어떻게 init초기화구문 작성가능할까?  // 이미 모든프로퍼티에 값이있으므로 초기화할필요없음
    // 맴버와이즈,이니셜라이져를 갖고있지만, 추가적인 구현도 가능.
    
    init(){ //
        print("포스터 메모리에 올라갔어(초기화)")
    }
    //필요에 따라 초기화구문을 여러형태로 만들어 사용가능
    init(defaultImage : UIImage){
        self.image = defaultImage
    }
    init(customImage : UIImage? = UIImage(named: "star")){
        self.image = customImage!
    }
}

// 인스턴스마다 image프로퍼티가 다른값을 가질수있을까요? yes
var one = Poster()
//one.image = UIImage(named:"happy")
var two = Poster()
var three = Poster()





struct MediaInfo{
    var mediaTitle: String
    var mediaRuntime: Int
    lazy var mediaPoster: Poster = Poster() // 지연저장 프로퍼티
                                            // 이변수를쓰면 초기화를쓸수있음
                                            // 처음 초기화할떄 lazy쓰면 초기화안됨. 그래서 이변수를쓰면 원하는시점에 내가 초기화를쓸수있어
                                            // let선언시오류: let은 값이안바뀐다.,상수는 인스턴스생성전에 값이항상있어야해 let으로선언하면 처음인스턴스(초기화)할떄 생성할떄 값갖고있어야하는데 못하고있어서
}

var media = MediaInfo(mediaTitle: "오징어게임", mediaRuntime: 123) //초기화한다.

// 만약 mediaPoster 호출안하면 메모리저장안됨.

//100개중 1개만플레이

media.mediaPoster //저장을 지연,초기화하기 부담스러울떄
                    // let media이면오류나는데 구조체는 값을바꿀수없으므로 초기화할떄 값이바뀔수있어서 오류


//타입 프로퍼티(static) ->디폴트가 지연저장 프로퍼티 형태로 동작   그래서 lazy 안 써도된다.
struct User{
    static let name = "고래밥" //static붙입면 인스턴스 안불러도 User.name으로 쓸수있어(원래는 User().name)
    static let age = 13
}
User.name //호출시점에서 메모리올라감



