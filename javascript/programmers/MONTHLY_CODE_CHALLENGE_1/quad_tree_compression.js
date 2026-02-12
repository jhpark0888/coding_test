function solution(arr) {
    var answer = [0, 0];
    
    const compression = (r, c, size) => {
        const cell = arr[r][c];
        let isSame = true;
        
        for (let i = r; i < r + size; i++) {
            for (let j = c; j < c + size; j++) {
                if (arr[i][j] !== cell) {
                    isSame = false;
                    break;
                }
            }
            if (!isSame) break;
        }
        
        if (isSame) {
            answer[cell]++;
        } else {
            const half = size / 2;
            
            compression(r, c, half);
            compression(r + half, c, half);
            compression(r, c + half, half);
            compression(r + half, c + half, half);
        }
    }
    
    compression(0, 0, arr.length);
    
    return answer;
}

// 기댓값 [4, 9]
console.log(solution([[1, 1, 0, 0], [1, 0, 0, 0], [1, 0, 0, 1], [1, 1, 1, 1]]));
// 쿼드압축 후 개수 세기 (Lv2)

// 처음 푼 방식 
// 바텀 업 방식으로 해결
// 쿼드트리를 큰 부분부터 압축하는 게 아니라 작은 부분부터 압축

// function solution(arr) {
//     var answer = [0, 0];
//     let curArr = arr;
//     const d = [[0, 1], [1, 0], [1, 1]];
    
//     while (curArr.length > 1) {
//         const nextLength = curArr.length / 2;
//         const compression = Array.from({length: nextLength}, () => Array(nextLength).fill(0));
    
//         for (let r = 0; r < nextLength; r++) {
//             for (let c = 0; c < nextLength; c++) {
//                 const row = r * 2;
//                 const col = c * 2;
//                 const cell = curArr[row][col];
//                 let isCompression = true;
//                 let zero = Number(cell === 0);
//                 let one = Number(cell === 1);
                
//                 for (const [dr, dc] of d) {
//                     const nextCell = curArr[row + dr][col + dc];
//                     if (cell !== nextCell) isCompression = false;
                    
//                     if (nextCell === 1) one++;
//                     else if (nextCell === 0) zero++;
//                 }
                
//                 if (isCompression) {
//                     compression[r][c] = cell;
//                 } else {
//                     compression[r][c] = -1;
//                     answer[0] += zero;
//                     answer[1] += one;
//                 }
                
//             }
//         }
        
//         curArr = compression;
//     }
    
//     if (curArr[0][0] !== -1) answer[curArr[0][0]]++; 
    
//     return answer;
// }