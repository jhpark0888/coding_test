const n = parseInt(require('fs')
    .readFileSync(process.platform === 'linux' ? '/dev/stdin' : 'input.txt')
    .toString());

let answer = Array.from({length: n}, () => "");

function setVacancy(n, start) {
    for (let i = n; i > 0; i--) {
        if (n === 0) { continue }
        answer[start + n - i] += " ".repeat(i - 1);
    }
}

function setStar(n, start) {
    if (n === 3) {
        answer[start] += "*";
        answer[start + 1] += "* *";
        answer[start + 2] += "*****";
        return;
    }

    const nextN = n / 2;
    for (let i = 0; i < 4; i++) {
        if (i === 0) {
            setStar(nextN, start);
            continue;
        }
        
        if (i === 2) {
            setVacancy(nextN, start + nextN);
            for (let i = 0; i < nextN; i++) answer[start + nextN + i] += " ";
            setVacancy(nextN, start + nextN);
            continue;
        }

        setStar(nextN, start + nextN);
    }
}

setVacancy(n, 0);
setStar(n, 0);
setVacancy(n, 0);

for (const row of answer) console.log(row);


// user213123님 풀이
// const fs = require('fs')
// const input = fs.readFileSync(process.platform === 'linux' ? '/dev/stdin' : './input.txt', 'utf8')
//   .trim()
//   .split('\n')

// const n = parseInt(input[0]);

// const star = (n) => {
//   if (n === 3) return ['  *  ', ' * * ', '*****'];
//   const prev = star(n / 2);
//   const w = prev[prev.length - 1].length;
//   return [
//     ...prev.map(e => ' '.repeat(n / 2) + e + ' '.repeat(n / 2)),
//     ...prev.map(e => e + ' ' + e),
//   ]
// }
// let o = star(n).join('\n');
// console.log(o);