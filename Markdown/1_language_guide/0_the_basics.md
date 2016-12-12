## Основи

Мова Swift - це нова мова програмування для розробки додатків для iOS, macOS, watchOS, та tvOS. Проте багато частин Swift будуть знайомі з вашого досвіду розробки на мовах C та Objective-C.

Мова Swift надає свої власні версії всіх фундаментальних типів C та Objective-C, включаючи `Int` для цілих чисел, `Double` та `Float` для значень з плаваючою комою, `Bool` для Булевих значень, та `String` для текстової інформації. Мова Swift також надає потужні версії трьох основних типів колекцій: `Array`, `Set`, та `Dictionary`, як описано в [Колекціях](3_collection_types.md).

Як і мова C, мова Swift використовує зміння щоб зберігати значення та щоб посилатись на них по ідентифікатору. У мові Swift також широко вживаються змінні, чиє значення не може бути змінене. Вони відомі як константи, але вони набагато потужніші ніж константи в мові C. Константи вживаються всюди у Swift, щоб зробити код безпечнішим та більш ясним у намірах, коли ви працюєте зі значеннями, котрим не потрібно змінюватись. 

Окрім знайомих типів, у мові Swift з'являються більш розвинені типи, котрих нема в Objective-C, наприклад, кортежі. Кортежі дозволяють створювати та передавати групи значень. За допомогою кортежа можна повернути одразу декілька значень з функції як єдине об'єднане значення.

У мові Swift також вводяться опціональні типи - опціонали - які дозволяють обробляти відсутність значення. Опціонали виражають або "є деяке значення, і воно дорівнює x” або “немає взагалі жодного значення”. Користування опціоналами схоже на використання `nil` із вказівниками в Objective-C, але опціонали працюють з усіма типами, а не тільки з класами. Опціонали є не просто більш безпечніші та виразніші аніж вказівники на `nil` в Objective-C, вони лежать у серці найбільш потужних можливостей Swift.

Мова Swift типобезпечна, тобто мова допомагає вам виражатись ясно щодо типів значень, з якими  працює ваш код. Якщо частина вашого коду очікує `String`, типобезпечність не дасть вам помилково передати в нього `Int`. Подібним чином типобезпечність не дасть вам помилково передати опціональний `String` в частину коду, котра очікує неопціональний `String`. Типобезпечність дозволяє в процесі розробки відловлювати і виправляти помилки як можна раніше.

### Константи і змінні

Константи і змінні асоціюють ім'я (як, наприклад, `maximumNumberOfLoginAttempts` чи `welcomeMessage`) із значенням певного типу (такі як число `10` чи рядок `"Hello"`). Як тільки значення константи задано, воно не може бути змінене, тоді як значення змінної може бути змінене на інше в майбутньому.

#### Оголошення констант та змінних

Константи і змінні повинні бути оголошені до того, як вони будуть вжиті. Константи оголошуються за допомогою ключового слова `let`, а змінні - за допомогою ключового слова `var`. Ось приклад того, як константи і змінні можуть бути використані для того, щоб відслідковувати кількість спроб користувача увійти в систему.  

```swift
let maximumNumberOfLoginAttempts = 10
```

This code can be read as:

> 
```





```swift
```


```swift
```
> 
 

####Naming Constants and Variables

```swift
```

> If you need to give a constant or variable the same name as a reserved Swift keyword, surround the keyword with backticks (`` ` ``) when using it as a name. However, avoid using keywords as names unless you have absolutely no choice.

```swift
```

```swift

####Printing Constants and Variables
``` 


```swift
```

> All options you can use with string interpolation are described in String Interpolation.

```swift
// This is a comment.
```



```swift
/* This is also a comment
 but is written over multiple lines. */
```


```swift
```

#### Semicolons

```swift
let cat = "🐱"; print(cat)
```

#### Integers


#### Integer Bounds

```swift
let minValue = UInt8.min  // minValue is equal to 0, and is of type UInt8
```

The values of these properties are of the appropriate-sized number type (such as `UInt8` in the example above) and can therefore be used in expressions alongside other values of the same type.


 + On a 64-bit platform, `Int` is the same size as `Int64`.
	


 + On a 64-bit platform, `UInt` is the same size as `UInt64`.
 
> **Note**
> 
> Use `UInt` only when you specifically need an unsigned integer type with the same size as the platform’s native word size. If this is not the case, `Int` is preferred, even when the values to be stored are known to be non-negative. A consistent use of `Int` for integer values aids code interoperability, avoids the need to convert between different number types, and matches integer type inference, as described in [Type Safety and Type Inference]().
 
#### Floating-Point Numbers
 
 + Double represents a 64-bit floating-point number.
 
> `Double` has a precision of at least 15 decimal digits, whereas the precision of `Float` can be as little as 6 decimal digits. The appropriate floating-point type to use depends on the nature and range of values you need to work with in your code. In situations where either type would be appropriate, `Double` is preferred.


Swift is a type-safe language. A type safe language encourages you to be clear about the types of values your code can work with. If part of your code expects a String, you can’t pass it an Int by mistake.

Because Swift is type safe, it performs type checks when compiling your code and flags any mismatched types as errors. This enables you to catch and fix errors as early as possible in the development process.




```swift
```


```swift
```


```



	

```swift
```


 
 `1.25e-2` means 1.25 x 10<sup>-2</sup>, or `0.0125`.
 

 
 

let decimalDouble = 12.1875
```


```swift
```

#### Numeric Type Conversion





```swift
```



```swift
```



##### Integer and Floating-Point Conversion


```swift

Here, the value of the constant `three` is used to create a new value of type `Double`, so that both sides of the addition are of the same type. Without this conversion in place, the addition would not be allowed.


```swift
```

> The rules for combining numeric constants and variables are different from the rules for numeric literals. The literal value 3 can be added directly to the literal value `0.14159`, because number literals do not have an explicit type in and of themselves. Their type is inferred only at the point that they are evaluated by the compiler.




```swift
```


```swift
```




```swift
```



```swift
```


```swift
```


```swift
```


####Tuples


```swift
```


```


```swift
```


```swift
```


```swift
```


> **Note**
> 
> Tuples are useful for temporary groups of related values. They are not suited to the creation of complex data structures. If your data structure is likely to persist beyond a temporary scope, model it as a class or structure, rather than as a tuple. For more information, see [Classes and Structures]().

