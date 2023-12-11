import Foundation

/*: # Section A, Question 2 - Greatest Common Divisor:
 The function would take in two integer values, and would return an integer of the largest common divisor. Since the two input integer values will change through subtraction, it would make sense to declare it as a variable rather than a constant.
 
 
 For this problem, I used a recursive approach to solve the greatest common divisor problem.
 Specifically, I used the Euclidean Algorithm by subtraction.
 Basically, this algorithm would perform the subtraction on the greater number value. The base case and what we would return is if both numbers are equal to each other.
 
 */
 
/*:Pseduo-code:
* if firstNumber > secondNumber
    * recursiveCall(firstNumber - secondNumber, secondNumber)
* if secondNumber > firstNumber
    * recursiveCall(firstNumber, secondNumber - firstNumber)
* if firstNumber is equal to secondNumber
    * return firstNumber
*/
 

func greatestCommonDivisor(num1: Int, num2: Int) -> Int {
    //     Base Case:
    if (num1 == num2){
        return num1;
    } else if (num1 > num2){
        return greatestCommonDivisor(num1: num1-num2, num2: num2);
    } else {
        return greatestCommonDivisor(num1: num1, num2: num2-num1);
    }
}
var gcd = greatestCommonDivisor(num1: 16, num2: 4);
print(gcd);




/*: # Section A, Question 3 - How much time should I wait:
 The function would take in four parameter integer values(firstHour, firstMinute, secondHour, secondMinute), and would return a string outputting the time difference.
 
 
 For this problem, I first converted the hour into minutes to get the total minutes for each time. This is done by multiplying the hour by 60, and then adding the minute.
 I then found the differences between the two times in minutes. After that, I converted it back to hours and minutes through the operation of modulo and division. To get the minutes, we get the remainder by taking the total difference in time and performing a modulo on 60. When then take the remaining difference and divide that by 60 to get the hours of wait time.

 Since the all input integer values used will not change (as it is given to us), it makes sense to declare it as a constant rather than a variable.
 
 
 
 */

/*:Pseduo-code:
 * firstTimeInMinutes = firstHour*60 + firstMinute (convert into minutes)
 * secondTimeInMinutes = secondHour*60 + secondMinute (convert into minutes)
 * timeDiff = |firstTimeInMinutes - secondTimeInMinutes |
 * minutesWait = timeDiff % 60
 * hoursWait = (timeDiff - minutesWait) / 60
*/

func computeTimeDifference(firstHour: Int, firstMinute: Int, secondHour: Int, secondMinute: Int) -> String {
    let firstInMinutes = (firstHour * 60) + firstMinute;
    let secondInMinutes = (secondHour * 60) + secondMinute;
    
    let diffInMinutes = abs(firstInMinutes - secondInMinutes);
    
    let minutesToWait = diffInMinutes % 60;
    let hoursToWait = (diffInMinutes - minutesToWait) / 60;
    
    return "You should wait \(hoursToWait) hour(s) and \(minutesToWait) minute(s)";
}

var timeToWait = computeTimeDifference(firstHour: 1, firstMinute: 30, secondHour: 2, secondMinute: 30)
print(timeToWait);




/*: # Section A, Question 4 - Did I have my parenthesis correct?:
 The function would take in a parameter of a string, which represents what to parse and check parenthesis for. The output or return of the function would be a boolean, telling us whether the input string has the parenthesis parsed correctly or not.
 
 Because the stack will be an array that will change in size, we declare it as a variable.
 
 For this problem, I implemented a stack which appends to the array everytime a open parenthesis "(" appears. When a closing parenthesis ")", it will check the stack to see if there is a matching "(". If so, it will pop it off the stack.

 
 
 */

/*:Pseduo-code:
 * for each character in the expression/string
    * if the character is "("
        * add it to the stack
    * if the character is ")"
        * pop from stack
    * if none of the above, return false
 
 * return true if stack is empty and false otherwise
*/
func verifyParenthesis(expression: String) -> Bool {
    var stack = [Character]();
    
    for c in expression {
        if (c == "("){
            stack.append(c);
        }
        else if ( (c == ")") && (stack.last == "(") && (!stack.isEmpty) ){
            stack.removeLast();
        }
        else {
            return false
        }
    }
    

    return stack.isEmpty
}

var v_parenthesis = verifyParenthesis(expression: "(");
print(v_parenthesis)







/*: # Section B, Question 8 - Sum of powers:
 The closure would take in two integers, m and n, which takes the summation of and determines what point will the summation stop. The closure will return and output the double of the summation of the powers.
 
 Inside the function, we initialize the sum to 0.0 and declare it as a variable (as it will change over the for-loop). Inside the for loop, it will run the computation, expontiating the iteration number by n, m times.
 
 */

/*:Pseduo-code:
 * for each iteration until m
    * sum += indexNum ** n
 
 * return sum when finished
*/


let sumOfPowers: (Int, Int) -> Double = { (n, m) in
    var summation = 0.0;
    
    for i in 1...m {
        summation += pow(Double(i), Double(n));
    }
    return summation;
}

var summation = sumOfPowers(2, 5)
print("Summation in the end: \(summation)")
