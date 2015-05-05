import Foundation
/*

1  Building Abstractions with Procedures

1.1  The Elements of Programming

1.1.1  Expressions
1.1.2  Naming and the Environment
1.1.3  Evaluating Combinations
1.1.4  Compound Procedures
1.1.5  The Substitution Model for Procedure Application
1.1.6  Conditional Expressions and Predicates
1.1.7  Example: Square Roots by Newton's Method
1.1.8  Procedures as Black-Box Abstractions


*/
//••• 1.1.1  Expressions
///*


486

137 + 349

1000 - 334

5 * 99

10 / 5

2.7 + 10

21 + 35 + 12 + 7

25 * 4 * 12

(3 * 5) + (10 - 6)

(3 * ((2 * 4) + (3 + 5))) + ((10 - 7) +  6)


//*/
//•••  1.1.2  Naming and the Environment
/*


let size = 2
5 * size

let pi = 3.14159
let radius: Double = 10

pi * (radius * radius)

let circumference = 2 * pi * radius

*/
//•••  1.1.3  Evaluating Combinations
/*


(2 + (4 * 6)) * (3 + 5 + 7)


*/
//•••  1.1.4  Compound Procedures
/*


func square(x: Double) -> Double {
    return x * x
}

square(21)

square(2 + 5)

square(square(3))

func sumOfSquares(#x: Double, #y: Double) -> Double {
    return square(x) + square(y)
}

sumOfSquares(x: 3, y: 4)

func f(a: Double) -> Double {
    return sumOfSquares(x: (a + 1), y: (a * 2))
}

f(5)


*/
//•••  1.1.5  The Substitution Model for Procedure Application
/*


// previously defined start
func f(a: Double) -> Double {
    return sumOfSquares(x: (a + 1), y: (a * 2))
}

func sumOfSquares(#x: Double, #y: Double) -> Double {
    return square(x) + square(y)
}

func square(x: Double) -> Double {
    return x * x
}
// previously defined end


// Applicative order - Evaluate arguments and then apply

// The Substitution model for procedure application

f(5)
// sumOfSquares(x: (a + 1), y: (a * 2))
sumOfSquares(x: (5 + 1), y: (5 * 2))
square(6) + square(10)
(6 * 6) + (10 * 10)
36 + 100
136

// Normal order - "fully expand and then reduce" evaluation

f(5)
// expansions
sumOfSquares(x: (5 + 1), y: (5 * 2))
(square(5 + 1)) + (square(5 * 2))
((5 + 1) * (5 + 1)) + (( 5 * 2) * ( 5 * 2))
// reductions
(6 * 6) + (10 * 10)
36 + 100
136


*/
//•••  1.1.6  Conditional Expressions and Predicates
/*


func abs(x: Double) -> Double {
    if x > 0 {
        return x
    } else if x < 0 {
        return -x
    }
    return 0
}

abs(-1)
abs(0)
abs(1)

func abs1(x: Double) -> Double {
    if x < 0 { // <predicate>
        return -x // <consequent>
    } else {
        return x // <alternative>
    }
}

func abs2(x: Double) -> Double {
    return x < 0 ? -x : x
    // <predicate> ? <consequent> : <alternative>
}

let x = 6
(x > 5) && (x < 10)

func xGreaterThanOrEqualToY(#x: Double, #y: Double) -> Bool {
    // return x > y || x == y
    // return x >= y
    return !(x < y)
}

xGreaterThanOrEqualToY(x: 3, y: 3)


*/
//••• Exercise 1.1: Below is a sequence of expressions. What is the result printed by the interpreter in response to each expression? Assume that the sequence is to be evaluated in the order in which it is presented.
/*


10

5 + 3 + 4

9 - 1

6 / 2

(2 * 4) + (4 - 6)

var a = 3

let b = a + 1

a + b + (a * b)

a = b

if (b > a) && (b < (a * b)) {
    b
} else {
    a
}
// or
(b > a) && (b < (a * b)) ? b : a

switch (a,b) {
case (4, _): 6
    fallthrough
case (_, 4): 6 + 7 + a
default: 25
}

2 + (b > a ? b : a)

if a > b {
    a * (a + 1)
} else if a < b {
    b * (a + 1)
} else {
    -1 * (a + 1)
}


*/
//••• Exercise 1.2: Translate the following expression into prefix form
/*


// (/ (+ 5 4(- 2 (- 3 (+ 6 (/ 4 5)))))
//    (* 3(- 6 2)(- 2 7)))


*/
//••• Exercise 1.3: Define a procedure that takes three numbers as arguments and returns the sum of the squares of the two larger numbers.
/*


func square(a: Double) -> Double {
    return a * a
}

func sumOfSquares(a: Double, b: Double) -> Double {
    return square(a) + square(b)
}

func twoLargerNumbers(values: Double ...) -> (Double, Double) {
    let arr = values.sorted(>)
    return (arr[0], arr[1])
}

func procedure(a: Double, b: Double, c: Double) -> Double {
    let tuple = twoLargerNumbers(a,b,c)
    return sumOfSquares(tuple.0, tuple.1)
}

procedure(5, 3, 1)


*/
//••• Exercise 1.4: Observe that our model of evaluation allows for combinations whose operators are compound expressions. Use this observation to describe the behavior of the following procedure.
/*


func aPlusAbsB(a: Double, b: Double) -> Double {
    return b > 0 ? a + b : a - b
}

// The predicate (b > 0) determines if the operator after operand "a" should be "+" or "-" in order for operand "b" to be evaluated as an absolute


*/
//••• Exercise 1.5: Ben Bitdiddle has invented a test to determine whether the interpreter he is faced with is using applicative-order evaluation or normal-order evaluation. He defines the following two procedures:
/*


var cnt = 0

func p() {
    cnt++
    return p()
}

func test(x: Double, y:()) {
    if x == 0 {
        0
    } else {
        p()
    }
}

// Then he evaluates the expression

// test(0.0, p()) //---> never terminates / ∞

// 🐢 - not sure about the following answer

// Applicative order is used
// if Normal order was used, x == 0, 0 would evaluate first before p() is evalated, program will terminate


*/
// ••• 1.1.7  Example: Square Roots by Newton's Method
/*


func abs(x: Double) -> Double {
    return x < 0 ? -x : x
}

func square(a: Double) -> Double {
    return a * a
}

func goodEnough(guess: Double, x: Double) -> Bool {
    return abs(square(guess) - x) < 0.001
}

func average(x: Double, y: Double) -> Double {
    return (x + y) / 2
}

func improve(guess: Double, x: Double) -> Double {
    return average(guess, x / guess)
}

func sqrtIter(guess: Double, x: Double) -> Double {
    if goodEnough(guess, x) {
        return guess
    } else {
        return sqrtIter(improve(guess, x), x)
    }
}

func sqrt(x: Double) -> Double {
    return sqrtIter(1.0, x)
}

sqrt(9.0)
sqrt(100.0 + 37.0)
sqrt(sqrt(2.0) + sqrt(3.0))
square(sqrt(1000.0))


*/
//••• Exercise 1.6:  Alyssa P. Hacker doesn't see why if needs to be provided as a special form. "Why can't I just define it as an ordinary procedure in terms of cond?" she asks. Alyssa's friend Eva Lu Ator claims this can indeed be done, and she defines a new version of if:
/*


// previously defined start
//
func goodEnough(guess: Double, x: Double) -> Bool {
    return abs(square(guess) - x) < 0.001
}

func square(a: Double) -> Double {
    return a * a
}

func average(x: Double, y: Double) -> Double {
    return (x + y) / 2
}

func improve(guess: Double, x: Double) -> Double {
    return average(guess, x / guess)
}
//
// previously defined end

func newIf(#predicate: Bool, #thenClause: Double, #elseClause: Double) -> Double {
    return predicate ? thenClause : elseClause
}

// Eva demonstrates the program for Alyssa:
newIf(predicate: 2 == 3, thenClause: 0.0, elseClause: 5.0)
newIf(predicate: 1 == 1, thenClause: 0.0, elseClause: 5.0)

// Delighted, Alyssa uses new-if to rewrite the square-root program
func sqrtIter(guess: Double, x: Double) -> Double {
    return newIf(predicate: goodEnough(guess, x),
        thenClause: guess,
        elseClause: sqrtIter(improve(guess, x),x))
}

func sqrt(x: Double) -> Double {
    return sqrtIter(1.0, x)
}

//sqrt(9.0)

// Q: What happens when Alyssa attempts to use this to compute square roots? Explain.
// A: the newIf function uses applicative order evalutation. the interpreter first evaluates the operator and operands and then applies the resulting procedure to the resulting arguments. this results in an infinite recursion because the else-clause is always evaluated


*/
//••• Exercise 1.7) i: The good-enough? test used in computing square roots will not be very effective for finding the square roots of very small numbers. Also, in real computers, arithmetic operations are almost always performed with limited precision. This makes our test inadequate for very large numbers. Explain these statements, with examples showing how the test fails for small and large numbers.
/*


// previously defined start
//

func abs(x: Double) -> Double {
    return x < 0 ? -x : x
}

func square(a: Double) -> Double {
    return a * a
}

func goodEnough(#guess: Double, #x: Double) -> Bool {
    return abs(square(guess) - x) < 0.001
}

func improve(#guess: Double, #x: Double) -> Double {
    return average(guess, x / guess)
}

func average(x: Double, y: Double) -> Double {
    return (x + y) / 2
}

func sqrtIter(#guess: Double, #x: Double) -> Double {
    if goodEnough(guess: guess, x: x) {
        return guess
    } else {
        return sqrtIter(guess: improve(guess: guess, x: x), x: x)
    }
}

func sqrt(x: Double) -> Double {
    return sqrtIter(guess: 1.0, x: x)
}

//
// previously defined end


sqrtIter(guess: 1, x: 0.0001)

// x        sqrtIter            calculator          acceptable
//---------------------------------------------------------------
// 0.1      0.316245562280389   0,316227766016838   ✔︎
// 0.01     0.100325785109606   0.1                 ✔︎
// 0.001    0.04124542607499115 0,031622776601684   ✖︎
// 0.0001   0.03230844833048122 0,01                ✖︎


 sqrtIter(guess: 1, x: 1000000000000) // evaluates
// sqrtIter(guess: 1, x: 10000000000000) // loops


// x                sqrtIter    calculator          acceptable
//---------------------------------------------------------------
// 1000000000000    1000000     1000000             ✔︎
// 10000000000000   ∞           3162277,66016838    ✖︎



*/
//••• Exercise 1.7) ii: An alternative strategy for implementing good-enough? is to watch how guess changes from one iteration to the next and to stop when the change is a very small fraction of the guess. Design a square-root procedure that uses this kind of end test. Does this work better for small and large numbers?
/*



// previously defined start
//

func abs(x: Double) -> Double {
    return x < 0 ? -x : x
}

func square(a: Double) -> Double {
    return a * a
}

func improve(#guess: Double, #x: Double) -> Double {
    return average(guess, x / guess)
}

func average(x: Double, y: Double) -> Double {
    return (x + y) / 2
}

func sqrtIter(#guess: Double, #x: Double) -> Double {
    if goodEnough(guess: guess, x: x) {
        return guess
    } else {
        return sqrtIter(guess: improve(guess: guess, x: x), x: x)
    }
}

func sqrt(x: Double) -> Double {
    return sqrtIter(guess: 1.0, x: x)
}
//
// previously defined end

func goodEnough(#guess: Double, #x: Double) -> Bool {
    return abs(improve(guess: guess, x: x) - guess) < guess * 0.001
}

sqrtIter(guess: 1, x: 0.000001)

// x        sqrtIter                calculator          acceptable
//------------------------------------------------------------------
// 0.1      0.316245562280389       0,316227766016838   ✔︎
// 0.01     0.1000005289564269      0.1                 ✔︎
// 0.001    0.03164201586865079     0,031622776601684   ✔︎
// 0.0001   0.01000071403871175     0,01                ✔︎
// 0.00001  0.003162292647723271    0,003162277660168   ✔︎
// 0.000001 0.001000553871053945    0,001               ✔︎

// sqrtIter(guess: 1, x: 1000000000000) // evaluates
// sqrtIter(guess: 1, x:   10000000000000) // loops


// x                sqrtIter            calculator          acceptable
//---------------------------------------------------------------
// 1000000000000    1000454.990804133   1000000             ✖︎
// 10000000000000   3162433.547242504   3162277,66016838    ✖︎


// looks ok for smaller numbers, not so much for larger numbers
// 🐢 revisit



*/
//••• Exercise 1.8: Newton's method for cube roots is based on the fact that if y is an approximation to the cube root of x, then a better approximation is given by the value. ((r / y * y )+ 2y) / 3
/*



func square(x: Double) -> Double {
    return x * x
}

func abs(x: Double) -> Double {
    return x < 0 ? -x : x
}

func goodEnough(guess: Double, previousGuess: Double) -> Bool {
    return abs(guess - previousGuess) < (abs(guess * 0.001))
}

func sumArray(xs: [Double]) -> Double {
    return reduce(xs, 0) { result, x in result + x }
}

func average(xs: Double ...) -> Double {
    let total = sumArray(xs)
    let count = Double(xs.count)
    return total / count
}

func improveGuess(#guess: Double, x: Double) -> Double {
    return average(x / square(guess), guess, guess)
}

func cubeRootIter(#guess: Double, #previousGuess: Double, x: Double) -> Double {
    return goodEnough(guess, previousGuess) ? guess : cubeRootIter(guess: improveGuess(guess: guess, x), previousGuess: guess, x)
}

func cubeRoot(x: Double) -> Double {
    return cubeRootIter(guess: 1.0, previousGuess: 0, x)
}

cubeRoot(8)
cubeRoot(27)
cubeRoot(1000)

cubeRoot(-8)
cubeRoot(-27)
cubeRoot(-1000)



*/
//••• 1.1.8  Procedures as Black-Box Abstractions
/*



// procedural abstraction

// local names

// A formal parameter of a procedure has a very special role in the procedure definition, in that it doesn't matter what name the formal parameter has. Such a name is called a bound variable, and we say that the procedure definition binds its formal parameters.


// Internal definition and block structure

func square(x: Double) -> Double {
    return x * x
}

func abs(x: Double) -> Double {
    return x < 0 ? -x : x
}

func average(xs: Double ...) -> Double {
    let total = sumArray(xs)
    let count = Double(xs.count)
    return total / count
}

func sumArray(xs: [Double]) -> Double {
    return reduce(xs, 0) { result, x in result + x }
}

func sqrt(x: Double) -> Double {
    
    let improve = { (guess: Double) -> Double in
        return average(guess, x / guess)
    }
    
    let goodEnough = { (guess: Double) -> Bool in
        return abs(square(guess) - x) < 0.001
    }

    let squareIter: Double -> Double = {
        var s: (Double -> Double)!
        s = { guess in
            return goodEnough(guess) ? guess : s(improve(guess)) }
        return s
        }()
    
    return squareIter(1.0)
}

sqrt(9.0)

*/