# ⚾️야구게임 만들기<br />
1. 상대방이 설정한 3자리의 숫자를 맞히는 것이 목표입니다.<br />
1. 각 자리의 숫자와 위치가 모두 맞으면 '스트라이크', 숫자만 맞고 위치가 다르면 '볼'로 판정됩니다. <br />
1. 이러한 힌트를 활용하여 상대방의 숫자를 추리해 나가는 게임입니다.<br />
1. 각 레벨을 통해 게임의 기본 로직부터 사용자 인터페이스, 기록 관리 기능까지 구현합니다.
## 🚀 주요 기능, 개발 과정<br />
## 1: 기본 구조 및 정답 생성
## 주요 기능
1. 1에서 9까지의 서로 다른 임의의 수 3개를 생성하여 정답으로 설정합니다.<br />

1. BaseballGame 클래스의 기본 구조를 설정하고, 게임 시작을 위한 start 메서드를 구현합니다.<br />
## 개발 과정
1. randomNumber 클래스에서 createRandomNumber 함수를 구현하여 게임의 정답을 생성했습니다.<br />

1. Int.random(in: 99..<1000)을 사용하여 세 자리 난수를 생성하고, Set을 활용해 각 자리의 숫자가 중복되지 않는지 검사하여 중복 시 재생성하도록 구현했습니다.<br />

1. 생성된 정수를 각 자리수로 분리하여 배열(randomNum)에 저장하기 위해, DigitNumber 프로토콜과 extension을 활용하여 arrDigitNum 함수를 구현했습니다. 이는 코드의 재사용성을 높여줍니다.<br />

## 2: 게임 로직 구현 - 스트라이크와 볼 판정
## 주요 기능
1. 사용자로부터 세 자리 숫자를 입력받습니다.<br />

1. 입력된 숫자와 정답을 비교하여 '스트라이크'와 '볼' 개수를 판정하고 힌트를 제공합니다.<br />

1. 3 스트라이크인 경우 "정답입니다!" 메시지를 출력하고 현재 게임을 종료합니다.<br />

1. 입력값이 세 자리 숫자가 아니거나, 숫자가 중복된 경우 오류 메시지를 출력하고 재입력을 받습니다.<br />
## 개발 과정
1. insertNumber 클래스의 inputNumberReadLine 함수를 통해 사용자의 입력을 받고, guard 문을 사용하여 입력값이 유효한지(세 자리, 숫자, 중복 없음) 검증했습니다.<br />

1. checkRandomNumber 클래스의 checkRandomNumber1 함수 내에서 for 루프를 사용하여 사용자의 입력(inputNum)과 정답(randomNum)을 비교했습니다.<br />

1. 같은 인덱스의 숫자가 일치하면 strike를 1 증가시켰습니다.<br />

1. 인덱스는 다르지만 정답 배열에 숫자가 포함되어 있으면 ball을 1 증가시켰습니다.<br />

1. while true 루프를 사용하여 정답을 맞힐 때까지 게임을 반복하도록 구현했습니다.<br />

## 3: 정답 규칙 변경
## 주요 기능
1. 정답 생성 시 0부터 9까지의 서로 다른 세 자리 숫자를 사용하도록 규칙을 변경합니다.<br />

1. 단, 정답과 사용자의 입력 모두 첫째 자리에는 0이 올 수 없습니다.<br />
## 개발 과정
1. randomNumber 클래스의 createRandomNumber 함수에서 난수 생성 범위를 99..<1000으로 유지하되, 생성된 숫자에 0이 포함될 수 있도록 별도의 로직을 추가했습니다. (주석 처리된 코드 "randomNumber에 0이 들어있습니다" 부분에서 의도를 파악할 수 있으나, 현재 코드(digitArr[2] == 0)는 맨 뒷자리가 0인 경우만 재생성하므로 의도와 다르게 동작할 수 있습니다.)<br />

1. insertNumber 클래스의 inputNumberReadLine 함수에서 inputNum[0] == 0 조건을 추가하여 사용자가 맨 앞자리에 0을 입력하는 것을 방지했습니다.<br />

## 4: 게임 메뉴 및 흐름 제어
## 주요 기능
1. 프로그램 시작 시 "1. 게임 시작하기 2. 게임 기록 보기 3. 종료하기"와 같은 안내 문구를 표시합니다.<br />

1. 사용자가 '1'을 입력하면 숫자 야구 게임이 시작됩니다.<br />

1. 게임이 종료되면(정답을 맞히면) 다시 초기 메뉴 화면을 보여줍니다.<br />
## 개발 과정
1. StrikeAndBallGameLv6 클래스의 gameStart 함수에 while true 루프를 사용하여 프로그램이 계속 실행되도록 했습니다.<br />

1. readLine()으로 사용자 입력을 받고 switch 문을 사용하여 입력값에 따라 분기 처리를 했습니다.<br />

1. case "1"에서 checkNum.checkRandomNumber1()를 호출하여 게임을 시작하도록 구현했습니다. 게임이 끝나면 while 루프의 처음으로 돌아가 메뉴가 다시 출력됩니다.<br />

## 5: 게임 기록 보기 기능
## 주요 기능
1. 사용자가 메뉴에서 '2'를 입력하면, 이전 게임들의 시도 횟수를 보여줍니다.<br />

1. 게임이 끝날 때마다 해당 게임의 총 시도 횟수를 저장합니다.<br />
## 개발 과정
1. checkRandomNumber 클래스에 시도 횟수를 저장할 gameResult: [Int] 배열과 게임 횟수를 추적할 gameCount 변수를 추가했습니다.<br />

1. checkRandomNumber1 함수 내에서 게임이 시작될 때 gameCount를 1 증가시키고, 정답을 맞혔을 때 numCount(시도 횟수)를 gameResult 배열에 추가했습니다.<br />

1. gameRecord 함수를 구현하여 gameResult 배열에 저장된 기록을 for 루프를 통해 순서대로 출력하도록 했습니다.<br />

1. gameStart 함수의 switch 문에서 case "2"일 때 checkNum.gameRecord()를 호출하도록 연결했습니다.<br />

## 6: 게임 종료 및 예외 처리
## 주요 기능
1. 사용자가 메뉴에서 '3'을 입력하면 프로그램을 완전히 종료합니다.<br />

1. 프로그램 종료 시 "숫자 야구 게임을 종료합니다" 메시지를 출력하고, 모든 게임 기록을 초기화합니다.<br />

1. 메뉴에서 '1', '2', '3' 이외의 값을 입력하면 오류 메시지를 출력합니다.<br />
## 개발 과정
1. closeGame 함수를 구현하여 종료 메시지를 출력하고, gameCount = 0, numCount = 0을 통해 기록 관련 변수를 초기화했습니다. (배열 gameResult도 gameResult.removeAll()로 초기화하는 것이 더 명확합니다.)<br />

1. gameStart 함수의 switch 문 case "3"에서 checkNum.closeGame() 호출 후 exit(0)를 사용하여 프로그램을 정상 종료시켰습니다.<br />

1. switch 문의 default 케이스를 사용하여 '1', '2', '3' 이외의 입력에 대해 "올바른 숫자를 입력하세요"라는 오류 메시지를 출력하도록 처리했습니다.<br />

## 💻 IDEs/Editors<br />
![Xcode](https://img.shields.io/badge/Xcode-007ACC?style=for-the-badge&logo=Xcode&logoColor=white)<br />
## 📋 Languages<br />
![Swift](https://img.shields.io/badge/swift-F54A2A?style=for-the-badge&logo=swift&logoColor=white)<br />
## 🕓 Version Control<br />
![Git](https://img.shields.io/badge/git-%23F05033.svg?style=for-the-badge&logo=git&logoColor=white)![GitHub](https://img.shields.io/badge/github-%23121011.svg?style=for-the-badge&logo=github&logoColor=white)<br />
## 🎛️ Operating System<br />
![macOS](https://img.shields.io/badge/mac%20os-000000?style=for-the-badge&logo=macos&logoColor=F0F0F0)![iOS](https://img.shields.io/badge/iOS-000000?style=for-the-badge&logo=ios&logoColor=white)<br />
