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
