//import Foundation
//

class Game{
    var count: Int
    
    init(count: Int) {
        self.count = count
    }
    
    func makeNumber() -> [Int] { //создание числа для игры
        var mainDig = Set<Int>()
        var result: [Int] = []
        while mainDig.count < 4 { //заполняем сет пока его длина не будет 4
            mainDig.insert(Int.random(in: 0..<10))
        }
        for i in mainDig {
            result.append(i)
        }
        print(result)
        return result
    }
    
    func  comparisonNumber(_ userDigg: [Int],_ computerNumber: [Int]) -> (Int, Int) {
        var bull = 0
        var cow = 0
        for (i, _) in userDigg.enumerated() {
            for (j, _) in computerNumber.enumerated() {
                if userDigg[i] == computerNumber[j] && i == j {
                    bull += 1
                }
                else if userDigg[i] == computerNumber[j] && i != j {
                    cow += 1
                }
            }
        }
        return (bull,cow)
    }
    
    func makeResult() {
        
    }
    
    func uniqueNumber(_ userNumber: [Int]) -> Bool {
        var tempSet = Set<Int>()
        for userValue in userNumber {
            tempSet.insert(userValue)
        }
        if tempSet.count == 4 {
            return true
        } else {
            return false
        }
    }
}

