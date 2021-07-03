import UIKit


//MARK: Girilen bir sayının asal olup olmadığını bulan bir extension yazınız

extension Int {
    func isPrime() -> Bool {
        // start with 2 which is smallest prime number
        for i in 2...self/2 {
            // check if it divides itself
            if(self % i == 0){
                return false
            }
        }
        return true
    }
}

print(7.isPrime())


// MARK: İki parametreli ve FARKLI tipli bir generic örneği yapınız... (T, U) ???

func findIndex(ofString valueToFind: String, in array: [String]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}

let strings = ["cat", "dog", "llama", "parakeet", "terrapin"]
if let foundIndex = findIndex(ofString: "llama", in: strings) {
    print("The index of llama is \(foundIndex)")
}


/*
 Project Euler 6
 
 Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the
 sum.
 
 */

var sum = 0
var squared = 0
var result = 0
let num = 10
 
sum = num * (num + 1) / 2
squared = (num * (num + 1) * (2 * num + 1)) / 6

result = sum * sum - squared

print(result)

/*
 Project Euler 7
 
 By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

 What is the 10 001st prime number?
 */

var numPrimes = 1;
var numm = 1;
 
while (numPrimes < 10001) {
    numm = numm + 2
    if (num.isPrime()) {
        numPrimes += 1
    }
}


/*
 Swift gives us an alternative to if let called guard let, which also unwraps optionals if they contain a value,
 but works slightly differently: guard let is designed to exit the current function, loop, or condition if the
 check fails, so any values you unwrap using it will stay around after the check.
 */
