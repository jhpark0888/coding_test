var input = Int(readLine() ?? "") 

if let cardCnt = input { 
    let cardList = (readLine() ?? "").split(separator: " ")
    var cardMap: [String.SubSequence: Bool] = [:]

    for card  in cardList {
        cardMap[card] = true
    }

    if (cardCnt == cardList.count) {
        let intCnt = Int(readLine() ?? "")
        let result = (readLine() ?? "").split(separator: " ")
        
        if intCnt == result.count {
            for r in result {
                print(cardMap[r] == true ? 1 : 0, terminator: " ")    
            }
        } else {
            print("Invallid Input")
        }
    } else {
        print("Invallid Input")
    }
} else {
    print("Invallid Input")
    
}