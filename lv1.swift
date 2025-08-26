
//1. Lv1 `08/26 까지`
//    - [ ]  1에서 9까지의 서로 다른 임의의 수 3개를 정하고 맞추는 게임입니다
//    - [ ]  정답은 랜덤으로 만듭니다.(1에서 9까지의 서로 다른 임의의 수 3자리)

class StrikeAndBallGame{
    func inputCorrectNumber(){
        //내 정답 입력하기
        let inputCorrect = readLine() ?? "0"
        print("내가 입력한 3자리수는 \(Int(inputCorrect) ?? 0)")
    }
    
    func thisGameRandomNumber(){
        let randomNumber = Int.random(in: 99..<1000)
            print("정답은 :\(randomNumber) 입니다.")
    }
}




