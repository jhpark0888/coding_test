function solution(todayStr, terms, privacies) {
    var answer = [];
    const today = new Date(todayStr);
    const duration = {}
    
    for (const term of terms) {
        const [t, d] = term.split(" ");
        duration[t] = Number(d);
    }
    
    for (let i = 0; i < privacies.length; i++) {
        const [dateStr, term] = privacies[i].split(" ");
        const dueDate = new Date(dateStr);
        dueDate.setMonth(dueDate.getMonth() + duration[term]);
        if (today >= dueDate) {
            answer.push(i + 1);
        }
    }
    return answer;
}

console.log(solution("2022.05.19", ["A 6", "B 12", "C 3"], ["2021.05.02 A", "2021.07.01 B", "2022.02.19 C", "2022.02.20 C"]));

// 개인정보 수집 유효기간 (Lv1)