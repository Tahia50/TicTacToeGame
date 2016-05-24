struct Constants {
    struct PlayerInfo {
        static let firstPlayerName = "Panda"
        static let secondPlayerName = "Jerry"
        static let playerOne: Int = 1
        static let playerTwo: Int = 2
        static let playerOneTitle = "Player 1"
        static let playerTwoTitle = "Player 2"
        static let playerOneImageName = "po.jpg"
        static let playerTwoimageName = "jerry.jpg"
    }
    struct State {
        static let draw = "It's a Draw !!"
    }
    struct gameInfo {
        static let totalGridNumber: Int = 9
        static let defaultImageName = "default.jpeg"
        static let backGroundImageName = "background.jpg"
    }
    static func showTurn(name: String) -> String {
        return "It's \(name)'s turn"
    }
    static func showWin(name: String) -> String {
        return "\(name)'s Wins !!"
    }
}

