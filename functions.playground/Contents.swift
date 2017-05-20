//: Playground - noun: a place where people can play

import UIKit

// Functions
func greet(person: String) -> String {
    let greeting = "Hello, " + person + "!"
    return greeting
}

print(greet(person: "Billy"))

// printing without returning
func greet2(person:String) {
    print("Hello, \(person)")
}
greet2(person: "Sarah")


// Functions with multiple return values
func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        }else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
print("Min is \(bounds.min), Max is \(bounds.max)")

func someFunction(parameterWithoutDefault: Int, parameterWithDefault: Int = 12) {
    // If you omit the second argument when calling this function, then
    // the value of parameterWithDefault is 12 inside the function body.
}
someFunction(parameterWithoutDefault: 3, parameterWithDefault: 6) // parameterWithDefault is 6
someFunction(parameterWithoutDefault: 4) // parameterWithDefault is 12

// If you don’t want an argument label for a parameter, write an underscore (_) 
//instead of an explicit argument label for that parameter.

func someFunction(_ firstParameterName: Int, secondParameterName: Int) {
    // In the function body, firstParameterName and secondParameterName
    // refer to the argument values for the first and second parameters.
}
someFunction(1, secondParameterName: 2)



func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
print(arithmeticMean(1, 2, 3, 4, 5))


// ! swapping Integers  This was my interview question
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let tempA = a
    a = b
    b = tempA
}
var someInt = 3
var anotherInt = 107

swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")

func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}

func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a * b
}

var mathFunction: (Int, Int) -> Int = addTwoInts
print("Result: \(mathFunction(2,3))")

mathFunction = multiplyTwoInts
print("Result: \(mathFunction(2,3))")

let anotherFunction = addTwoInts

func printMathResult(_ mathFunction: (Int,Int) -> Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a,b))")
}
printMathResult(addTwoInts, 3, 5)

// Function types as return types 
func stepForward(_ input: Int) -> Int {
    return input + 1
}

func stepBackward(_ input: Int) -> Int {
    return input - 1
}

func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    return backward ? stepBackward : stepForward
}

var currentValue = 3
let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)

while currentValue != 0 {
    print("\(currentValue)...")
    currentValue = moveNearerToZero(currentValue)
}

print("zero")

func chooseAnotherStepFunction(backward: Bool) -> (Int) -> Int {
    func stepFor(input: Int) -> Int { return input + 1 }
    func stepBack(input: Int) -> Int { return input - 1 }
    return backward ? stepBack : stepFor
}
var currentValue2 = -4
let moveNearerTo0 = chooseAnotherStepFunction(backward: currentValue2 > 0)

while currentValue2 != 0 {
    print("\(currentValue2)... ")
    currentValue2 = moveNearerTo0(currentValue2)
}
print("zero!")





