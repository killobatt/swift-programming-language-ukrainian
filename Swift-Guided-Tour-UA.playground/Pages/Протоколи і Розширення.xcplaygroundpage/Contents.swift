//: ## Протоколи і Розширення
//:
//: Вживаємо `protocol` щоб оголосити протокол.
//:
protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}

//: Класи, пересислення, і структури можуть реалізовувати протокол.
//:
class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class."
    var anotherProperty: Int = 69105
    func adjust() {
        simpleDescription += "  Now 100% adjusted."
    }
}
var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription

struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure"
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}
var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription

//: - Experiment:
//: Створіть перечислення, що реалізовує цей протокол.
//:
//: Помітимо ключове слово `mutating` у оголошенні `SimpleStructure`: воно вказує, що даний метод мутуючий, тобто він змінює дану структуру. В оголошенні `SimpleClass` не потрібно помічати жодних методів мутуючими, бо методи класу завжди можуть його змінювати.
//:
//: Щоб додати функціональності вже існуючим типам, використовуємо розширення, котрі оголошуютья за допомогою `extension`. Розширення можуть додавати нові методи та властивості, що розраховуються. Також за допомогою розширення можна додати відповідність до протоколу типу, що оголошений десь в іншому місці, або навіть до типу, що було імпортовано з бібліотеки чи фреймворка.
//:
extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
}
print(7.simpleDescription)

//: - Experiment:
//: Створіть розширення типу `Double` що додає властвість `absoluteValue` - математичний модуль числа.
//:
//: Можна використовувати ім'я протоколу так само, як і будь-яке інше ім'я типу. Наприклад, щоб створити колекцію об'єктів різних типів, кожен з яких відповідає єдиному протоколу. Коли ви працюєти зі значеннями, чий тип є протоколом, його методи і властивості, котрі оголошені зовні протоколу, є недоступними.
//:
let protocolValue: ExampleProtocol = a
print(protocolValue.simpleDescription)
// print(protocolValue.anotherProperty)  // Розкоментуйте, щоб побачити помилку

//: Незважаючи на те, що змінна `protocolValue` під час виконання має тип `SimpleClass`, компілятор відноситься до неї як до даного типу `ExampleProtocol`. Це означає що ви не можете випадково доступатись до методів чи властивостей, котрі клас реалізовує додатково до його реалізації протоколу.
//:


//: [Назад](@previous) | [Далі](@next)
