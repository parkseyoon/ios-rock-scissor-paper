import Foundation

func printMenu() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
}

func getUserNumber() -> Int {
    let userNumber: Int = Int(readLine() ?? "") ?? -1
    
    return 0
}

func isValidNumber(userNumber: Int) -> Bool {
    
    return true
}

func judgeNumber(computerNumber: Int, userNumber: Int) -> Void {
    if (computerNumber == 1 && userNumber == 3) || userNumber < computerNumber {
        print("졌습니다!")
    } else if computerNumber == userNumber {
        print("비겼습니다!")
    } else {
        print("이겼습니다!")
    }
}
