//: ## Прості значення
//: Використовуйте `let` щоб оголосити константу і `var` щоб оголосити змінну. Значення константи не обов’язково повинно бути відомо під час компіляції, але ви маєте присвоїти константі значення лише раз. Це означає що ви можете вживати константи щоб іменувати значення що ви визначаєте лише один раз, але використовуєти у багатьох місцях.
//:
 var myVariable = 42
 myVariable = 50
 let myConstant = 42

//: Константа чи змінна повинна мати той же само тип, що і значення, котре ви хочете їй присвоїти. Однак вам не завжди потрібно вказувати тип явно. Коли ви створюєте константу чи змінну і одразу присвоюєте значення, компілятор має можливість вивести її тип. У прикладі вище, компілятор виводить ще тип myVariable є цілочисельний, бо її початкове значення цілочисельне.
//: Якщо початкове значення не дає достатньо інформації (або немає початкового значення), слід зазначити тип, вказавши його після змінної або константи, і відділивши двокрапкою.
//:
let implicitInteger = 70
let implicitDouble = 70.0
let explicitDouble: Double = 70

//: - Experiment:
//: Створіть константу з явним типом `Float` і значенням `4`.
//:
//: Значення ніколи не конвертуються до іншого типу неявно. Якщо вам треба конвертувати значення до іншого типу, створіть екземпляр іншого типу явно.
//:
 let label = "The width is "
 let width = 94
 let widthLabel = label + String(width)

//: - Experiment:
//: Спробуйте прибрати конвертацію до `String` в останньому рядку. Яку помилку ви отримаєте?
//:
//: Є навіть простіший спосіб включити значення до рядка: напишіть вираз у круглих дужках, і поставте зворотній слеш (`\`) перед дужками. Наприклад:
//:
 let apples = 3
 let oranges = 5
 let appleSummary = "I have \(apples) apples."
 let fruitSummary = "I have \(apples + oranges) pieces of fruit."

//: - Experiment:
//: Використайте `\()` щоб включити розрахунок з плаваючою точкою в рядок, а також щоб включити чиєсь ім’я до привітання.
//:
//: Створюйте звичайні та асоціативні масиви за допомогою прямокутних дужок (`[]`), і отримуйте їх елементи через написання індексу чи ключу в прямокутних дужках. Після останнього елементу дозволяється кома.
//:
 var shoppingList = ["catfish", "water", "tulips", "blue paint"]
 shoppingList[1] = "bottle of water"
 
 var occupations = [
 "Malcolm": "Captain",
 "Kaylee": "Mechanic",
 ]
 occupations["Jayne"] = "Public Relations"

//: Щоб створити порожній масив, використовуйте синтаксис ініціалізаторів.
//:
 let emptyArray = [String]()
 let emptyDictionary = [String: Float]()

//: Якщо інформація про тип може бути виведеною, ви можете писати порожній масив як `[]` і порожній асоціативния масив як `[:]`. Наприклад, коли ви присвоюєте нове значення змінній чи передаєте аргумент у функцію.
//:
 shoppingList = []
 occupations = [:]
//:
//: [Назад](@previous) | [Далі](@next)
