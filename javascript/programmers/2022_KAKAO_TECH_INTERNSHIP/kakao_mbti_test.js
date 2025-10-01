function solution(survey, choices) {
    let points = {
        'R': 0, 'T': 0,
        'C': 0, 'F': 0,
        'J': 0, 'M': 0,
        'A': 0, 'N': 0, 
    };
    let result = "";

    for (let i = 0; i < survey.length; i++) {
        const q = survey[i];
        const answer = choices[i];

        if (answer === 4) continue;

        if (answer <= 3) {
            points[q.split("")[0]] += 4 - answer;
        } else {
            points[q.split("")[1]] += answer - 4;
        }
    }

    result += points["R"] >= points["T"] ? "R" : "T";
    result += points["C"] >= points["F"] ? "C" : "F";
    result += points["J"] >= points["M"] ? "J" : "M";
    result += points["A"] >= points["N"] ? "A" : "N";

    return result;
}

console.log(solution(["TR", "RT", "TR"]	, [7, 1, 3]));

// 성격 유형 검사하기 (Lv1)