import UIKit

var str = "Hello, playground"

class RocketShip {
    var destination: String
    init(destination: String) {
        self.destination = destination
    }
}

let myRocketShip = RocketShip(destination: "Луна")
myRocketShip.destination

class FarmAnimal {
    var name = "домашнее животное"
    var numberOfLegs = 4
    func sayHello() -> String {
        return "Привет, я домашнее животное!"
    }
    func destination() {
        print("Я \(name), у меня \(numberOfLegs) ног.")
    }
}

class Sheep: FarmAnimal {
    override init() {
        super.init()
        name = "овца"
    }
    override func sayHello() -> String {
        return "Бе-е-е"
    }
    override func destination() {
        super.destination()
        print("Из моей шерсти делают одеяла.")
    }
}

let aSheep = Sheep()
aSheep.sayHello()
aSheep.destination()

class Chicken: FarmAnimal {
    var numberOfEggs = 0
    override init() {
        super.init()
        name = "chiken"
        numberOfLegs = 2
    }
    override func sayHello() -> String {
        return "Кудах-тах-тах"
    }
    override func destination() {
        super.destination()
        print("Я откладываю яйца.")
        if numberOfEggs == 1 {
            print("У меня есть для тебя одно яйцо.")
        } else if numberOfEggs > 0 {
            print("У меня есть для тебя \(numberOfEggs) яиц.")
        }
    }
    func layAnEgg() {
        numberOfEggs += 1
    }
    func giveUpEggs() -> Int {
        let eggs = numberOfEggs
        numberOfEggs = 0
        return eggs
    }
}

let chicken1 = Chicken()
chicken1.layAnEgg()
let chicken2 = Chicken()
chicken2.layAnEgg()
chicken2.layAnEgg()

class Pig: FarmAnimal {
    override init() {
        super.init()
        name = "свинья"
    }
    
    override func sayHello() -> String {
        return "хрю-хрю-хрю"
    }
    override func destination() {
        super.destination()
        print("Я хрюкаю")
    }
}

let animals = [Sheep(), chicken1, chicken2, Sheep(), Chicken(), Sheep(), Pig()]

for animal in animals {
    if animal is Sheep {
        print("Вот что говорит моя овца: \(animal.sayHello())")
    } else if animal is Chicken {
        print("Вот что говорят мои куры: \(animal.sayHello())")
        let chicken = animal as! Chicken
        chicken.layAnEgg()
        chicken.destination()
    } else if animal is Pig {
        print("А вот и моя свинья: \(animal.sayHello())")
    }
}

var gatheredEggs = 0
for animal in animals {
    if let chicken = animal as? Chicken {
        chicken.layAnEgg()
        print("Собираем \(chicken.numberOfEggs) яиц.")
        gatheredEggs += chicken.giveUpEggs()
    }
}
print("Сегодня я собрал \(gatheredEggs) яиц!")

