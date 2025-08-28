////exit 때문에 추가
//import Foundation
//
//// class insertNumber, randomNumber에 적용
//protocol DigitNumber{
//    func arrDigitNum(randomNum: Int) -> [Int]
//}
//
//// DigitNumber 프로토콜에 함수 추가(전달받은 정수형을 배열로 바꾸며 compactMap을 통해 각 자리수로 분리
//extension DigitNumber{
//    func arrDigitNum(randomNum: Int) -> [Int]{
//
//        // compactMap으로 각 요소에 대해 주어진 변환을 호출한 결과가 아닌 값을 포함하는 배열을 반환
//        // wholeNumberValue : 이 문자가 정수를 나타낼 경우, 이 문자가 나타내는 숫자 값입니다.
//        return String(randomNum).compactMap { $0.wholeNumberValue }
//    }
//}
//
////유저가 입력하여 값을 받는 클래스
//class insertNumber:DigitNumber{
//    var inputNum: [Int] = [0]
//    
//    
//    func inputNumberReadLine() {
//        print("숫자를 입력하세요")
//        // 옵셔널 바인딩
//        guard let inputCorrect = readLine() else{
//            return inputNumberReadLine()
//        }
//        
//        //3자리숫자인지 체크
//        guard Int(inputCorrect) != nil && inputCorrect.count == 3 else{
//            print("올바르지 않은 입력값입니다2")
//            return inputNumberReadLine()
//        }
//
//        
//        // set으로 중복 체크하기
//        let dupNumbers = Set(inputCorrect)
//        if dupNumbers.count != 3 {
//            print("올바르지 않은 입력값입니다4")
//            return inputNumberReadLine()
//        }
//        
//        print("입력한 숫자는 : \(String(describing: inputCorrect))")
//        guard let number = Int(inputCorrect) else{
//            return inputNumberReadLine()
//        }
//        
//        
//        inputNum = arrDigitNum(randomNum: number)
// 
//        // **맨 앞자리에 0이 아닌 2,3자리는 0이 가능하게 입력**
//        //0포함이면 오류
//        if inputNum[0] == 0 {
//            print("올바르지 않은 입력값입니다3")
//            return inputNumberReadLine()
//        }
//    }
//    
//}
//
////컴퓨터가 임의로 숫자를 정해주는 클래스
//class randomNumber:DigitNumber{
//    var randomNum: [Int] = [0]
//    func createRandomNumber() {
//        let randomNumber = Int.random(in: 99..<1000)
//        
//        print("생성된 랜덤숫자는 \(randomNumber)")
//        let number = randomNumber
//        let digitArr = arrDigitNum(randomNum: number)
//        
//        // **맨 앞자리에 0이 아닌 2,3자리는 0이 가능하게 입력**
//        if digitArr[2] == 0 {
//            //print("randomNumber에 0이 들어있습니다 숫자 생성오류 숫자 재생성")
//            return createRandomNumber()
//        }
//        
//        // 만약 중복된 숫자가 들어있다면 재생성
//        let dupRandomNumber = Set(digitArr)
//        if dupRandomNumber.count != 3{
//            //print("randomNumber에 겹치는 숫자 생성오류 재생성")
//            return createRandomNumber()
//        }
//        
//        randomNum = digitArr
//    }
//    
//}
//
////게임의 로직 입력받은 값과 컴퓨터가 정해준 값을 각 배열의 할당된 번호마다 비교하고 같은 배열의 번호는 strike 를 + 1하고 같은 번호는 아니어도 배열에 들어있다면 ball에 +1함
//class checkRandomNumber{
//    
//    let randomNumber1 = randomNumber()
//    let inputNumber = insertNumber()
//    
//    
//    var strike = 0
//    var ball = 0
//    //시도 횟수 숫자
//    var numCount = 0
//    //게임 횟수 숫자
//    var gameCount = 0
//    
//    //시도 횟수와 게임 횟수를 저장
//    var gameResult: [Int] = []
//    
//    //1. 게임 시작하기
//    func checkRandomNumber1(){
//        
//        numCount = 0
//        
//        //checkRandomNumber1 호출할때 게임 횟수 증가
//        gameCount += 1
//        
//        
//        
//        randomNumber1.createRandomNumber()
//        
//
//        while true {
//            inputNumber.inputNumberReadLine()
//            numCount += 1
//            
//            
//            strike = 0
//            ball = 0
//            
//            for i in 0..<3{
//                
//                if randomNumber1.randomNum[i] == inputNumber.inputNum[i] {
//                    strike += 1
//                } else if randomNumber1.randomNum.contains(inputNumber.inputNum[i]) {
//                    ball += 1
//                }
//            }
//            if strike == 0 && ball == 0{
//                print("Nothing")
//            }
//
//            if strike == 3{
//                print("정답입니다!")
//                gameResult.append(numCount)
//               
//                break
//            }
//            
//            print("strike: \(strike),ball: \(ball)")
//            
//
//            
//        }
//    }
//    //2. 게임 기록 보기
//    func gameRecord(){
//        print("< 게임 기록 보기 >")
//        
//        //gameCount번째 게임 : 시도 횟수 - numCount
//        for i in 0..<gameCount{
//            if gameCount == 0{
//                print("아직 게임 데이터가 없습니다.")
//            } else{
//                print("\(i + 1)번째 게임 : 시도 횟수 - \(gameResult[i])")
//                
//            }
//        }
//    }
//    //3. 종료하기
//    func closeGame(){
//        print("< 숫자 야구 게임을 종료합니다 >")
//        // 이전의 게임 기록들도 초기화됩니다
//        gameCount = 0
//        numCount = 0
//
//    }
//}
//
//
//
//// 게임을 시작하는 클래스
//class StrikeAndBallGameLv5{
//    let checkNum = checkRandomNumber()
//    
//    //switch case 1,2,3
//    func gameStart(){
//        
//        while true{
//            print("환영합니다! 원하시는 번호를 입력해주세요\n1. 게임 시작하기 2. 게임 기록 보기 3. 종료하기")
//            let gameSelect = readLine()
//            //checkNum.checkRandomNumber1()
//            switch gameSelect{
//            case "1":
//                checkNum.checkRandomNumber1()
//            case "2":
//                checkNum.gameRecord()
//            case "3":
//                checkNum.closeGame()
//                exit(0) // 프로그램을 정상적으로 종료시킴
//            default:
//                print("올바른 숫자를 입력하세요")
//            }
//        }
//
//    }
//    
//}
