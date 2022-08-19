import Foundation

class Card {
    let scissor = 1
    let rock = 2
    let paper = 3
}

let card = Card()
let cardNumbersRange = card.scissor...card.paper
let player: [String: String] = ["computer": "컴퓨터", "user": "사용자"]

func startGame() {
    printMenu()
    let computerNumber: Int = makeComputerNumber()
    let userNumber: Int = getUserNumber()
    if isValidNumber(userNumber: userNumber) == false {
        return
    }
    judgeNumber(computerNumber: computerNumber, userNumber: userNumber)
}

func printMenu() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
}

func makeComputerNumber() -> Int {
    let computerNumber: Int = Int.random(in: cardNumbersRange)
    return computerNumber
}

func getUserNumber() -> Int {
    guard let input = readLine(), let userNumber = Int(input) else {
        return -1
    }
    
    return userNumber
}

func isValidNumber(userNumber: Int) -> Bool {
    var isValidBool: Bool = true
    switch userNumber {
    case 0:
        isValidBool = false
    case cardNumbersRange:
        break
    default:
        invalidInputHandling()
        isValidBool = false
    }
    
    return isValidBool
}

func invalidInputHandling() {
    print("잘못된 입력입니다. 다시 시도해주세요.\n")
    startGame()
}

func judgeNumber(computerNumber: Int, userNumber: Int) -> Void {
    let computerAndUserNumber: [Int: Int] = [computerNumber: userNumber]
    
    switch computerAndUserNumber {
    case [card.scissor: card.rock], [card.rock: card.paper], [card.paper: card.scissor]:
        print("이겼습니다!\n")
    case [card.scissor: card.paper], [card.rock: card.scissor], [card.paper: card.rock]:
        print("졌습니다!\n")
    default:
        print("비겼습니다!\n")
        startGame()
    }
}

startGame()
