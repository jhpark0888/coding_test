// const n = parseInt(require("fs").readFileSync("input.txt").toString());
const n = parseInt(require("fs").readFileSync("/dev/stdin").toString());
let answer = Array.from({length: n}, () => "");

function setStar(n, index) {
    if (n === 1) {
        answer[index] += "*"
        return;
    }

    for (let i = 0; i < 9; i++) {
        // 중간 순서
        if (i === 4) {
            setVacancy(n / 3, index + (n / 3));
            continue;
        }

        const nextN = n / 3;
        setStar(nextN, index + nextN * Math.floor(i / 3));
    }
}

function setVacancy(n, index) {
    let str = "";
    for (let i = 0; i < n; i++) str += " ";

    for (let i = 0; i < n; i++) {
        answer[index + i] += str;
    }
}

setStar(n, 0);

for (const row of answer) console.log(row);