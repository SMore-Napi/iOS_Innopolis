/*:
## Exercise - Constant or Variable?
 
 Imagine you're creating a simple photo sharing app. You want to keep track of the following metrics for each post:
- Number of likes: the number of likes that a photo has received
- Number of comments: the number of comments other users have left on the photo
- Year created: The year the post was created
- Month created: The month the post was created represented by a number between 1 and 12
- Day created: The day of the month the post was created
 
 For each of the metrics above, declare either a constant or a variable and assign it a value corresponding to a hypothetical post. Be sure to use proper naming conventions.
 */
var numberOfLikes: Int = 20
print("Number of likes may change if new users like a photo. So, we need to update this variable.")
var numberOfComments: Int = 5
print("Number of comments may change if new users left some comments on the photo. So, we need to update this variable.")
let yearCreated: Int = 2022
print("The particular post can be published only once. So, it is not necessary to update the year when the photo was uploaded.")
let monthCreated: Int = 5
print("The particular post can be published only once. So, it is not necessary to update the month when the photo was uploaded.")
let dayCreated: Int = 24
print("The particular post can be published only once. So, it is not necessary to update the day number when the photo was uploaded.")
/*:
[Previous](@previous)  |  page 5 of 10  |  [Next: App Exercise - Fitness Tracker: Constant or Variable?](@next)
 */
