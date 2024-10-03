
import Foundation

func wordfrek (_ sentence: String) -> [String : Int] {
    
    let newSentence = sentence.lowercased().components(separatedBy: CharacterSet.punctuationCharacters).joined()
    let words = newSentence.split(separator: " ")
    var wordFrequincy : [String : Int] = [:]
    
    for word in words {
        let wordF = String(word)
        wordFrequincy[wordF, default: 0] += 1
    }
    return wordFrequincy
}

let primer = "This is example for print. She is in love with someone who is really good example of red flag"
let frq = wordfrek(primer)

for (word, count) in frq {
    print("'\(word)' : \(count)")
}
