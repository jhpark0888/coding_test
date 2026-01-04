function solution(temperature, t1, t2, a, b, onboard) {
    const lowerLimitT1 = t1 + 10;
    const upperLimitT2 = t2 + 10;
    let outdoorTemp = temperature + 10;
    const dp = Array.from({ length: onboard.length }, () => Array.from({ length: 51 }, () => Infinity));
    dp[0][outdoorTemp] = 0;
    
    const check = (i, temp) => {
        if (!onboard[i]) return true;
        return lowerLimitT1 <= temp && temp <= upperLimitT2;
    }
    
    for (let i = 0; i < onboard.length - 1; i++) {
        for (let j = 0; j < 51; j++) {
            if (dp[i][j] === Infinity) continue;
            
            // 에어컨 안 킨 경우
            let temp = j;
            if (j < outdoorTemp) {
                temp += 1;
            } else if (j > outdoorTemp) {
                temp -= 1;
            }
            
            if (check(i + 1, temp)) {
                dp[i + 1][temp] = Math.min(dp[i][j], dp[i + 1][temp]); 
            }
            
            // 에어컨 킨 경우
            for (const [temp, cost] of [[j + 1, a], [j - 1, a], [j, b]]) {
                if (!check(i + 1, temp)) continue;
                if (temp < 0 || temp > 50) continue;
                dp[i + 1][temp] = Math.min(dp[i][j] + cost, dp[i + 1][temp]);
            }
        }
        
    }
    
    return Math.min(...dp[onboard.length - 1]);
}

// 기댓값 40
console.log(solution(28, 18, 26, 10, 8, [0, 0, 1, 1, 1, 1, 1]));

// 에어컨 (Lv3)