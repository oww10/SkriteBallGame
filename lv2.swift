/*
 Lv2 08/27 까지
 정답을 맞추기 위해 3자리수를 입력하고 힌트를 받습니다
 힌트는 야구용어인 볼과 스트라이크입니다.
 같은 자리에 같은 숫자가 있는 경우 스트라이크, 다른 자리에 숫자가 있는 경우 볼입니다
 ex) 정답 : 456 인 경우
 435를 입력한 경우 → 1스트라이크 1볼
 357를 입력한 경우 → 1스트라이크
 678를 입력한 경우 → 1볼
 123를 입력한 경우 → Nothing
 만약 올바르지 않은 입력값에 대해서는 오류 문구를 보여주세요
 3자리 숫자가 정답과 같은 경우 게임이 종료됩니다
 */
/*
 실행 예시(정답 : 456)13123213
 < 게임을 시작합니다 >
 숫자를 입력하세요
 435
 1스트라이크 1볼
 
 숫자를 입력하세요
 357
 1스트라이크
 
 숫자를 입력하세요
 123
 Nothing
 
 숫자를 입력하세요
 dfg // 세 자리 숫자가 아니어서 올바르지 않은 입력값
 올바르지 않은 입력값입니다
 
 숫자를 입력하세요
 199 // 9가 두번 사용되어 올바르지 않은 입력값
 올바르지 않은 입력값입니다
 
 숫자를 입력하세요
 103 // 0이 사용되어 올바르지 않은 입력값
 올바르지 않은 입력값입니다
 
 숫자를 입력하세요
 456
 정답입니다!
 */

protocol digitNumber{
    func arrDigitNum(randomNum: Int) -> [Int]
}

extension digitNumber{
    func arrDigitNum(randomNum: Int) -> [Int]{
        let Number1 = (Int(randomNum) % 100) % 10
        let Number2 = (Int(randomNum) % 100) / 10
        let Number3 = Int(randomNum) / 100
        let arrNumbers = [Number3,Number2,Number1]
        return arrNumbers
    }
}
class insertNumber:digitNumber{
    var inputNum: [Int] = [0]
    
    
    func inputNumberReadLine() -> [Int]{
        print("올바르지 않은 입력값입니다")
        // 옵셔널 바인딩
        guard let inputCorrect = readLine() else{
            return inputNumberReadLine()
        }
        
        //3자리숫자인지 체크
        guard Int(inputCorrect) != nil && inputCorrect.count == 3 else{
            print("올바르지 않은 입력값입니다")
            return inputNumberReadLine()
        }
        //0포함이면 오류
        if inputCorrect.contains("0"){
            print("올바르지 않은 입력값입니다")
            return inputNumberReadLine()
        }
        // set으로 중복 체크하기
        let dupNumbers = Set(inputCorrect)
        if dupNumbers.count != 3 {
            print("올바르지 않은 입력값입니다")
            return inputNumberReadLine()
        }
        
        print("입력한 숫자는 : \(String(describing: inputCorrect))")
        let number = Int(inputCorrect)!
        let digitArr = arrDigitNum(randomNum: number)
        
        return digitArr
    }
    
}

class RandomNumber:digitNumber{
    var randomNum: [Int] = [0]
    func createRandomNumber() -> [Int] {
        let randomNumber = Int.random(in: 99..<1000)
        //let randomNumber = 323
        
        print("생성된 랜덤숫자는 \(randomNumber)")
        let number = randomNumber
        let digitArr = arrDigitNum(randomNum: number)

        
        if digitArr.contains([0]){
            print("0이 들어있습니다 숫자 생성오류 숫자 재생성")
            return createRandomNumber()
        }
        
        let dupRandomNumber = Set(digitArr)
        if dupRandomNumber.count != 3{
            print("겹치는 숫자 생성오류 재생성")
            return createRandomNumber()
        }
        
        return digitArr
    }
    
}


class checkRandomNumber{
    let randomNumber = RandomNumber()
    let inputNumber = insertNumber()
    
    
    func checkRandomNumber1(){
        randomNumber.randomNum = randomNumber.createRandomNumber()
        inputNumber.inputNum = inputNumber.inputNumberReadLine()

        var strike = 0
        var ball = 0
        while true {
            for i in 0..<3{


                if randomNumber.randomNum[i] == inputNumber.inputNum[i]{
                    strike += 1
                }
                if randomNumber.randomNum.contains(inputNumber.inputNum[i]){
                    ball += 1
                    if randomNumber.randomNum[i] == inputNumber.inputNum[i]{
                        ball -= 1
                    }
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
            inputNumber.inputNum = inputNumber.inputNumberReadLine()
        }
    }
    
    class StrikeAndBallGameLv2{
        let checkNum = checkRandomNumber()
        
        func gameStart(){
            checkNum.checkRandomNumber1()
        }
        
    }
}
