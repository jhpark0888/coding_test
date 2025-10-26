function solution(n, tops) {
    var answer = 0;
    const dp = Array.from({length: n + 1}, () => 0);
    const MOD = 10007;
    dp[0] = 1;
    dp[1] = 3 + tops[0];
    tops.unshift(0);
    
    for (let i = 2; i <= n; i++) {
        dp[i] = (dp[i - 1] * (3 + tops[i]) - dp[i - 2] + MOD) % MOD;
    }
    
    return dp[n] % MOD;
}

console.log(solution(4, [1, 1, 0, 1]))

// 산 모양 타일링 (Lv3)