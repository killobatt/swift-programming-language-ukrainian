//: ## Об'єкти та Класи
//:
//: Вживаємо `class` + ім'я класу щоб створити клас. Властивості (property) оголошуються точно таким же чином, як константи чи змінні, з єдиною відмінністю, що вони оголошуються в контексті класу. Аналогічно, методи і функції оголошуються однаково.
//:
class Shape {
    var numberOfSides = 0
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

//: - Experiment:
//: Додайте константу за допомогою `let`, і додайте інший метод, що приймає аргумент.
//:
//: Щоб створити екземпляр класу, пишемо круглі дужки після імені класу. До властивостей та методів екземпляру звертаємось через крапку.
//:
var shape = Shape()
shape.numberOfSides = 7
var shapeDescription = shape.simpleDescription()

//: У цій версії класу `Shape` невистачає дечого важливого: ініціалізатору для налаштування класу, коли створюється екземпляр. Вживаємо `init` щоб створити ініціалізатор.
//:
class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

//: Помітьте, як `self` допомагає відрізнити властивість `name` від аргументу ініціалізатора `name`. Коли створюємо екземпляр класу, аргументи передеються до ініціалізатора так само, як і до звичайної функції. Кожній властивості повинно бути присвоєно значення: або в оголошенні (як з `numberOfSides`), або в ініціалізаторі (як з `name`).
//:
//: Вживаємо `deinit` щоб створити деініціалізатор, якщо потрібно виконати певну очистку перед тим, як об'єкт буде знищено.
//:
//: Нащадки класів включають ім'я базового класу після свого імені, відділене двокрапкою. Класи необов'язково повинні спадкувати стандартний кореневий клас, тож спадкуємо або не спадкуємо в залежності від необхідності.
//:
//: Методи класів-надащків можуть заміщувати реалізацію методів базового класу. Такі методи помічаються за допомогою `override`; випадкове заміщення методу, не помічене словом `override`, виявляється компілятором як помилка. Компілятор також виявляє методи, котрі помічені словом `override`, але не заміщують жодного метода в базовому класі.
//:
class Square: NamedShape {
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() ->  Double {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
}
let test = Square(sideLength: 5.2, name: "my test square")
test.area()
test.simpleDescription()

//: - Experiment:
//: Створіть інший нащадок `NamedShape`, назвіть його `Circle`, і нехай він приймає радіус та ім'я як аргументи свого ініціалізатора. Реалізуйте методи `area()` та `simpleDescription()` в класі `Circle`.
//:
//: Окрім простих властивостей, що зберігаються, є такі, що мають функції читання (геттери) та запису (сеттери).
//:
class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0
        }
    }
    
    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)."
    }
}
var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
print(triangle.perimeter)
triangle.perimeter = 9.9
print(triangle.sideLength)

//: У сеттері для `perimeter`, нове значення має неявне ім'я `newValue`. Можна явно вказати ім'я в круглих дужках після `set`.
//:
//: Помітьте, що ініціалізатор класу `EquilateralTriangle` містить три різні кроки:
//:
//: 1. Присвоювання значення властивостям, оголошеним в класі-нащадку.
//:
//: 1. Виклик ініціалізатору базового класу.
//:
//: 1. Зміна значення властивостей, оголошених у базовому класі. Будь-яка додаткова робота, що використовує методи, геттери чи сеттери, може бути виконана в цей момент.
//:
//: Якщо вам не потрібно розраховувати значення властивості, але потрібно, щоб деєкий код виконався перед чи після присвоєння нового значення, вживайте `willSet` та `didSet`. Розміщений тут код буде виконано кожного разу, коли значення змінюється поза ініціалізатором. Наприклад, клас нижче гарантує що довжина сторони його трикутника завжди співпадає з довжиною сторони його квадрата. 
//:
class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}
var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
print(triangleAndSquare.square.sideLength)
print(triangleAndSquare.triangle.sideLength)
triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
print(triangleAndSquare.triangle.sideLength)

//: Працюючи з опціоналами, пишемо `?` перед операціями на кшталт виклику методів, звернень до властивостей, та індексування. Якщо значення перед `?` виявиться `nil`, все, що після `?` буде проігноровано і значення цілого виразу буде `nil`. В іншому випадку, значення опціоналу буде розгорнуто, і все що після `?` буде вести себе як розгорнуте значення. В обох випадках значення всього виразу є опціоналом. 
//:
let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
let sideLength = optionalSquare?.sideLength



//: [Назад](@previous) | [Далі](@next)
