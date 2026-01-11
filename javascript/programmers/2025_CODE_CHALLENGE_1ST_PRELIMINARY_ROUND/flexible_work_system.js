function solution(schedules, timelogs, startday) {
    var answer = 0;
    
    for (let i = 0; i < schedules.length; i++) {
        const origin = schedules[i];
        let hour = Math.floor(origin / 100);
        let minute = origin % 100 + 10;
        hour += Math.floor(minute / 60);
        minute = minute % 60;
        schedules[i] = hour * 100 + minute;
    }
    
    next:
    for (let i = 0; i < timelogs.length; i++) {
        const goal = schedules[i];
        const timelog = timelogs[i];
        let dow = startday;
        
        for (const log of timelog) {
            dow = dow % 7;
            if (dow === 6 || dow === 0) {
                dow += 1;
                continue;
            }
            
            if (log > goal) continue next; 
            dow += 1;
        }
        
        answer += 1;
    }
    
    return answer;
}

// 기댓값 3
console.log(solution([700, 800, 1100], [[710, 2359, 1050, 700, 650, 631, 659], [800, 801, 805, 800, 759, 810, 809], [1105, 1001, 1002, 600, 1059, 1001, 1100]], 5));
// 유연근무제 (Lv1)