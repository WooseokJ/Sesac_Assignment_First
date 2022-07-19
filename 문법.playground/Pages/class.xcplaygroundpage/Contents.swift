import Foundation

class Monster{
    var clothes = "Orange"
    var speed = 5
    var power = 20
    var expoint :Double = 500
    func attack(){ //func attack()->void
        print("공격")
    }
}



var easyMonster = Monster() // 초기화(인스턴스)
easyMonster.clothes //ornage
easyMonster.attack() // Monster
class BossMonster : Monster{
    var levelLimit = 500
    func bossAttack() -> String{
        return "스폐셜공격"
    }
    override func attack() {
        super.attack() //공격
        print("오버라이드 공격")
    }
}

var finalMonster = BossMonster()
finalMonster.bossAttack() //return 이 스페셜공격
finalMonster.speed
finalMonster.attack() // return 이 BossMonster


// 구조체는 값타입이고 클래스는 참조타입이다. 

var nickname = "고래밥"
var subnickName = nickname
subnickName="칙촉"
print(nickname) //고래밥
print(subnickName) // 칙촉

var MiniMoster = Monster()
var bossMonster = MiniMoster
bossMonster.power = 5000
print(MiniMoster.power) //5000
print(bossMonster.power) //5000

