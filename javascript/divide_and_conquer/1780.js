// const input = require("fs").readFileSync("input.txt").toString().split("\n");
const input = require("fs").readFileSync("/dev/stdin").toString().split("\n");

const n = input[0];
const paper = input.slice(1).map((row) => row.split(" ").map(Number));
let answer = [0,0,0]; // -1,0,1

function checkSame(x, y, size) {
    const first = paper[y][x];
    for (let dy = 0; dy < size; dy++) {
        for (let dx = 0; dx < size; dx++) {
            if (paper[y + dy][x + dx] !== first) { return; }
        }
    }

    answer[first + 1] += 1;
    return true;
}

function dividePaper(x, y, size) {
    if (checkSame(x, y, size)) { return }

    let subSize = size / 3;
    for (let i = 0; i < 3; i++) {
        for (let j = 0; j < 3; j++) {
            dividePaper(x + i * subSize, y + j * subSize, subSize);
        }
    }
}

dividePaper(0, 0, n);

for (const ans of answer) {
    console.log(ans);
}