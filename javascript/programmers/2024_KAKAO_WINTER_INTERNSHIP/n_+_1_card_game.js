function solution(coin, cards) {
    const target = cards.length + 1;
    const initLength = cards.length / 3;
    const hasCards = new Set(cards.slice(0, initLength));
    const candidate = new Set();
    let availableCardSetCount = 0;
    let preliminaryCardSetCount = 0;
    let coinCount = coin;
    let answer = 1;
    
    for (let i = 0; i < initLength; i++) {
        for (let j = i + 1; j < initLength; j++) {
            const card1 = cards[i];
            const card2 = cards[j];
            if (card1 + card2 === target) {
                hasCards.delete(card1);
                hasCards.delete(card2);
                availableCardSetCount++;
                break;
            } 
        } 
    }
    
    for (let i = initLength; i < cards.length; i += 2) {        
        const card1 = cards[i];
        const card2 = cards[i + 1];
        const needCard1 = target - card1;
        const needCard2 = target - card2;
        
        if (hasCards.has(needCard1) && coinCount >= 1) {
            hasCards.delete(needCard1);
            coinCount--;
            availableCardSetCount++;
        } else if (candidate.has(needCard1) && coinCount >= 2) {
            candidate.delete(needCard1);
            preliminaryCardSetCount++;
        } else {
            candidate.add(card1);
        }
        
        if (hasCards.has(needCard2) && coinCount >= 1) {
            hasCards.delete(needCard2);
            coinCount--;
            availableCardSetCount++;
        } else if (candidate.has(needCard2) && coinCount >= 2) {
            candidate.delete(needCard2);
            preliminaryCardSetCount++;
        } else {
            candidate.add(card2);
        }
        
        if (availableCardSetCount <= 0) {
            if (preliminaryCardSetCount === 0) break;
            if (coinCount < 2) break;
            preliminaryCardSetCount--;
            availableCardSetCount++;
            coinCount -= 2;
        };
        if (coinCount === 0) break;
        
        answer++;
        availableCardSetCount--;
    }
    
    answer += availableCardSetCount;
        
    return answer;
}

console.log(solution(4, [3, 6, 7, 2, 1, 10, 5, 9, 8, 12, 11, 4]));

// n + 1 카드게임 (Lv3)