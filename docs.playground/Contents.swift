import UIKit

let decimalIntiger = 17
let binaryInteger = 0b10001  // 17 in binary notation
let octalInteger = 0o21 // 17 in octal notation
let hexidecimalInteger = 0x11 // 17 in hexideximal notation


let three = 3
let pointOneFourOneFiveNine = 0.14159
let pi = Double(three) + pointOneFourOneFiveNine
print(pi)


// Tuples
let http404Error = (404, "Not Found")

let (statusCode, statusMessage) = http404Error
print("The statusCode is: \(statusCode)")
print("The statusMessage is: \(statusMessage)")


let (statusCodeOnly, _) = http404Error
print("The statusCode is: \(statusCodeOnly)")

print("StatusCode is: \(http404Error.0)") // You can use .0 .1 etc. to access idividual element values
print("StatusMessage is: \(http404Error.1)")



// Optionals
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)
// convertedNumber  is inferred to be of type "Int?", or "optional Int"

/* The question mark indicates that the value it contains is optional, meaning that it might contain some Int value, or it might contain no value at all. (It can’t contain anything else, such as a Bool value or a String value. It’s either an Int, or it’s nothing at all.) */
var serverResponseCode: Int? = 404
// serverResponseCode contains an actual Int value of 404
serverResponseCode = nil
// serverResponseCode now contains no value


/* nil cannot be used with nonoptional constants and variables. If a constant or variable in your code needs to work with the absence of a value under certain conditions, always declare it as an optional value of the appropriate type. */
var surveyAnswer: String?
// automatically set to nil


if convertedNumber != nil {
    print("convertedNumber contains an Int value")
}

/* Once you’re sure that the optional does contain a value, you can access its underlying value by adding an exclamation mark (!) to the end of the optional’s name. The exclamation mark effectively says, “I know that this optional definitely has a value; please use it.” This is known as forced unwrapping of the optional’s value: */
if convertedNumber != nil {
    print("convertedNumber has an integer value of \(convertedNumber!)")
}

if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber && secondNumber < 100 {
    print("\(firstNumber) < \(secondNumber) < 100")
}

if let firstNumber = Int("4") {
    if let secondNumber = Int("42") {
        if firstNumber < secondNumber && secondNumber < 100 {
            print("\(firstNumber) < \(secondNumber) < 100")
        }
    }
}

let possibleString: String? = "An optional string"
let forcedString: String = possibleString! // requires an exclamation mark

let assumedString: String! = "An implicitly unwrapped optional String"
let implicitString: String = assumedString // no need for an exclamation mark

if assumedString != nil {
    print("\(assumedString)")
}

if let definiteString = assumedString {
    print("\(definiteString)")
}

let (x,y) = (1,2)
print(x,y)


//
let contentHieght = 40
let hasHeader = true
let rowHeight = contentHieght + (hasHeader ? 50 : 20)



//
let defaultColorName = "red"
var userDefinedColor: String?  // defaults to nil

var colorNameToUse = userDefinedColor ?? defaultColorName
print(colorNameToUse)

userDefinedColor = "green"
colorNameToUse = userDefinedColor ?? defaultColorName
print(colorNameToUse)


//
let names = ["Billy", "Sarah", "Jada", "Brayden"]
let count = names.count
for i in 0..<count {
    print("Person \(i + 1) is called \(names[i])")
}


// Use command + control + spacebar to bring up emojis
for character in "Dog!🐶".characters {
    print(character)
}



var word = "cafe"
print("The number of characters in \(word) is \(word.characters.count)")
word += "\u{301}" // combining accute accent
print("The number of characters in \(word) is \(word.characters.count)")




//
let greeting = "Guten Tag!"
greeting[greeting.startIndex]
greeting[greeting.index(before: greeting.endIndex)]
greeting[greeting.index(after: greeting.startIndex)]
let index = greeting.index(greeting.startIndex, offsetBy: 7)
greeting[index]

for index in greeting.characters.indices {
    print("\(greeting[index]) ", terminator: "")
}


var welcome = "hello"
welcome.insert("!", at: welcome.endIndex)
welcome.insert(contentsOf: " there".characters, at:welcome.index(before: welcome.endIndex))
welcome.remove(at: welcome.index(before: welcome.endIndex))
print("\n\(welcome)")
let range = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex
welcome.removeSubrange(range)
print(welcome)


// Strings and characters
//
let romeoAndJuliet = [
"Act 1 Scene 1: Veronica, A public place",
"Act 1 Scene 2: Capulet's mansion",
"Act 1 Scene 3: A room in Capulet's mansion",
"Act 1 Scene 4: A street outside Capulet's mansion",
"Act 1 Scene 5: The Great Hall in Capulet's mansion",
"Act 2 Scene 1: Outside Capulet's mansion",
"Act 2 Scene 2: Capulet's orchard",
"Act 2 Scene 3: Outside Friar Lawrence's cell",
"Act 2 Scene 4: A street in Verona",
"Act 2 Scene 5: Capulet's mansion",
"Act 2 Scene 6: Friar Lawrence's cell"
]

var act1SceneCount = 0
for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1") {
        act1SceneCount += 1
    }
}
print("There are \(act1SceneCount) scenes in Act 1")

var mansionCount = 0
var cellCount = 0
for scene in romeoAndJuliet {
    if scene.hasSuffix("Capulet's mansion") {
        mansionCount += 1
    }else if scene.hasSuffix("Friar Lawrence's cell") {
        cellCount += 1
    }
}
print("\(mansionCount) mansion scenes; \(cellCount) cell scenes")


// Collection Types 
var Billy = "𓄂"
print(Billy)

//
var shoppingList: [String] = ["Eggs", "Milk"]
// shorter form is: var shoppingList = ["Eggs", "Milk"]
print("The shopping list has \(shoppingList.count) items")
if shoppingList.isEmpty {
    print("Nothing in list")
} else {
    print("List is not empty")
}
shoppingList.append("Flour")
shoppingList += ["Baking Powder"]
shoppingList += ["Chocolate Spread", "Cheese", "Butter"]
for i in shoppingList {
    print("\(i)")
}
var firstItem = shoppingList[0]
shoppingList[0] = "Six eggs"
shoppingList[4...6] = ["Bananas", "Apples"] // replaces chocolate spread, cheese, and butter.
shoppingList.insert("Maple Syrup", at: 0)
let maypleSyrup = shoppingList.remove(at: 0) // wow pretty cool
let apples = shoppingList.removeLast()

for (ind, value) in shoppingList.enumerated() { // Reeeeee
    print("Item \(ind + 1): \(value)")
}


// Collection Types: Sets
var favoriteGenres: Set<String> = ["Rap", "R&B", "Rock"]
//shorter var favoriteGenres: Set = []
// accessing and modifying a set
if favoriteGenres.contains("Funk") {
    print("Get Funky")
}else {
    print("Get the Funk outta here")
}

for genre in favoriteGenres {
    print("\(genre)")
}

for genre in favoriteGenres.sorted() {
    print("\(genre)")
}

let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

houseAnimals.isSubset(of: farmAnimals)
farmAnimals.isSubset(of: houseAnimals)
farmAnimals.isSuperset(of: houseAnimals)
farmAnimals.isDisjoint(with: cityAnimals)

// Collection types: Dictionaries
var namesOfStrings = [Int: String]()
namesOfStrings[16] = "sixteem"

var airports: [String: String] = ["YYZ":"Toronto Pearson", "DUB":"Dublin"]
airports["LHR"] = "London Heathrow"
print("\(airports.count)")
if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print("\(oldValue)")
}
for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}

// If you need to use a dictionary’s keys or values with an API that takes an Array instance, initialize a new array with the keys or values property
let airportCodes = [String](airports.keys)
let airportNames = [String](airports.values)

// Control flow
let familyNames = ["Billy", "Sarah", "Jada", "Brayden"]
for name in familyNames {
    print("Hello, \(name)!")
}

let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
for (animalNames, legCount) in numberOfLegs {
    print("\(animalNames)s have \(legCount) legs")
}


// Interval Matching
let aproximateCount = 62
let countedThings = "moons orbiting Saturn"
let naturalCount: String
switch aproximateCount {
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "several"
case 12..<100:
    naturalCount = "dozens of"
case 100..<1000:
    naturalCount = "hundreds of"
default:
    naturalCount = "many"
}
print("There are \(naturalCount) \(countedThings).")


// Continue
let puzzleInput = "Great minds think alike"
var puzzleOutput = ""
let charactersToRemove: [Character] = ["a","e","i","o","u"," "]
for character in puzzleInput.characters {
    if charactersToRemove.contains(character) {
        continue
    } else {
        puzzleOutput.append(character)
    }
}

print(puzzleOutput)

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














