function solution(n, w, num) {
    var answer = 0;
    const maxFloor = Math.ceil(n / w);
    const floor = Math.ceil(num / w);
    answer = maxFloor - floor;
    const numColumn = num % w === 0 ? w : num % w;
    const nColumn = n % w === 0 ? w : n % w;
    
    if (maxFloor % 2 === floor % 2) {
        if (nColumn >= numColumn) answer += 1; 
    } else {
        if (w - nColumn < numColumn) answer += 1; 
    }
    
    return answer;
}

// 기댓값 3
console.log(solution(22, 6, 8));
// 택배 상자 꺼내기 (Lv1)