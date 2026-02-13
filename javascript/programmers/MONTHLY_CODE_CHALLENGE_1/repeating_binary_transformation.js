function solution(s) {
    let count = 0;
    let zeroCount = 0;
    
    while (s !== "1") {
        let originLength = s.length;
        s = s.replaceAll("0", "");
        
        zeroCount += originLength - s.length;
        count++;
        
        s = s.length.toString(2);
    }
    
    return [count, zeroCount];
}

// 기댓값 [3, 8]
console.log(solution("110010101001"));
// 이진 변환 반복하기 (Lv2)