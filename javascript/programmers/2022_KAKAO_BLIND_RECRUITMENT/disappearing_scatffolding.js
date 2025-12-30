function solution(board, aloc, bloc) {
    var answer = -1;
    /// 행 길이
    const N = board.length;
    /// 열 길이
    const M = board[0].length; 
    const direction = [[1, 0], [-1, 0], [0, 1], [0, -1]];
    
    /// order = 0 : A
    /// order = 1 : B
    const dfs = (order, curA, curB, count) => {
        const win = [];
        const lose = [];
        let isSamePos = curA[0] === curB[0] && curA[1] === curB[1];
        let isMoved = false;
        for (const [dx, dy] of direction) {
            const nx = (order ? curB[0] : curA[0]) + dx;
            const ny = (order ? curB[1] : curA[1]) + dy;
            const opX = order ? curA[0] : curB[0];
            const opY = order ? curA[1] : curB[1];
            
            if (nx < 0 || nx >= N || ny < 0 || ny >= M) continue;
            if (board[nx][ny] === 0) continue;
            
            isMoved = true
            if (isSamePos) break;
            
            const orgX = order ? curB[0] : curA[0];
            const orgY = order ? curB[1] : curA[1];
            
            board[orgX][orgY] = 0;
            const value = dfs(
                !order,  
                order ? curA : [nx, ny],
                order ? [nx, ny] : curB,
                count + 1
            );
            board[orgX][orgY] = 1;
            
            if (!order) {
                if(value % 2 === 1) win.push(value);
                else lose.push(value);
            } else {
                if(value % 2 === 1) lose.push(value);
                else win.push(value);
            }
        }
        
        if (isMoved) {
            if (isSamePos) return count + 1;
        } else return count;
        
        if(win.length > 0) return Math.min(...win);
        else return Math.max(...lose);
    }
    
    answer = dfs(0, aloc, bloc, 0);
    
    return answer;
}

// 결과값: 5
console.log(solution([[1, 1, 1], [1, 1, 1], [1, 1, 1]], [1, 0], [1, 2]));

// 사라지는 발판 (Lv 3)
