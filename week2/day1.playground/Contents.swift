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
