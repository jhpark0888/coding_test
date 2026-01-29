function solution(players, m, k) {
    var answer = 0;
    let curServerCount = 0;
    const queue = [];
    
    for (let t = 0; t < players.length; t++) {
        if (queue.length > 0) {
            const [serverCount, time] = queue[0];
            if (time + k <= t) {
                queue.shift();
                curServerCount -= serverCount;
            }
        }
        
        const playerCount = players[t];
        if (Math.floor(playerCount / m) <= curServerCount) continue;
        
        const numberOfServerToExpand = Math.floor(playerCount / m) - curServerCount;
        
        queue.push([numberOfServerToExpand, t]);
        curServerCount += numberOfServerToExpand;
        answer += numberOfServerToExpand;
    }
    
    return answer;
}

// 기댓값 7
console.log(solution([0, 2, 3, 3, 1, 2, 0, 0, 0, 0, 4, 2, 0, 6, 0, 4, 2, 13, 3, 5, 10, 0, 1, 5], 3, 5));
// 서버 증설 횟수 (Lv2)