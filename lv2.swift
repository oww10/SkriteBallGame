protocol DigitNumber{
    func arrDigitNum(randomNum: Int) -> [Int]
}

extension DigitNumber{
    func arrDigitNum(randomNum: Int) -> [Int]{

        // compactMap으로 각 요소에 대해 주어진 변환을 호출한 결과가 아닌 값을 포함하는 배열을 반환
        // wholeNumberValue : 이 문자가 정수를 나타낼 경우, 이 문자가 나타내는 숫자 값입니다.
        return String(randomNum).compactMap { $0.wholeNumberValue }
    }
}
class insertNumber:DigitNumber{
    var inputNum: [Int] = [0]
    
    
    func inputNumberReadLine() {
        print("숫자를 입력하세요")
        // 옵셔널 바인딩
        guard let inputCorrect = readLine() else{
            return inputNumberReadLine()
        }
        
        //3자리숫자인지 체크
        guard Int(inputCorrect) != nil && inputCorrect.count == 3 else{
            print("올바르지 않은 입력값입니다2")
            return inputNumberReadLine()
        }
        //0포함이면 오류
        if inputCorrect.contains("0"){
            print("올바르지 않은 입력값입니다3")
            return inputNumberReadLine()
        }
        // set으로 중복 체크하기
        let dupNumbers = Set(inputCorrect)
        if dupNumbers.count != 3 {
            print("올바르지 않은 입력값입니다4")
            return inputNumberReadLine()
        }
        
        print("입력한 숫자는 : \(String(describing: inputCorrect))")
        guard let number = Int(inputCorrect) else{
            return inputNumberReadLine()
        }
        
        
        inputNum = arrDigitNum(randomNum: number)
    }
    
}

class RandomNumber:DigitNumber{
    var randomNum: [Int] = [0]
    func createRandomNumber() {
        let randomNumber = Int.random(in: 99..<1000)
        //let randomNumber = 323
        
        print("생성된 랜덤숫자는 \(randomNumber)")
        let number = randomNumber
        let digitArr = arrDigitNum(randomNum: number)

        
        if digitArr.contains(0){
            print("0이 들어있습니다 숫자 생성오류 숫자 재생성")
            return createRandomNumber()
        }
        
        let dupRandomNumber = Set(digitArr)
        if dupRandomNumber.count != 3{
            print("겹치는 숫자 생성오류 재생성")
            return createRandomNumber()
        }
        
        randomNum = digitArr
    }
    
}


class checkRandomNumber{
    let randomNumber = RandomNumber()
    let inputNumber = insertNumber()
    
    
    func checkRandomNumber1(){
        randomNumber.createRandomNumber()
        inputNumber.inputNumberReadLine()

        var strike = 0
        var ball = 0
        while true {
            for i in 0..<3{
                
                if randomNumber.randomNum[i] == inputNumber.inputNum[i] {
                    strike += 1
                } else if randomNumber.randomNum.contains(inputNumber.inputNum[i]) {
                    ball += 1
                }
            }
            if strike == 0 && ball == 0{
                print("Nothing")
            }

            if strike == 3{
                print("정답입니다!")
                break
            }
            
            print("strike: \(strike),ball: \(ball)")
            
            strike = 0
            ball = 0
            inputNumber.inputNumberReadLine()
        }
    }
}

class StrikeAndBallGameLv2{
    let checkNum = checkRandomNumber()
    
    func gameStart(){
        checkNum.checkRandomNumber1()
    }
    
}
