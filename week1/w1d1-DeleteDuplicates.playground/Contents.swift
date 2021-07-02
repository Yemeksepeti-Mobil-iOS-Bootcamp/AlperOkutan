import UIKit

//Soru1
var input = "aaba kouq bux"
var output = input
var cnt = 0

func removeLetter(inputString: String, count: Int) -> String {
    for char1 in inputString{
        cnt = 0
        for char2 in inputString{
            if char1 == char2{
                cnt += 1
            }
        }
        if cnt >= count && char1 != " "{
            output = output.replacingOccurrences(of: String(char1), with: "")
        }
    }
    return output
}
print(removeLetter(inputString: input, count: 2))
    
    
//Soru2
let inpt = "merhaba nasılsınız . iyiyim siz nasılsınız . bende iyiyim."
let words = inpt.components(separatedBy: .whitespaces)
var wordValues = [String:Int]()

for word in words{
    if wordValues[word] == nil {
        wordValues[word] = 1
    }else {
        wordValues[word]! += 1
    }
 }
print(wordValues)
