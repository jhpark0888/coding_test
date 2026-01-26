function solution(nodes, edges) {
    var answer = [0, 0];
    const tree = {};
    const degree = {};
    const parity = {};
    const isVisited = {};
    
    for (const node of nodes) {
        degree[node] = 0;
        tree[node] = [];
    }
    
    for (const [n1, n2] of edges) {
        degree[n1] += 1;
        degree[n2] += 1;
        tree[n1].push(n2);
        tree[n2].push(n1);
    }
    
    for (const node of nodes) {
        parity[node] = (node % 2) === (degree[node] % 2);
    }
    
    for (const node of nodes) {
        if (isVisited[node]) continue;
        const stack = [];
        isVisited[node] = true;
        let validCount = 0;
        let unvalidCount = 0;
        
        if (parity[node]) validCount += 1;
        else unvalidCount += 1;
        
        for (const child of [...tree[node] ?? []]) {
            isVisited[child] = true;
            stack.push(child);
        }
        
        while (stack.length > 0) {
            const childNode = stack.pop();
            
            if (parity[childNode]) validCount += 1;
            else unvalidCount += 1;
            
            for (const next of tree[childNode] ?? []) {
                if (isVisited[next]) continue;
                isVisited[next] = true;
                stack.push(next);
            }
        }
        
        if (validCount >= 0 && unvalidCount === 1) answer[1] += 1;
        if (validCount === 1 && unvalidCount >= 0) answer[0] += 1;
    }
    
    return answer;
}

// 기댓값 [2, 1]
console.log(solution([9, 15, 14, 7, 6, 1, 2, 4, 5, 11, 8, 10], [[5, 14], [1, 4], [9, 11], [2, 15], [2, 5], [9, 7], [8, 1], [6, 4]]));
// 홀짝트리 (Lv3)