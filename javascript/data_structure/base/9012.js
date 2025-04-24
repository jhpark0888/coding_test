// let [n, ...input] = require('fs').readFileSync('input.txt').toString().split('\n');
let [n, ...input] = require('fs').readFileSync('/dev/stdin').toString().split('\n');

function solution(ps) {
    let count = 0;
    
    for (const c of ps) {
        if (c === "(") {
            count += 1;
        } else if (c === ")") {
            count -= 1;
        }
        if (count < 0) { return "NO"; }
    }
    
    return count === 0 ? "YES" : "NO";
}

for (let i = 0; i < n; i++) {
    const ps = input[i].split("");
    console.log(solution(ps))
}
