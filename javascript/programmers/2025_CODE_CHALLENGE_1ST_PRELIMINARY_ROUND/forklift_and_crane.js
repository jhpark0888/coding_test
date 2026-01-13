function solution(storage, requests) {
    var answer = 0;
    const N = storage.length;
    const M = storage[0].length;
    const directions = [[1, 0], [-1, 0], [0, 1], [0, -1]];
    const isAccessible = Array.from({ length: N }, () => Array(M).fill(false));
    
    isAccessible[0] = Array(M).fill(true);
    for (let i = 1; i < N - 1; i++) {
        isAccessible[i][0] = true;
        isAccessible[i][M - 1] = true;
    }
    isAccessible[N - 1] = Array(M).fill(true);
    
    for (let i = 0; i < storage.length; i++) {
        storage[i] = storage[i].split("");
    }
    
    for (const req of requests) {
        const isVisited = Array.from({ length: N }, () => Array.from({length: M}, () => false));
        const queue = [];
        const type = req.split("")[0];
        // 1: 지게차 2: 크레인
        const reqType = req.length;
        
        for (let i = 0; i < N; i++) {
            for (let j = 0; j < M; j++) {
                const container = storage[i][j];
                if (type !== container) continue;
                
                if (reqType === 1) {
                    if (!isAccessible[i][j]) continue;
                    
                    storage[i][j] = "0";
                    answer += 1;
                    queue.push([i, j]);
                } else {
                    storage[i][j] = "0";
                    answer += 1;
                    if (isAccessible[i][j]) queue.push([i, j]);
                }
            }
        }
        
        while (queue.length > 0) {
            const [y, x] = queue.shift();
            isVisited[y][x] = true;
            const temp = [];
            for (const [dy, dx] of directions) {
                const ny = dy + y;
                const nx = dx + x;
                
                if (ny < 0 || ny >= N || nx < 0 || nx >= M) {
                    isAccessible[y][x] = true;
                    continue;
                }
                if (storage[ny][nx] === "0" && isAccessible[ny][nx]) {
                    isAccessible[y][x] = true;
                    isVisited[ny][nx] = true;
                    continue;
                }    
                if (isVisited[ny][nx]) continue;
                temp.push([ny, nx]);
            }
            
            if (isAccessible[y][x]) queue.push(...temp);
        }
    }
    
    return N * M - answer;
}

// 기댓값 11
console.log(solution(["AZWQY", "CAABX", "BBDDA", "ACACA"], ["A", "BB", "A"]));
// 지게차와 크레인 (Lv2)