function solution(n) {
    const reversedTernary = Array.from(n.toString(3)).reduce((pv, cv) => cv + pv);
    
    return parseInt(reversedTernary, 3);
}

// 기댓값 7
console.log(solution(45));
// 3진법 뒤집기 (Lv1)