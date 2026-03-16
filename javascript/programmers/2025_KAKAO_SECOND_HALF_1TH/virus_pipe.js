function solution(n, infection, edges, k) {
    var answer = 0;
    const infectionSet = new Set([infection]);
    // type 1: A, 2: B, 3: C
    const graph = Array.from({ length: n + 1 }, () => ({
            1: [], 2: [], 3: []
    }));
    
    for (const [n1, n2, t] of edges) {
        graph[n1][t].push(n2);
        graph[n2][t].push(n1);
    }
    
    const spread = (prev, type, node, newInfections) => {
        for (const target of graph[node][type]) {
            if (target === prev) continue;
            if (!infectionSet.has(target)) {
                newInfections.add(target);
                spread(node, type, target, newInfections);
            }
        }
    }
    
    const dfs = (lastType, count) => {
        if (count === k || infectionSet.size === n) {
            answer = Math.max(answer, infectionSet.size);
            return;
        }
        
        for (let i = 1; i <= 3; i++) {
            if (lastType === i) continue;
            const newInfections = new Set();
            
            for (const node of infectionSet.values()) {
                spread(-1, i, node, newInfections);
            }
            
            newInfections.forEach((v) => infectionSet.add(v));
            dfs(i, count + 1);
            newInfections.forEach((v) => infectionSet.delete(v));
        }
    }
    
    dfs(0, 0);
    
    return answer;
}

// 기댓값 6
console.log(solution(10, 1, [[1, 2, 1], [1, 3, 1], [1, 4, 3], [1, 5, 2], [5, 6, 1], [5, 7, 1], [2, 8, 3], [2, 9, 2], [9, 10, 1]], 2));
// 바이러스 파이프 (Lv2)