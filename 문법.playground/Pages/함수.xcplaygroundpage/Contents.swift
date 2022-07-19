import UIKit

// 매개변수 X
func setNickName() -> Void{
    print("고래밥 입니다")
}

setNickName()

//매개변수 O
func setNickNameParameter(nickname:String) -> Void{
    print("\(nickname)입니다") //개발자입장에서만 씀.
}
setNickNameParameter(nickname: "칙촉") //반환값 없음

// 리턴값 O
func setNickNameReturn(nickname:String) -> String{
    return "\(nickname)입니다"
}
setNickNameReturn(nickname: "새우깡") //새우깡입니다 반환

func getGameCharacter(name:String, age:Int) -> [String]{
    let character = ["도적","마법사","주술사","전사"]
    let select = character.randomElement()!
    return [name,select]
}

// resultLabel.text = getGameCharacter("야야",10)

var dic : [String:Int] = ["A":0,"B":0]
dic["A"]! += 1
//dic["A"] += 1
print(dic["A"]!)


// 반환형, 반환안함 차이
var numls:Set = [1,3,4,5,10]
var num2ls:Set = [3,4]
numls.subtracting(num2ls)
print(numls) // 원본 안건드림 "[10, 5, 4, 3, 1]\n"
numls.subtract(num2ls)
print(numls) //원본 바뀜 "[10, 5, 1]\n"

//리스트에서도 가능
var ls = [1,3,4,10]
ls.shuffled() // 반환값 0
print(ls) //"[1, 3, 4, 10]\n"
ls.shuffle()  // 반환값 x
print(ls) //"[1, 10, 3, 4]\n"



