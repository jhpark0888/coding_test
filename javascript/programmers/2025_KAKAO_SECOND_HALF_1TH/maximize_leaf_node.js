function solution(dist_limit, split_limit) {
    if (dist_limit === 0) return 1;
    
    var answer = 0;
    
    const dfs = (leaves, dist, split) => {
        for (let i = 2; i <= 3; i++) {
            if (split * i > split_limit) {
                answer = Math.max(answer, leaves);
                continue;
            }
            
            if (dist + leaves > dist_limit) {
                const lastDist = dist_limit - dist
                answer = Math.max(answer, leaves + (lastDist * (i - 1)));
                continue;
            }
            
            dfs(leaves * i, dist + leaves, split * i);
        }
    }
    
    dfs(1, 0, 1);
    
    return answer;
}

// 기댓값 7
console.log(solution(3, 100));
// 리프 노드 수 최대화 (Lv2)