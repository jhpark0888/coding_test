function solution(places) {
    const SIZE = 5;
    const DIRS = [[1, 0], [-1, 0], [0, 1], [0, -1]];
    
    const isRange = (y, x) => y >= 0 && y < SIZE && x >= 0 && x < SIZE;
    
    const isRoomSafe = (room) => {
        for (let y = 0; y < SIZE; y++) {
            for (let x = 0; x < SIZE; x++) {
                if (room[y][x] !== 'P') continue;
                
                const visited = Array.from({length: SIZE}, () => Array(SIZE).fill(false));
                const queue = [[y, x, 0]];
                visited[y][x] = true;
                
                while (queue.length) {
                    const [cy,cx,dist] = queue.shift();
                    
                    for (const[dy, dx] of DIRS) {
                        const ny = cy + dy;
                        const nx = cx + dx;
                        const nd = dist + 1;
                        
                        if (!isRange(ny, nx) || visited[ny][nx] || nd > 2) continue;
                        const cell = room[ny][nx];
                        if (cell === 'X') continue;
                        if (cell === 'P') return false;
                        
                        visited[ny][nx] = true;
                        queue.push([ny, nx, nd]);
                    }
                }
            }
        }
        
        return true;
    }
    
    return places.map(room => isRoomSafe(room) ? 1 : 0);
}

console.log(solution([["POOOP", "OXXOX", "OPXPX", "OOXOX", "POXXP"], ["POOPX", "OXPXP", "PXXXO", "OXXXO", "OOOPP"], ["PXOPX", "OXOXP", "OXPOX", "OXXOP", "PXPOX"], ["OOOXX", "XOOOX", "OOOXX", "OXOOX", "OOOOO"], ["PXPXP", "XPXPX", "PXPXP", "XPXPX", "PXPXP"]])); 

// 거리두기 확인하기 (Lv2)