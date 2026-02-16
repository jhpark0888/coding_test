function solution(a) {
    let answer = 0;
    const n = a.length;
    if (n < 2) return 0;
    
    const count = new Map();
    
    for (const num of a) {
        count.set(num, (count.get(num) || 0) + 1);
    }
    
    for (const [num, freq] of count.entries()) {
        if (freq * 2 <= answer) continue;
        
        let pair = 0;
        for (let i = 0; i < n - 1; i++) {
            if (
                a[i] !== a[i + 1] && 
                (a[i] === num || a[i + 1] === num)
            ) {
                pair++;
                i++;
            }
        }
        
        answer = Math.max(answer, pair * 2);
    }
    
    return answer;
}

// 기댓값 8
console.log(solution([0, 3, 3, 0, 7, 2, 0, 2, 2, 0]));
// 스타 수열 (Lv3)

// 처음 푼 방식 
// 교집합에 포함되는 수를 기준으로 부분집합을 만든다고 생각함
// 첫번째 수부터 뒤의 숫자와 앞의 숫자가 같은지 비교 후 다를 경우 해당 수의 카운트 증가
// 각 수마다 포함된 마지막 수의 인덱스를 저장하여 뒤의 숫자를 비교할 때 마지막 인덱스보다 클 경우에만 비교
// 너무 복잡함

// function solution(a) {
//     let answer = 0;
    
//     if (a.length <= 2) {
//         if (a.length === 1) return 0;
//         if (a[0] === a[1]) return 0;
//         return 2;
//     }
//     const MAX_VALUE = a.length;
//     const numCount = Array.from({length: MAX_VALUE}, () => 0);
//     const lastIndexs = Array.from({length: MAX_VALUE}, () => -1);
    
//     for (let i = 0; i < a.length; i++) {
//         const cur = a[i];
//         let lastIndex = -1;
//         let isPlus = false;
        
//         if (i > 0 && lastIndexs[cur] < i - 1) {
//             const prev = a[i - 1];
//             if (prev !== cur) {
//                 isPlus = true;
//                 lastIndex = i;
//             }            
//         }
        
//         if (i < a.length - 1) {
//             const next = a[i + 1];
//             if (next !== cur) {
//                 if (lastIndex === -1) lastIndex = i + 1;
//                 isPlus = true;
//             }            
//         }
        
//         if (isPlus) {
//             numCount[cur]++;
//             lastIndexs[cur] = lastIndex;            
//         }
//         answer = Math.max(answer, numCount[cur]);
//     }
    
//     return answer * 2;
// }