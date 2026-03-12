function solution(signals) {
    var answer = -1;
    const N = signals.length;
    const periods = signals.map(([g, y, r]) => g + y + r);
    
    const gcd = (a, b) => b === 0 ? a : gcd(b, a % b);
    const lcm = (a, b) => a * b / gcd(a, b);
    
    const MAX_CYCLE = periods.reduce((a, b) => lcm(a, b));
    
    for (let t = 0; t <= MAX_CYCLE; t++) {
        let isBlackout = true;
        
        for (let i = 0; i < N; i++) {
            const [g, y, r] = signals[i];
            const period = periods[i];
            
            const remainder = t % period;
            
            if (!(g <= remainder && remainder < g + y)) {
                isBlackout = false;
                break;
            }
        }
        
        if (isBlackout) {
            answer = t + 1;
            break;
        }
    }
    
    return answer;
}

// 기댓값 11
console.log(solution([[2, 3, 2], [3, 1, 3], [2, 1, 1]]));
// 노란불 신호등 (Lv1)