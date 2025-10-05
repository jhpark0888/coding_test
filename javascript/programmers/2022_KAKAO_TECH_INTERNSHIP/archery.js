function dfs(n, info, result, depth, bestResult) {
    if (n === 0 || depth === 11) {
        if (n > 0) result[10] += n;
        
        const score = calculate(info, result);
        const bestScore = calculate(info, bestResult);
        
        if (score > bestScore || (score === bestScore && better(result, bestResult))) {
            for (let j = 0; j < 11; j++) bestResult[j] = result[j];
        }
        
        if (n > 0) result[10] -= n;
        
        return;
    }
    const need = info[depth] + 1;
    
    if (n >= need) {
        result[depth] = need;
        dfs(n - need, info, result, depth + 1, bestResult);
        result[depth] = 0;
    }
    
    dfs(n, info, result, depth + 1, bestResult);
}

function calculate(info, result) {
    let lion = 0;
    let apeach = 0;
    
    for (let i = 0; i < 11; i++) {
        if (info[i] === 0 && result[i] === 0) continue;
        if (info[i] >= result[i]) {
            apeach += 10 - i;
        } else {
            lion += 10 - i;
        }
    }
    
    return lion - apeach;
}

function better(t1, t2) {
    for (let i = 10; i >= 0; i--) {
        if (t1[i] !== t2[i]) return t1[i] > t2[i];
    }
    return false
}

function solution(n, info) {
    let result = Array(11).fill(0);
    let bestResult = Array(11).fill(0);
    
    dfs(n, info, result, 0, bestResult);
    
    if (calculate(info, bestResult) <= 0) return [-1];
    
    return bestResult;
}

console.log(solution(5, [2,1,1,1,0,0,0,0,0,0,0]));

// 양궁대회 (Lv2)