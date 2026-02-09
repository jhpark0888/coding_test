function solution(n) {
    const triangle = Array.from({ length: n }, (_, i) => 
        Array.from({ length: i + 1 }, () => 0)
    );
    
    const dr = [1, 0, -1];
    const dc = [0, 1, -1];
    
    let row = -1;
    let col = 0;
    let value = 1;
    let direction = 0;
    
    for (let steps = n; steps > 0; steps--) {
        for (let i = 0; i < steps; i++) {
            row += dr[direction];
            col += dc[direction];
            triangle[row][col] = value;
            value += 1;
        }
        direction = (direction + 1) % 3;
    }
    
    return triangle.flat();
}

// 기댓값 [1, 2, 9, 3, 10, 8, 4, 5, 6, 7]
console.log(solution(4));
// 삼각 달팽이 (Lv2)