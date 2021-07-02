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

