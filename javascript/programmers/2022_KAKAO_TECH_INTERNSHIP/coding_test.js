function solution(alp, cop, problems) {
    let [TARGET_ALP, TARGET_COP] = [alp, cop];
    problems.forEach(v => {
        TARGET_ALP = Math.max(TARGET_ALP, v[0]);
        TARGET_COP = Math.max(TARGET_COP, v[1]);
    });
    const dp = Array.from({ length: TARGET_ALP + 1 }, () => Array.from({ length: TARGET_COP + 1 }, () => Infinity));
    dp[alp][cop] = 0;
    
    for (let a = alp; a <= TARGET_ALP; a++) {
        for (let c = cop; c <= TARGET_COP; c++) {
            if (a === TARGET_ALP && c === TARGET_COP) break;
            
            if (a + 1 <= TARGET_ALP) {
                const origin = dp[a + 1][c];
                const next = dp[a][c] + 1;
                dp[a + 1][c] = Math.min(origin, next);  
            } 
            if (c + 1 <= TARGET_COP) {
                const origin = dp[a][c + 1];
                const next = dp[a][c] + 1;
                dp[a][c + 1] = Math.min(origin, next);    
            } 
            
            
            for (const [alpReq, copReq, alpRwd, copRwd, cost] of problems) {
                if (a < alpReq || c < copReq) continue;
                const curAlp = Math.min(a + alpRwd, TARGET_ALP);
                const curCop = Math.min(c + copRwd, TARGET_COP);
                const cur = dp[curAlp][curCop];
                const next = dp[a][c];
                dp[curAlp][curCop] = Math.min(cur, next + cost);
            }
        } 
    }
    
    return dp[TARGET_ALP][TARGET_COP];
}

console.log(solution(15, 10, [[10,15,2,1,2],[20,20,3,3,4]])); 

// 코딩 테스트 공부 (Lv3)