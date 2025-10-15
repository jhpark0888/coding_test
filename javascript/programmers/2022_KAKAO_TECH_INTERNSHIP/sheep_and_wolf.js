function solution(info, edges) {
    var answer = 0;
    const tree = Array.from({ length: info.length }, () => []);
    
    for (const [p, c] of edges) tree[p].push(c);
    
    const dfs = (sheep, wolf, isVisited, candidates) => {
        answer = Math.max(answer, sheep);
        
        for (let i = 0; i < candidates.length; i++) {
            const node = candidates[i];
            if (isVisited & (1 << node)) continue; 

            const curSheep = sheep + Number(!info[node]);
            const curWolf = wolf + Number(info[node]);
            if (curSheep <= curWolf) continue;

            const newCandidates = candidates.slice();
            newCandidates.splice(i, 1);

            for (const child of tree[node]) {
                if (isVisited & (1 << child)) continue;
                newCandidates.push(child);
            } 
            
            const nextVisited  = isVisited | (1 << node);
            dfs(curSheep, curWolf, nextVisited, newCandidates);
        }        
    }
    
    dfs(1, 0, 1 << 0, [...tree[0]]);
    
    return answer;
}

console.log(solution([0,1,0,1,1,0,1,0,0,1,0], [[0,1],[0,2],[1,3],[1,4],[2,5],[2,6],[3,7],[4,8],[6,9],[9,10]]));

// 양과 늑대 (Lv 3)