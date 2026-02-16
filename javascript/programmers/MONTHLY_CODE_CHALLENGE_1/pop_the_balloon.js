function solution(a) {
    var answer = 0;
    let minValue = Infinity;
    const isContained = Array.from({ length: a.length }, () => false);
    
    for (let i = 0; i < a.length; i++) {
        const num = a[i];
        if (num > minValue) continue;

        answer++;
        minValue = num;
        isContained[i] = true;
    }
    
    minValue = Infinity;
    for (let i = a.length - 1; i >= 0; i--) {
        const num = a[i];
        if (num > minValue) continue;
        
        if (!isContained[i]) {
            answer++;
            isContained[i] = true;
        } 
        minValue = num;
    }
    
    return answer;
}

// 기댓값 6
console.log(solution([-16, 27, 65, -2, 58, -92, -71, -68, -61, -33]));
// 풍선 터뜨리기 (Lv3)