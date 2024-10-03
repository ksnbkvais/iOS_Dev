import Foundation

func gradeCalculator(students: [String: Int]) {
    var total = 0
    for score in students.values {
        total += score
    }
    let avg = Double(total) / Double(students.count)
    
    let max = students.values.max() ?? 0
    let min = students.values.min() ?? 0

    print("Avg: \(avg)")
    print("Max: \(max)")
    print("Min: \(min)")
    
   
    for (student, score) in students {
        var status = ""
        if score >= Int(avg){
            status = "above"
        }
        else {status = "below"}
        print("\(student): \(score) (\(status) average)")
    }
}

let studentsScores = [
    "Ice": 85,
    "Bii": 78,
    "Key": 92,
    "XOXO": 66,
    "Love": 90,
    "U": 75
]

gradeCalculator(students: studentsScores)
