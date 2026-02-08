function solution(n, bans) {
    const BASE_CHAR_CODE = "a".charCodeAt();
    const bannedIndices = [];
    let targetIndex = n;

    for (const ban of bans) {
        let banIndex = 0;
        let power = 1;
        
        for (let i = ban.length - 1; i >= 0; i--) {
            const charValue = ban.charCodeAt(i) - BASE_CHAR_CODE + 1;
            banIndex += power * charValue;
            power *= 26;
        }
        bannedIndices.push(banIndex);
    }
    
    bannedIndices.sort((a, b) => a - b);
    
    for (const banIndex of bannedIndices) {
        if (targetIndex >= banIndex) {
            targetIndex += 1;            
        } else {
            break;
        }
    }
    
    let answer = "";
    while (targetIndex > 0) {
        let remainder = targetIndex % 26;
        if (remainder === 0) {
            remainder = 26;
            targetIndex -= 26;
        } 
        targetIndex = Math.floor(targetIndex / 26);
        
        answer = String.fromCharCode(remainder + BASE_CHAR_CODE - 1) + answer;
    }
    
    return answer;
}

// 기댓값 "ah"
console.log(solution(30, ["d", "e", "bb", "aa", "ae"]));
// 봉인된 주문 (Lv3)