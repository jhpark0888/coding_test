function solution(queue1, queue2) {
    var q1Sum = queue1.reduce((pv, cv) => pv + cv, 0);
    var q2Sum = queue2.reduce((pv, cv) => pv + cv, 0);
    const total = q1Sum + q2Sum;
    const target = total / 2;
    const totalQueue = [...queue1, ...queue2];
    const max = totalQueue.reduce((pv, cv) => Math.max(pv, cv), 0);
    var q1Idx = 0;
    var q2Idx = queue1.length;
    var answer = 0;
    
    if (total % 2 !== 0 || max > target) return -1;
    
    const LIMIT = 3 * totalQueue.length;
    
    while (answer < LIMIT) {
        if (q1Sum === target) return answer;
        
        answer += 1;
        if (q1Sum > q2Sum) {
            var num = totalQueue[q1Idx++];
            q1Idx = q1Idx % totalQueue.length;
            q1Sum -= num;
            q2Sum += num;
        } else {
            var num = totalQueue[q2Idx++];
            q2Idx = q2Idx % totalQueue.length;
            q2Sum -= num;
            q1Sum += num;
        }
    }
    
    return -1;
}

console.log(solution([1, 1], [1, 5])); 

// 두 큐 합 같게 만들기 (Lv2)