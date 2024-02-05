import UIKit

let exampleLet = 10
var exampleVar = 20

exampleLet += 1
// Cant change a Let, since its immutable (is a constant)

exampleVar += 1
// Can change a var because it IS mutable (not constant)



var count = 0
// setting a count variable
for i in 1...5 {
    count += 1
    print(i)
//    prints 1 to 5
}
print(count)



let pi = 3.1415

var circleDiameter = Int.random(in: 1...10)

let area = Float(circleDiameter) * Float(pi)
print("The Circumference of the circle is \(area)!")



var stringCheese = "Hello"

stringCheese += ", my name is"

stringCheese += "Dom!"

print(stringCheese) // "Hello, my name is Dom!\n"



var rng = Int.random(in: 1...10)

if rng > 10 {
    
    print(rng, "is more than 10!")
    
} else if rng > 5 {
    
    print(rng, "is more than 5!")

} else {
    
    print(rng, "is less than 5!")
}
