function solution(users, emoticons) {
    var answer = [0, 0];
    const ratios = [10, 20, 30, 40];
    const emotionDiscounts = [];
    
    const calculate = () => {
        let emojiPlusCount = 0;
        let salesAmount = 0;
        
        for (const [buyEmojiOverRatio, buyEmojiPlus] of users) {
            let priceSum = 0;    
            for (let i = 0; i < emoticons.length; i++) {
                const discount = emotionDiscounts[i];
                if (discount < buyEmojiOverRatio) continue;
                priceSum += emoticons[i] * ((100 - discount) / 100);
                
                if (priceSum >= buyEmojiPlus) break;
            }
            
            if (priceSum >= buyEmojiPlus) emojiPlusCount++
            else salesAmount += priceSum;
        }
        
        return [emojiPlusCount, salesAmount];
    }
    
    const dfs = (depth) => {
        if (depth === emoticons.length) {
            const [emojiPlusCount, salesAmount] = calculate();
            if (answer[0] > emojiPlusCount) return;
            if (answer[0] === emojiPlusCount && answer[1] >= salesAmount) return;
        
            answer[0] = emojiPlusCount;
            answer[1] = salesAmount;
            return;
        }
        
        for (const ratio of ratios) {
            emotionDiscounts.push(ratio);
            dfs(depth + 1);
            emotionDiscounts.pop();
        }
    }
    
    dfs(0);
    
    return answer;
}

// 이모티콘 할인행사 (Lv2)