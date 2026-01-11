function solution(n, q, ans) {
    var answer = 0;
    const secret = [];
    const candidate = [];
    const getSameNumCount = (secret, input) => {
        let count = 0;
        
        for (const num of secret) {
            if (input.includes(num)) count += 1;
        }
        
        return count;
    }
    
    const dfs = (index, count) => {
        if (count === 5) {
            for (let i = 0; i < q.length; i++) {
                const input = q[i];
                const a = ans[i];
                
                if (getSameNumCount(secret, input) !== a) return;
            }
            
            candidate.push([...secret]);
            answer += 1;
            return;
        }
        
        for (let i = index; i <= n; i++) {
            secret.push(i);
            dfs(i + 1, count + 1);
            secret.pop();
        }
    }
    
    dfs(1, 0);
    
    return answer;
}

// 기댓값 3
console.log(solution(10, [[1, 2, 3, 4, 5], [6, 7, 8, 9, 10], [3, 7, 8, 9, 10], [2, 5, 7, 9, 10], [3, 4, 5, 6, 7]], [2, 3, 4, 3, 3]));
// 비밀 코드 해독 (Lv2)