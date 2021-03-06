/*:
## Exercise - Type Casting and Inspection

 Create a collection of type [Any], including a few doubles, integers, strings, and booleans within the collection. Print the contents of the collection.
 */
let myCollectrion: [Any] = [2.2, "hello", true, 56, "world", 3.14, false, 72]
print(myCollectrion)
//:  Loop through the collection. For each integer, print "The integer has a value of ", followed by the integer value. Repeat the steps for doubles, strings and booleans.
for element in myCollectrion {
    if let el = element as? Int {
        print("The integer has a value of \(el)")
    } else if let el = element as? Double {
        print("The double has a value of \(el)")
    } else if let el = element as? String {
        print("The string has a value of \(el)")
    } else if let el = element as? Bool {
        print("The boolean has a value of \(el)")
    }
}
//:  Create a [String : Any] dictionary, where the values are a mixture of doubles, integers, strings, and booleans. Print the key/value pairs within the collection
let myDictionary: [String: Any] = ["first": 2.2, "second": "hello", "third": true, "fourth": 56, "fifth": "42", "sixth": 3.14, "seventh": false, "eighth": 72]
for (key, value) in myDictionary {
    print("\(key) : \(value)")
}
//:  Create a variable `total` of type `Double` set to 0. Then loop through the dictionary, and add the value of each integer and double to your variable's value. For each string value, add 1 to the total. For each boolean, add 2 to the total if the boolean is `true`, or subtract 3 if it's `false`. Print the value of `total`.
var total: Double = 0
for value in myDictionary.values {
    if let number = value as? Int {
        total += Double(number)
    } else if let number = value as? Double {
        total += number
    } else if value is String {
        total += 1
    } else if let boolean = value as? Bool {
        if boolean {
            total += 2
        } else {
            total -= 3
        }
    }
}
print(total)
//:  Create a variable `total2` of type `Double` set to 0. Loop through the collection again, adding up all the integers and doubles. For each string that you come across during the loop, attempt to convert the string into a number, and add that value to the total. Ignore booleans. Print the total.
var total2: Double = 0
for value in myDictionary.values {
    if let number = value as? Int {
        total2 += Double(number)
    } else if let number = value as? Double {
        total2 += number
    } else if let str = value as? String  {
        if let number = Double(str) {
            total2 += number
        }
    }
}
print(total2)
/*:
page 1 of 2  |  [Next: App Exercise - Workout Types](@next)
 */
