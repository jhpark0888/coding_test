function solution(commands) {
    var answer = [];
    let table = Array.from({length: 51}, () => Array.from({length: 51}, () => ""));
    const isUnion = (r, c) => typeof table[r][c] !== "string"; 
    
    const findParent = (r, c) => {
        if (!isUnion(r, c)) return [+r, +c];
        const [nr, nc] = table[r][c];
        return findParent(nr, nc);
    }    
    
    const union = (r1, c1, r2, c2) => {
        const [pr1, pc1] = findParent(r1, c1);
        const [pr2, pc2] = findParent(r2, c2);
        const value = table[pr1][pc1] || table[pr2][pc2]

        if (pr1 === pr2 && pc1 === pc2) return;
        
        table[pr2][pc2] = [pr1, pc1];
        table[pr1][pc1] = value;
    }
    
    const unUnion = (r, c) => {
        const temp = JSON.parse(JSON.stringify(table));
        const [pr, pc] = findParent(r, c);
        const value = table[pr][pc];
        for (let i = 1; i < table.length; i++) {
            for (let j = 1; j < table[i].length; j++) {
                const [tr, tc] = findParent(i, j);
                if (pr === tr && pc === tc) {
                    temp[i][j] = "";
                }
            }
        }
        temp[r][c] = value;
        table = temp;
    }
        
    const execution = (command) => {
        const [type, ...others] = command.split(' ');
        
        if (type === "UPDATE") {
            if (others.length > 2) {
                const [r, c, value] = others;
                const [pr, pc] = findParent(r, c);
                table[pr][pc] = value;
            } else {
                const [v1, v2] = others;
                for (let i = 1; i < table.length; i++) {
                    for (let j = 1; j < table[i].length; j++) {
                        const [pr, pc] = findParent(i, j);
                        if (table[pr][pc] === v1) {
                            table[pr][pc] = v2;
                        }
                    }
                }
            }
            return;
        }
        
        if (type === "MERGE") {
            const [r1, c1, r2, c2] = others;
            union(r1, c1, r2, c2);
            return;
        }
        
        if (type === "UNMERGE") {
            const [r, c] = others;
            unUnion(r, c);
            return;
        }
        
        if (type === "PRINT") {
            const [r, c] = others;
            const [pr, pc] = findParent(r, c);
            answer.push(table[pr][pc] || "EMPTY");
            return;
        }
    }
    
    for (const command of commands) {
        execution(command);
    }
    
    return answer;
}

// console.log(solution(
//     [
//         "UPDATE 1 1 menu", 
//         "UPDATE 1 2 category", 
//         "UPDATE 2 1 bibimbap", 
//         "UPDATE 2 2 korean", 
//         "UPDATE 2 3 rice", 
//         "UPDATE 3 1 ramyeon", 
//         "UPDATE 3 2 korean", 
//         "UPDATE 3 3 noodle", 
//         "UPDATE 3 4 instant", 
//         "UPDATE 4 1 pasta", 
//         "UPDATE 4 2 italian", 
//         "UPDATE 4 3 noodle", 
//         "MERGE 1 2 1 3", 
//         "MERGE 1 3 1 4", 
//         "UPDATE korean hansik", 
//         "UPDATE 1 3 group", 
//         "UNMERGE 1 4", 
//         "PRINT 1 3", 
//         "PRINT 1 4"
//     ],
// ));

console.log(solution(
    [
        "UPDATE 1 1 a", 
        "UPDATE 1 2 b", 
        "UPDATE 2 1 c", 
        "UPDATE 2 2 d", 
        "MERGE 1 1 1 2", 
        "MERGE 2 2 2 1", 
        "MERGE 2 1 1 1", 
        "PRINT 1 1", 
        "UNMERGE 2 2", 
        "PRINT 1 1"
    ],
));

// 표 병합 (Lv3)