function solution(k, n, reqs) {
    const consultants = Array.from({length: k + 1}, () => [0]);
    const waitingTimes = Array.from({length: k + 1}, () => 0);
    let remainConsultantsCount = n - k;
    
    while (remainConsultantsCount >= 0) {
        for (const [time, duration, type] of reqs) {
            const availableTime = consultants[type][0];
            
            if (time < availableTime) {
                waitingTimes[type] += availableTime - time;
            }
            consultants[type][0] = Math.max(availableTime, time) + duration;
            consultants[type].sort((a, b) => a - b);
        } 
        
        if (remainConsultantsCount === 0) break;
        
        for (const c of consultants) {
            c.fill(0, 0);
            c.push(0);
        }
        
        for (const [time, duration, type] of reqs) {
            const availableTime = consultants[type][0];
            
            if (time < availableTime) {
                waitingTimes[type] -= availableTime - time;
            }
            consultants[type][0] = Math.max(availableTime, time) + duration;
            consultants[type].sort((a, b) => a - b);
        } 
        
        let type = waitingTimes.indexOf(Math.max(...waitingTimes));
        for (let i = 1; i < consultants.length; i++) {
            if (type !== i) consultants[i].pop();
            consultants[i].fill(0, 0);
        }
        waitingTimes.fill(0, 0);
        
        remainConsultantsCount--;
    }

    return waitingTimes.reduce((pv, cv) => pv + cv, 0);
}
// 기댓값 25
console.log(solution(3, 5, [[10, 60, 1], [15, 100, 3], [20, 30, 1], [30, 50, 3], [50, 40, 1], [60, 30, 2], [65, 30, 1], [70, 100, 2]]));

// 상담원 인원 (Lv3)