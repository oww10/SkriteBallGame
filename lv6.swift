//exit 때문에 추가
import Foundation

//유저가 입력하여 값을 받는 클래스
class insertNumber{
    var inputNum: [Int] = [0]
    
    
    func inputNumberReadLine() {
        print("\n숫자를 입력하세요")
        // 옵셔널 바인딩
        guard let inputCorrect = readLine() else{
            return inputNumberReadLine()
        }
        
        //3자리숫자인지 체크
        guard Int(inputCorrect) != nil && inputCorrect.count == 3 else{
            print("올바르지 않은 입력값입니다2")
            return inputNumberReadLine()
        }

        
        // set으로 중복 체크하기
        let dupNumbers = Set(inputCorrect)
        if dupNumbers.count != 3 {
            print("올바르지 않은 입력값입니다4")
            return inputNumberReadLine()
        }
        
        print("\n입력한 숫자는 : [\(String(describing: inputCorrect))] 입니다.")
        guard let number = Int(inputCorrect) else{
            return inputNumberReadLine()
        }
        
        
        inputNum = String(number).compactMap { $0.wholeNumberValue }
 
        // **맨 앞자리에 0이 아닌 2,3자리는 0이 가능하게 입력**
        //0포함이면 오류
        if inputNum[0] == 0 {
            print("올바르지 않은 입력값입니다3")
            return inputNumberReadLine()
        }
    }
    
}

//컴퓨터가 임의로 숫자를 정해주는 클래스
class randomNumber{
    var randomNum: [Int] = [0]
    func createRandomNumber() {

        // shuffle로 0~9 숫자를 섞고 prefix(3)으로 3자리수 출력
        var numbers1 = [0,1,2,3,4,5,6,7,8,9]
        numbers1.shuffle()
        let randomNumber1 = Array(numbers1.prefix(3))
        
        // **맨 앞자리에 0이 아닌 2,3자리는 0이 가능하게 입력**
        if randomNumber1[2] == 0 {
            //print("randomNumber에 0이 들어있습니다 숫자 생성오류 숫자 재생성")
            return createRandomNumber()
        }
        
        // 만약 중복된 숫자가 들어있다면 재생성
        let dupRandomNumber = Set(randomNumber1)
        if dupRandomNumber.count != 3{
            //print("randomNumber에 겹치는 숫자 생성오류 재생성")
            return createRandomNumber()
        }
        
        randomNum = randomNumber1
    }
    
}

//게임의 로직 입력받은 값과 컴퓨터가 정해준 값을 각 배열의 할당된 번호마다 비교하고 같은 배열의 번호는 strike 를 + 1하고 같은 번호는 아니어도 배열에 들어있다면 ball에 +1함
class checkRandomNumber{
    
    let randomNumber1 = randomNumber()
    let inputNumber = insertNumber()
    
    
    var strike = 0
    var ball = 0
    //시도 횟수 숫자
    var numCount = 0
    //게임 횟수 숫자
    var gameCount = 0
    
    //시도 횟수와 게임 횟수를 저장
    var gameResult: [Int] = []
    
    //1. 게임 시작하기
    func checkRandomNumber1(){
        
        numCount = 0
        
        //checkRandomNumber1 호출할때 게임 횟수 증가
        gameCount += 1
        
        
        
        randomNumber1.createRandomNumber()
        

        while true {
            inputNumber.inputNumberReadLine()
            numCount += 1
            
            
            strike = 0
            ball = 0
            
            for i in 0..<3{
                
                if randomNumber1.randomNum[i] == inputNumber.inputNum[i] {
                    strike += 1
                } else if randomNumber1.randomNum.contains(inputNumber.inputNum[i]) {
                    ball += 1
                }
            }
            if strike == 0 && ball == 0{
                print("Nothing")
            }

            if strike == 3{
                print("\n정답입니다!\n")
                gameResult.append(numCount)
               
                break
            }
            
            print("\nstrike: \(strike),ball: \(ball)!!")
            

            
        }
    }
    //2. 게임 기록 보기
    func gameRecord(){
        print("\n< 게임 기록 보기 >\n")
        
        //gameCount번째 게임 : 시도 횟수 - numCount
        for i in 0..<gameCount{
            if gameCount == 0{
                print("아직 게임 데이터가 없습니다.\n")
            } else{
                print("\(i + 1)번째 게임 : 시도 횟수 - \(gameResult[i])")
                
            }
        }
    }
    //3. 종료하기
    func closeGame(){
        print("\n< 숫자 야구 게임을 종료합니다 >\n")
        // 이전의 게임 기록들도 초기화됩니다
        gameCount = 0
        numCount = 0

    }
}



// 게임을 시작하는 클래스
class StrikeAndBallGameLv6{
    let checkNum = checkRandomNumber()
 
    func gameStart(){
        
        ///while문으로 exit(0)전까지 무한반복
        ///readLine으로 switch - case 입력값에 따라 처리
        while true{
            print("===============================\n환영합니다! 원하시는 번호를 입력해주세요\n\n1. 게임 시작하기 2. 게임 기록 보기 3. 종료하기")
            
            let gameSelect = readLine()
            //checkNum.checkRandomNumber1()
            switch gameSelect{
            case "1":
                checkNum.checkRandomNumber1()
            case "2":
                checkNum.gameRecord()
            case "3":
                checkNum.closeGame()
                exit(0) // 프로그램을 정상적으로 종료시킴
            default:
                print("올바른 숫자를 입력하세요")
            }
        }

    }
    
}
