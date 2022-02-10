/*:
## Exercise - Create Functions

 Write a function called `introduceMyself` that prints a brief introduction of yourself. Call the function and observe the printout.
 */
func introduceMyself() {
    print("Hi! My name is Roman. I'm 3rd-year student of Innopolis University.")
}

introduceMyself()
//:  Write a function called `magicEightBall` that generates a random number and then uses either a switch statement or if-else-if statements to print different responses based on the random number generated. `let randomNum = Int.random(in: 0...4)` will generate a random number from 0 to 4, after which you can print different phrases corresponding to the number generated. Call the function multiple times and observe the different printouts.
import Foundation

func magicEightBall(_ number: Int) {
    switch number{
    case 1:
        print("Definitely")
    case 2:
        print("Definitely maybe")
    case 3:
        print("Maybe")
    case 4:
        print("Definitely no")
    default:
        print("I have no comments")
    }
}

let randomNum = Int.random(in: 0...4)

magicEightBall(randomNum)
magicEightBall(Int.random(in: 0...4))
magicEightBall(Int.random(in: 0...4))
magicEightBall(Int.random(in: 0...4))
magicEightBall(Int.random(in: 0...4))
/*:
page 1 of 6  |  [Next: App Exercise - A Functioning App](@next)
 */
