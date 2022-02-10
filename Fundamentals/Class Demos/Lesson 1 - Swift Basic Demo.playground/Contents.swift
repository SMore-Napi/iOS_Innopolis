let maximumNumberOfLoginAttempts = 10
var currentLoginAttempt = 0

var x = 0.0, y = 0.0, z = 0.0

var welcomeMessage: String
welcomeMessage = "Hello"

var red, green, blue: Double

let π = 3.14159
let 你好 = "你好世界"
let 🐶🐮 = "dogcow"

/// You can change the value of an existing variable to another value of a compatible type. In this example, the value of friendlyWelcome is changed from "Hello!" to "Bonjour!":

var friendlyWelcome = "Hello!"
friendlyWelcome = "Bonjour!"

/// friendlyWelcome is now "Bonjour!"
/// Unlike a variable, the value of a constant can’t be changed after it’s set. Attempting to do so is reported as an error when your code is compiled:

let languageName = "Swift"
languageName = "Swift++"
/// This is a compile-time error: languageName cannot be changed.


// This is a comment.

/* This is also a comment
but is written over multiple lines. */


let cat = "🐱"; print(cat)


let minValue = UInt8.min  // minValue is equal to 0, and is of type UInt8
let maxValue = UInt8.max  // maxValue is equal to 255, and is of type UInt8



let twoThousand: UInt16 = 2_000
let one: UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one)


let three = 3
let pointOneFourOneFiveNine = 0.14159
let pi = Double(three) + pointOneFourOneFiveNine
// pi equals 3.14159, and is inferred to be of type Double

let integerPi = Int(pi)
// integerPi equals 3, and is inferred to be of type Int

typealias AudioSample = UInt16


let orangesAreOrange = true
let turnipsAreDelicious = false

if turnipsAreDelicious {
    print("Mmm, tasty turnips!")
} else {
    print("Eww, turnips are horrible.")
}

// can we change orangesAreOrange to 1?


let http404Error = (404, "Not Found")
// http404Error is of type (Int, String), and equals (404, "Not Found")


let (statusCode, statusMessage) = http404Error
print("The status code is \(statusCode)")
// Prints "The status code is 404"
print("The status message is \(statusMessage)")
// Prints "The status message is Not Found"

print("The status code is \(http404Error.0)")
// Prints "The status code is 404"
print("The status message is \(http404Error.1)")
// Prints "The status message is Not Found"


let http200Status = (statusCode: 200, description: "OK")


let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)

if convertedNumber != nil {
    print("convertedNumber contains some integer value.")
}
// Prints "convertedNumber contains some integer value."


if convertedNumber != nil {
    print("convertedNumber has an integer value of \(convertedNumber!).")
}
// Prints "convertedNumber has an integer value of 123."

var serverResponseCode: Int? = 404
// serverResponseCode contains an actual Int value of 404

print("Initially the server response is \(serverResponseCode)")

serverResponseCode = nil
// serverResponseCode now contains no value

print("Then the server response is \(serverResponseCode)")

if let response = serverResponseCode {
    print("Finally the server response is \(response)")
}

var someInts: [Int] = []
print("someInts is of type [Int] with \(someInts.count) items.")

someInts.append(3)
// someInts now contains 1 value of type Int
someInts = []
// someInts is now an empty array, but is still of type [Int]

var threeDoubles = Array(repeating: 0.0, count: 3)
// threeDoubles is of type [Double], and equals [0.0, 0.0, 0.0]

var anotherThreeDoubles = Array(repeating: 2.5, count: 3)
// anotherThreeDoubles is of type [Double], and equals [2.5, 2.5, 2.5]

var sixDoubles = threeDoubles + anotherThreeDoubles
// sixDoubles is inferred as [Double], and equals [0.0, 0.0, 0.0, 2.5, 2.5, 2.5]

var shoppingList: [String] = ["Eggs", "Milk"]
// shoppingList has been initialized with two initial items

if shoppingList.isEmpty {
    print("The shopping list is empty.")
} else {
    print("The shopping list isn't empty.")
}

print("The shopping list contains \(shoppingList.count) items.")

shoppingList += ["Baking Powder"]
// shoppingList now contains 4 items
shoppingList += ["Chocolate Spread", "Cheese", "Butter"]
// shoppingList now contains 7 items


var firstItem = shoppingList[0]
// firstItem is equal to "Eggs"

shoppingList[0] = "Six eggs"
// the first item in the list is now equal to "Six eggs" rather than "Eggs"
