function solution(a, b) {
    var answer = 0;
    
    for (let i = 0; i < a.length; i++) {
        answer += a[i] * b[i];
    }
    
    return answer;
}

// 기댓값 3
console.log(solution([1, 2, 3, 4], [-3, -1, 0, 2]));
// 내적 (Lv1)