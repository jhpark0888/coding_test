function solution(numbers) {
    var answer = new Set();
    
    for (let i = 0; i < numbers.length; i++) {
        for (let j = i + 1; j < numbers.length; j++) {
            const value = numbers[i] + numbers[j];
            answer.add(value);
        }
    }
    
    return Array.from(answer).sort((a, b) => a - b);
}

// 기댓값 [2, 3, 4, 5, 6, 7]
console.log(solution([2, 1, 3, 4, 1]));
// 두 개 뽑아서 더하기 (Lv1)