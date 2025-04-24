// const input = require("fs").readFileSync("input.txt").toString().split("\n");
const input = require("fs").readFileSync("/dev/stdin").toString().split("\n");

const s = input[0];
const p = input[1];
const kmpTable = Array.from({length: p.length}, () => 0);

function makeTable() {
    let length = 0;
    let pIdx = 1;
    while (pIdx < p.length) {
        if (p[pIdx] === p[length]) {
            length += 1;
            kmpTable[pIdx] = length;
            pIdx += 1;
        } else {
            if (length !== 0) {
                length = kmpTable[length - 1];
            } else {
                kmpTable[pIdx] = 0;
                pIdx += 1;
            }
        }
    }
}

function search() {
    let sIdx = 0;
    let pIdx = 0;
    while (sIdx < s.length) {
        if (s[sIdx] === p[pIdx]) {
            pIdx += 1;
            sIdx += 1;
        } 

        if (pIdx === p.length) {
            return 1;
        } else if (sIdx < s.length && s[sIdx] !== p[pIdx]) {
            if (pIdx !== 0) {
                pIdx = kmpTable[pIdx - 1];
            } else {
                sIdx += 1;
            }
        }
    }

    return 0;
}

makeTable();
console.log(search()); 