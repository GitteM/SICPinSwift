import Foundation

/*:

## 1.2  Procedures and the Processes They Generate

### 1.2.1  Linear Recursion and Iteration
### 1.2.2  Tree Recursion
### 1.2.3  Orders of Growth
### 1.2.4  Exponentiation
### 1.2.5  Greatest Common Divisors
### 1.2.6  Example: Testing for Primality

*/


/*:
### 1.2.1  Linear Recursion and Iteration
*/
/*

//: linear recursive process for computing 6

func factorialr(n: Double) -> Double {
    return n == 1 ? 1: n * (factorialr(n - 1))
}

factorialr(6)
6 * factorialr(5)
6 * 5 * factorialr(4)
6 * 5 * 4 * factorialr(3)
6 * 5 * 4 * 3 * factorialr(2)
6 * 5 * 4 * 3 * 2 * factorialr(1)
6 * 5 * 4 * 3 * 2 * 1
6 * 5 * 4 * 3 * 2
6 * 5 * 4 * 6
6 * 5 * 24
6 * 120
720


//: linear iterative process for computing 6

func factoriali(n: Double) -> Double {
    return factIter(1, 1, n)
}

func factIter(product: Double, counter: Double, maxCount: Double) -> Double {
    return counter > maxCount ? product : factIter(counter * product, counter + 1, maxCount)
}


factoriali(6)
factIter(1, 1, 6)
factIter(1, 2, 6)
factIter(2, 3, 6)
factIter(6, 4, 6)
factIter(24, 5, 6)
factIter(120, 6, 6)
factIter(720, 7, 6)

//: Tail Recursion: execute an iterative process in constant space, even if the iterative process is described by a recursive procedure

*/
/*:
### Exercise 1.9.  Each of the following two procedures defines a method for adding two positive integers in terms of the procedures inc, which increments its argument by 1, and dec, which decrements its argument by 1.
*/
/*

func plusRecursive(a: Double, b: Double) -> Double {
    return a == 0 ? b : plusRecursive((a - 1), b) + 1
}

plusRecursive(4, 5)

func r(a: Double, b: Double) -> Double {
    return a == 0 ? b : r((a - 1), b) + 1
}

r(4, 5)
1 + r(4 - 1, 5)
1 + r(3, 5)
1 + 1 + r(3 - 1, 5)
1 + 1 + 1 + r(2 - 1, 5)
1 + 1 + 1 + r(1, 5)
1 + 1 + 1 + 1 + r(1 - 1, 5)
1 + 1 + 1 + 1 + r(0, 5)
1 + 1 + 1 + 1 + 5
1 + 1 + 1 + 6
1 + 1 + 7
1 + 8
9


func plusIterative(a: Double, b: Double) -> Double {
    return a == 0 ? b : plusIterative(a - 1, b + 1)
}

plusIterative(4, 5)

func it(a: Double, b: Double) -> Double {
    return a == 0 ? b : it(a - 1, b + 1)
}

it(4,5)
it(4 - 1, 5 + 1)
it(3,6)
it(3 - 1, 6 + 1)
it(2, 7)
it(2 - 1, 7 + 1)
it(1, 8)
it(1 - 1, 8 + 1)
it(0, 9)
9


*/
/*:
### Exercise 1.10.  The following procedure computes a mathematical function called Ackermann's function.
*/
/*


func a1(m: Double, n: Double) -> Double {
    if n == 0 {
        return 0
    } else if m == 0 {
        return 2 * n
    } else if n == 1 {
        return 2
    } else {
        return a1(m - 1, a1(m, n - 1))
    }
}

func a2(m: Double, n: Double) -> Double {
    switch (m,n) {
    case (_,0): return 0
    case (0,n): return 2 * n
    case (_,1): return 2
    default: return a2(m - 1, a2(m, n - 1))
    }
}

//: What are the values of the following expressions?

//a1(1, 10)
//a2(1, 10)
//
//a1(2, 4)
//a2(2, 4)
//
//a1(3, 3)
//a2(3, 3)

//: Consider the following procedures, where A is the procedure defined above:

func f(n: Double) -> Double {
    return a2(0, n)
}

// f(10)

func g(n: Double) -> Double {
    return a2(1, n)
}
// g(10)

func h(n: Double) -> Double {
    return
     a2(2, n)
}

// h(4)

func k(n: Double) -> Double {
    return 5 * n * n
}

// k(10)

//: 🐢revisit

//: Give concise mathematical definitions for the functions computed by the procedures f, g, and h for positive integer values of n. For example, (k n) computes 5n2.

// (f n): 2n

// (g n): 2^{n}

// (h n): 2^2^...(n times)


*/
/*:
### 1.2.2  Tree Recursion
*/
/*

//: A recursive procedure for computing Fibonacci numbers:

func fibR(n: Double) -> Double {
    switch n {
    case 0: return 0
    case 1: return 1
    default: return fibR(n - 1) + fibR(n - 2)
    }
}

fibR(5)


//: Fibonacci numbers iteratively using the procedure

func fibIter(a: Double, b: Double, count: Double) -> Double {
    return count == 0 ? b : fibIter(a + b, a, count - 1)
}

func fibI(n: Double) -> Double {
    return fibIter(1, 0, n)
}

fibI(5)


*/
/*:
### Example: Counting change
*/
/*


func firstDenomination(kindsOfCoins: Double) -> Double {
    switch kindsOfCoins {
    case 1: return 1
    case 2: return 5
    case 3: return 10
    case 4: return 25
    case 5: return 50
    default: return 0
    }
}

func cc(amount: Double, kindOfCoints: Double) -> Double {
    
    if amount == 0 {
        return 1.0
    } else if amount < 0 || kindOfCoints == 0 {
        return 0
    } else {
        return cc(amount, kindOfCoints - 1) + cc(amount - firstDenomination(kindOfCoints), kindOfCoints)
    }
}

func countChange(amount: Double) -> Double {
    return cc(amount, 5)
}

countChange(11)


*/
/*:
### Exercise 1.11.  A function f is defined by the rule that f(n) = n if n<3 and f(n) = f(n - 1) + 2f(n - 2) + 3f(n - 3) if n> 3. Write a procedure that computes f by means of a recursive process. Write a procedure that computes f by means of an iterative process.
*/
/*

//: recursive

func fR(n: Double) -> Double {
    return n < 3 ? n : fR(n - 1) + (2 * fR(n - 2)) + (3 * fR(n - 3))
}

fR(5)

//: iterative

typealias Iter = (a: Double, b: Double, c: Double, count: Double) -> Double

func fI(n: Double) -> Double {
    let iter: Iter = {
        var i: Iter!
        i = { a, b, c, count in
            return count == 0 ? a : i(a: b, b: c, c: (c + (2 * b) + (3 * a)), count: (count - 1))
    }
        return i
    }()
    return iter(a: 0, b: 1, c: 2, count: n)
}

fR(5)




*/
/*:
### Exercise 1.12. Write a procedure that computes elements of Pascal's triangle by means of a recursive process.
*/
/*

//: 🐢revisit

func pascalTriangle(row: Double, col: Double) -> Double {
    if row == 0 || col == 0 {
        return 1
    } else {
        return pascalTriangle(row - 1, col) + pascalTriangle(row, col - 1)
    }
}

pascalTriangle(1, 1)





*/
/*:
### Exercise 1.13.  Prove that Fib(n) is the closest integer to n/5, where  = (1 + 5)/2. Hint: Let  = (1 - 5)/2. Use induction and the definition of the Fibonacci numbers (see section 1.2.2) to prove that Fib(n) = (n - n)/5.
*/
/*

//: 🐢revisit [a solution](http://www.kendyck.com/math/sicp/ex1-13.xml)


/*:
### 1.2.3  Orders of Growth
*/


*/
/*:
### Exercise 1.14.  Draw the tree illustrating the process generated by the count-change procedure of section 1.2.2 in making change for 11 cents. What are the orders of growth of the space and number of steps used by this process as the amount to be changed increases?
*/
/*


func firstDenomination(kindsOfCoins: Double) -> Double {
    switch kindsOfCoins {
    case 1: return 1
    case 2: return 5
    case 3: return 10
    case 4: return 25
    case 5: return 50
    default: return 0
    }
}

func cc(amount: Double, kindOfCoins: Double) -> Double {
    
    if amount == 0 {
        return 1.0
    } else if amount < 0 || kindOfCoins == 0 {
        return 0
    } else {
        return cc(amount, kindOfCoins - 1) + cc(amount - firstDenomination(kindOfCoins), kindOfCoins)
    }
}

func countChange(amount: Double) -> Double {
    return cc(amount, 5)
}

countChange(11)


cc(11, 5)
cc(11, 4) + cc(11 - 50, 5)
cc(11, 3) + cc(11 - 25, 4) + cc(-39, 5)
cc(11, 2) + cc(11 - 10, 3) + cc(-14, 4) + cc(-39, 5)
cc(11, 1) + cc(11 - 5, 2) + cc(1, 3)  + cc(-14, 4) + cc(-39, 5)
cc(11, 0) + cc(11 - 1, 1) + cc(6, 2) + cc(1, 3) + cc(-14, 4) + cc(-39, 5)
cc(11, 0) + cc(10, 1) + cc(6, 2) + cc(1, 3) + cc(-14, 4) + cc(-39, 5)
0 + cc(10, 1) + cc(6, 2) + cc(1, 3) + cc(-14, 4) + cc(-39, 5)
0 + cc(10, 0) + cc(10 - 1, 1) + cc(6, 2) + cc(1, 3) + cc(-14, 4) + cc(-39, 5)
0 + 0 + cc(9, 1) + cc(6, 2)  + cc(1, 3) + cc(-14, 4) + cc(-39, 5)
0 + 0 + cc(9, 0) + cc(9 - 1,1) + cc(6, 2) + cc(1, 3) + cc(-14, 4) + cc(-39, 5)
0 + 0 + 0 + cc(8, 1) + cc(6, 2) + cc(1, 3) + cc(-14, 4) + cc(-39, 5)
0 + 0 + 0 + cc(8, 0) + cc(8 - 1, 1) + cc(6, 2) + cc(1, 3) + cc(-14, 4) + cc(-39, 5)
0 + 0 + 0 + 0 + cc(7, 1) + cc(6, 2)  + cc(1, 3) + cc(-14, 4) + cc(-39, 5)
0 + 0 + 0 + 0 + cc(7, 0) + cc(7 - 1, 1) + cc(6, 2) + cc(1, 3) + cc(-14, 4) + cc(-39, 5)
0 + 0 + 0 + 0 + 0 + cc(6, 1) + cc(6, 2) + cc(1, 3) + cc(-14, 4) + cc(-39, 5)
0 + 0 + 0 + 0 + 0 + cc(6, 0) + cc(6 - 1, 1) + cc(6, 2) + cc(1, 3) + cc(-14, 4) + cc(-39, 5)
0 + 0 + 0 + 0 + 0 + 0 + cc(5, 1) + cc(6, 2)  + cc(1, 3) + cc(-14, 4) + cc(-39, 5)
0 + 0 + 0 + 0 + 0 + 0 + cc(5, 0) + cc(5 - 1, 1) + cc(6, 2) + cc(1, 3) + cc(-14, 4) + cc(-39, 5)
0 + 0 + 0 + 0 + 0 + 0 + 0 + cc(4, 1) + cc(6, 2) + cc(1, 3) + cc(-14, 4) + cc(-39, 5)
0 + 0 + 0 + 0 + 0 + 0 + 0 + cc(4, 0) + cc(4 - 1, 1) + cc(6, 2) + cc(1, 3) + cc(-14, 4) + cc(-39, 5)
0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + cc(3, 1) + cc(6, 2) + cc(1, 3) + cc(-14, 4) + cc(-39, 5)
0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + cc(3, 0) + cc(3 - 1, 1) + cc(6, 2) + cc(1, 3) + cc(-14, 4) + cc(-39, 5)
0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + cc(2, 1) + cc(6, 2) + cc(1, 3) + cc(-14, 4) + cc(-39, 5)
0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + cc(2, 0) + cc(2 - 1, 1) + cc(6, 2) + cc(1, 3) + cc(-14, 4) + cc(-39, 5)
0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + cc(1, 1) + cc(6, 2) + cc(1, 3) + cc(-14, 4) + cc(-39, 5)
0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + cc(1, 0) + cc(1 - 1, 1) + cc(6, 2) + cc(1, 3) + cc(-14, 4) + cc(-39, 5)
0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + cc(1 - 1, 1) + cc(6, 2) + cc(1, 3) + cc(-14, 4) + cc(-39, 5)
0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + cc(0, 1) + cc(6, 2) + cc(1, 3) + cc(-14, 4) + cc(-39, 5)
0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 1 + cc(6, 2) + cc(1, 3) + cc(-14, 4) + cc(-39, 5)
0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 1 + cc(6, 1) + cc(6, 2 - 1) + cc(1, 3) + cc(-14, 4) + cc(-39, 5)
0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 1 + cc(6, 0) + cc(6 - 1, 1) + cc(6, 1) + cc(1, 3) + cc(-14, 4) + cc(-39, 5)
0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 1 + 0 + cc(5, 1) + cc(6, 1) + cc(1, 3) + cc(-14, 4) + cc(-39, 5)
0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 1 + 0 + cc(5, 0) + cc(5 - 1, 1) + cc(6, 1) + cc(1, 3) + cc(-14, 4) + cc(-39, 5)
0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 1 + 0 + 0 + cc(4, 1) + cc(6, 1) + cc(1, 3) + cc(-14, 4) + cc(-39, 5)
0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 1 + 0 + 0 + cc(4, 0) + cc(4 - 1, 1) + cc(6, 1) + cc(1, 3) + cc(-14, 4) + cc(-39, 5)
0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 1 + 0 + 0 + 0 + cc(3, 1) + cc(6, 1) + cc(1, 3) + cc(-14, 4) + cc(-39, 5)
0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 1 + 0 + 0 + 0 + cc(3, 0) + cc(3 - 1, 1) + cc(6, 1) + cc(1, 3) + cc(-14, 4) + cc(-39, 5)
0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 1 + 0 + 0 + 0 + 0 + cc(2, 1) + cc(6, 1) + cc(1, 3) + cc(-14, 4) + cc(-39, 5)
0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 1 + 0 + 0 + 0 + 0 + cc(2, 0) + cc(2 - 1, 1) + cc(6, 1) + cc(1, 3) + cc(-14, 4) + cc(-39, 5)
0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 1 + 0 + 0 + 0 + 0 + 0 + cc(1, 1) + cc(6, 1) + cc(1, 3) + cc(-14, 4) + cc(-39, 5)
0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 1 + 0 + 0 + 0 + 0 + 0 + cc(1, 0) + cc(1 - 1, 1) + cc(6, 1) + cc(1, 3) + cc(-14, 4) + cc(-39, 5)
0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 1 + 0 + 0 + 0 + 0 + 0 + 0 + 1 + cc(6, 1) + cc(1, 3) + cc(-14, 4) + cc(-39, 5)
0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 1 + 0 + 0 + 0 + 0 + 0 + 0 + 1 + cc(6, 0) + cc(6 - 1, 1) + cc(1, 3) + cc(-14, 4) + cc(-39, 5)
0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 1 + 0 + 0 + 0 + 0 + 0 + 0 + 1 + 0 + cc(5, 1) + cc(1, 3) + cc(-14, 4) + cc(-39, 5)
0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 1 + 0 + 0 + 0 + 0 + 0 + 0 + 1 + 0 + cc(5, 0) + cc(5 - 1, 1) + cc(1, 3) + cc(-14, 4) + cc(-39, 5)
0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 1 + 0 + 0 + 0 + 0 + 0 + 0 + 1 + 0 + 0 + cc(4, 1) + cc(1, 3) + cc(-14, 4) + cc(-39, 5)
0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 1 + 0 + 0 + 0 + 0 + 0 + 0 + 1 + 0 + 0 + cc(4, 0) + cc(4 - 1, 1) + cc(1, 3) + cc(-14, 4) + cc(-39, 5)
0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 1 + 0 + 0 + 0 + 0 + 0 + 0 + 1 + 0 + 0 + 0 + cc(3, 1) + cc(1, 3) + cc(-14, 4) + cc(-39, 5)
0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 1 + 0 + 0 + 0 + 0 + 0 + 0 + 1 + 0 + 0 + 0 + cc(3, 0) + cc(3 - 1, 1) + cc(1, 3) + cc(-14, 4) + cc(-39, 5)
0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 1 + 0 + 0 + 0 + 0 + 0 + 0 + 1 + 0 + 0 + 0 + 0 + cc(2, 1) + cc(1, 3) + cc(-14, 4) + cc(-39, 5)
0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 1 + 0 + 0 + 0 + 0 + 0 + 0 + 1 + 0 + 0 + 0 + 0 + cc(2, 0) + cc(2 - 1, 1) + cc(1, 3) + cc(-14, 4) + cc(-39, 5)
0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 1 + 0 + 0 + 0 + 0 + 0 + 0 + 1 + 0 + 0 + 0 + 0 + 0 + cc(1, 1) + cc(1, 3) + cc(-14, 4) + cc(-39, 5)
0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 1 + 0 + 0 + 0 + 0 + 0 + 0 + 1 + 0 + 0 + 0 + 0 + 0 + cc(1, 0) + cc(1 - 1, 1) + cc(1, 3) + cc(-14, 4) + cc(-39, 5)
0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 0 + 1 + 0 + 0 + 0 + 0 + 0 + 0 + 1 + 0 + 0 + 0 + 0 + 0 + 0 + 1 + cc(1, 3) + cc(-14, 4) + cc(-39, 5)


//: 🐢to be completed

// O(n^2)

*/
/*:
### Exercise 1.15.  The sine of an angle (specified in radians) can be computed by making use of the approximation sin x  x if x is sufficiently small, and the trigonometric identity
*/
/*


func cube(x: Double) -> Double {
    return x * x * x
}

func p(x: Double) -> Double {
    return (3 * x) - ( 4 * (cube(x)))
}

func sine(angle: Double) -> Double {
    if !(abs(angle) > 0.1) {
        return angle
    } else {
        return p(sine(angle / 3.0))
    }
}

//: a.  How many times is the procedure p applied when (sine 12.15) is evaluated?
//: 5 times

sine(12.15)

//p(sine(4.05))
//p(p(sine(1.35)))
//p(p(p(sine(0.45))))
//p(p(p(p(sine(0.15)))))
//p(p(p(p(p(sine(0.05))))))

//: b.  What is the order of growth in space and number of steps (as a function of a) used by the process generated by the sine procedure when (sine a) is evaluated?

//: 🐢 revisit 

// O(log(x)) order of growth

*/
/*:
### 1.2.4  Exponentiation
*/
/*
//: Consider the problem of computing the exponential of a given number. We would like a procedure that takes as arguments a base b and a positive integer exponent n and computes bn. One way to do this is via the recursive definition

func exptR(b: Double, n: Double) -> Double {
    return n == 0 ? 1 : b * exptR(b, n - 1)
}

exptR(2, 8)

//: This is a linear recursive process, which requires ϴ(n) steps and ϴ(n) space. Just as with factorial, we can readily formulate an equivalent linear iteration:

func exptI(b: Double, n: Double) -> Double {
    return exptIter(b, n, 1)
}

func exptIter(b: Double, counter: Double, product: Double) -> Double {
    return counter == 0 ? product : exptIter(b, counter - 1, b * product)
}

exptI(2, 8)

//: This version requires ϴ(n) steps and ϴ(1) space.

// : We can compute exponentials in fewer steps by using successive squaring. For instance, rather than computing b^8 as we can compute it using three multiplications:

func even(x: Double) -> Bool {
    return x % 2 == 0
}

func square(x: Double) -> Double {
    return x * x
}

func fastExpt(b: Double, n: Double) -> Double {
    if n == 0 {
         return 1
    } else if even(n) {
        return square(fastExpt(b, n / 2))
    } else  {
        return b * fastExpt(b, n - 1)
    }
}

fastExpt(2, 8)
*/
/*:
### Exercise 1.16.  Design a procedure that evolves an iterative exponentiation process that uses successive squaring and uses a logarithmic number of steps, as does fast-expt. (Hint: Using the observation that (bn/2)2 = (b2)n/2, keep, along with the exponent n and the base b, an additional state variable a, and define the state transformation in such a way that the product a bn is unchanged from state to state. At the beginning of the process a is taken to be 1, and the answer is given by the value of a at the end of the process. In general, the technique of defining an invariant quantity that remains unchanged from state to state is a powerful way to think about the design of iterative algorithms.)
*/
/*
func even(x: Double) -> Bool {
    return x % 2 == 0
}

func square(x: Double) -> Double {
    return x * x
}

func fastExpt(b: Double, n: Double) -> Double {
    
    let iter: ((Double, Double, Double) -> Double) = {
        var i: ((Double, Double, Double) -> Double)!
        i = { a, b, n in
            if n == 0 {
                return a
            } else if even(n) {
                return i(a, square(b), n / 2)
            } else {
                return i(a * b, b, n - 1)
            }
        }
        return i
        }()
    
    return iter(1, b, n)
    
}


fastExpt(2, 0)
fastExpt(2, 16)

fastExpt(2, 3)
fastExpt(2,15)

*/
/*:
### Exercise 1.17 The exponentiation algorithms in this section are based on performing exponentiation by means of repeated multiplication. In a similar way, one can perform integer multiplication by means of repeated addition. The following multiplication procedure (in which it is assumed that our language can only add, not multiply) is analogous to the expt procedure:
*/
/*


func mult(a: Double, b: Double) -> Double {
    return b == 0 ? 0 : a + mult(a, b - 1)
}

 mult(2, 2)

*/
//: This algorithm takes a number of steps that is linear in b. Now suppose we include, together with addition, operations double, which doubles an integer, and halve, which divides an (even) integer by 2. Using these, design a multiplication procedure analogous to fast-expt that uses a logarithmic number of steps.
/*

func double(x: Double) -> Double {
    return x + x
}

func halve(x: Double) -> Double {
    return x / 2
}

func even(x: Double) -> Bool {
    return x % 2 == 0
}

//func mult(a: Double, b: Double) -> Double {
//    if b == 0 {
//        return 0
//    } else if even(b) {
//        return double(a * halve(b))
//    } else {
//        return a + mult(a, b - 1)
//    }
//}

func mult(a: Double, b: Double) -> Double {
    switch (a,b) {
    case (_,0):
        return 0
    case (a,b) where even(b):
        return double(a * halve(b))
    default:
        return a + mult(a, b - 1)
    }
}

mult(8, 8)
mult(8, 0)


*/
/*:
### Exercise 1.18.  Using the results of exercises 1.16 and 1.17, devise a procedure that generates an iterative process for multiplying two integers in terms of adding, doubling, and halving and uses a logarithmic number of steps.
*/
///*

func double(x: Double) -> Double {
    return x + x
}

func halve(x: Double) -> Double {
    return floor(x / 2) // floor() rounds down
}

func even(x: Double) -> Bool {
    return x % 2 == 0
}

func mult(a: Double, b: Double) -> Double {
    let iter: ((Double, Double, Double) -> Double) = {
        var i: ((Double, Double, Double) -> Double)!
        i = { accummulator, a, b in
            if b == 0 {
                return accummulator
            } else if even(b) {
                return i(accummulator, double(a), halve(b))
            } else {
                return i(accummulator + a, a, b - 1)
            }
            
        }
        return i
        }()
    
    return iter(0, a, b)
}

mult(1, 0)
mult(7, 8)

//*/
/*:
### 1.2.5  Greatest Common Divisors
*/


/*:
### 1.2.6  Example: Testing for Primality
*/


















