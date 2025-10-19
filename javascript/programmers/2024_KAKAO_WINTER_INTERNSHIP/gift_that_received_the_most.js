function solution(friends, gifts) {
    const counts = new Map();
    const sent = new Map();
    const received = new Map();
    
    for (const friend of friends) {
        sent.set(friend, []);
        received.set(friend, []);
        counts.set(friend, 0);
    }
    
    for (const history of gifts) {
        const [sender, receiver] = history.split(" ");
        sent.get(sender).push(receiver);
        received.get(receiver).push(sender);
    }
    
    for (let i = 0; i < friends.length; i++) {
        for(let j = i+1; j < friends.length; j++) {
            const a = friends[i];
            const b = friends[j];
            
            const aSentCount = sent.get(a).filter((v) => v === b).length;
            const bSentCount = sent.get(b).filter((v) => v === a).length;
            
            if (aSentCount > bSentCount) {
                counts.set(a, counts.get(a) + 1);
                continue;
            }
            
            if (bSentCount > aSentCount) {
                counts.set(b, counts.get(b) + 1);
                continue;
            }
            
            const giftPointA = sent.get(a).length - received.get(a).length;
            const giftPointB = sent.get(b).length - received.get(b).length;
            
            if (giftPointA > giftPointB) {
                counts.set(a, counts.get(a) + 1);
                continue;
            }
            
            if (giftPointB > giftPointA) {
                counts.set(b, counts.get(b) + 1);
                continue;
            }
        }
    }
    
    let maxCount = 0;
    for (const [k, v] of counts.entries()) maxCount = Math.max(maxCount, v);
    
    return  maxCount;
}

console.log(solution(["muzi", "ryan", "frodo", "neo"], ["muzi frodo", "muzi frodo", "ryan muzi", "ryan muzi", "ryan muzi", "frodo muzi", "frodo ryan", "neo muzi"]));

// 가장 많이 받은 선물 (Lv1)