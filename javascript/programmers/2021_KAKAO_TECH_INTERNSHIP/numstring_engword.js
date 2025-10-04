function solution(s) {
    var map = new Map([
        ["zero", 0],
        ["one", 1],
        ["two", 2],
        ["three", 3],
        ["four", 4],
        ["five", 5],
        ["six", 6],
        ["seven", 7],
        ["eight", 8],
        ["nine", 9],
    ]);
    var answer = s;
    
    for (const entry of map.entries()) {
        answer = answer.replaceAll(entry[0], String(entry[1]));
    }
    
    return Number(answer);
}

console.log(solution("one4seveneight"));

// 숫자 문자열과 영단어 (Lv1)