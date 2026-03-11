function solution(message, spoiler_ranges) {
    const n = message.length;
    const isSpoiler = Array(n).fill(false);
    
    for (const [s, e] of spoiler_ranges) {
        for (let i = s; i <= e; i++) {
            isSpoiler[i] = true;
        }
    }
    
    const words = [];
    let start = 0;
    
    for (let i = 0; i <= n; i++) {
        if (i === n || message[i] === " ") {
            const word = message.slice(start, i);
            
            let hasSpoiler = false;
            
            for (let j = start; j < i; j++) {
                if (isSpoiler[j]) {
                    hasSpoiler = true;
                    break;
                }
            }
            
            words.push({
                word,
                hasSpoiler,
            });
            
            start = i + 1;
        }
    }
    
    const normalSets = new Set();
    
    for (const w of words) {
        if (!w.hasSpoiler) normalSets.add(w.word);
    }
    
    const used = new Set();
    let answer = 0;
    
    for (const w of words) {
        if (!w.hasSpoiler) continue;
        
        if (!normalSets.has(w.word) && !used.has(w.word)) {
            answer++;
            used.add(w.word);
        }
    }
    
    return answer;
}


// 기댓값 1
console.log(solution("here is muzi here is a secret message", [[0, 3], [23, 28]]));
// 중요한 단어를 스포 방지 (Lv1)
