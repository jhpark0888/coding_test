function solution(board, skill) {
    const N = board.length;
    const M = board[0].length;
    const matrix = Array.from({length: N + 1}, () => Array.from({length: M + 1}, () => 0));
    
    for (const [type, r1, c1, r2, c2, deg] of skill) {
        const value = (type === 2 ? 1 : -1) * deg;
        
        matrix[r1][c1] += value;
        matrix[r1][c2 + 1] -= value;
        matrix[r2 + 1][c1] -= value;
        matrix[r2 + 1][c2 + 1] += value;
    }
    
    for (let r = 0; r < N + 1; r++) {
        for (let c = 1; c < M + 1; c++) {
            matrix[r][c] = matrix[r][c - 1] + matrix[r][c];
        }    
    }
    
    for (let r = 1; r < N + 1; r++) {
        for (let c = 0; c < M + 1; c++) {
            matrix[r][c] = matrix[r - 1][c] + matrix[r][c];
        }
    }
    
    for (let r = 0; r < N; r++) {
        for (let c = 0; c < M; c++) {
            board[r][c] += matrix[r][c];
        }
    }
    
    return board.reduce((pv, cv) => pv + cv.filter((v) => v > 0).length, 0);
}

// 10
console.log(solution([[5, 5, 5, 5, 5], [5, 5, 5, 5, 5], [5, 5, 5, 5, 5], [5, 5, 5, 5, 5]], [[1, 0, 0, 3, 4, 4], [1, 2, 0, 2, 3, 2], [2, 1, 0, 3, 1, 2], [1, 0, 1, 3, 3, 1]]));

// 파괴되지 않은 건물 (Lv3)