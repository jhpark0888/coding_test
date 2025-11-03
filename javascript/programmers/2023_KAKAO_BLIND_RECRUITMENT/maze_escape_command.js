function solution(n, m, y, x, c, r, k) {
    var answer = '';
    const d = [[0, 1], [-1, 0], [1, 0], [0, -1]];
    const directions = ['d', 'l', 'r', 'u'];
    const minMoveCount = Math.abs(x - r) + Math.abs(y - c);
    
    const dfs = (result, posX, posY, count) => {
        const distance = Math.abs(posX - r) + Math.abs(posY - c);
        if (distance > count) return;
        
        if (count === 0) {
            if (posX !== r || posY !== c) return;
            answer = result;
            return;
        }
        
        for (let i = 0; i < d.length; i++) {
            const direction = directions[i];
            const nx = posX + d[i][0];
            const ny = posY + d[i][1];
            if (nx < 1 || nx > m || ny < 1 || ny > n) continue;
            
            dfs(result + direction, nx, ny, count - 1);
            if (answer.length > 0) break; 
        }
    }
    
    if (minMoveCount > k) return "impossible";
    if ((k - minMoveCount) % 2 !== 0) return "impossible";
    dfs("", x, y, k);
    
    return answer || "impossible";
}

console.log(solution(3,	4, 2, 3, 3,	1, 5));

// 미로 탈출 명령어 (Lv3)