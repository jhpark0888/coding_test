const fs = require('fs');
const [n, io, po] = fs.readFileSync(process.platform === 'linux' ? '/dev/stdin' : 'input.txt').toString().split("\n");

const inputInOrder = io.split(" ").map(Number);
const inputPostOrder = po.split(" ").map(Number);

let inOrderIdx = {};
inputInOrder.forEach((val, idx) => {
    inOrderIdx[val] = idx;
});

let answer = "";

function searchRoot(ioStart, ioEnd, poStart, poEnd) {
    if (ioStart > ioEnd || poStart > poEnd) return;

    const root = inputPostOrder[poEnd];
    const rootIdx = inOrderIdx[root];
    
    answer += `${root} `;
    const leftSize = rootIdx - ioStart;

    searchRoot(ioStart, rootIdx - 1, poStart, poStart + leftSize - 1);
    searchRoot(rootIdx + 1, ioEnd, poStart + leftSize, poEnd - 1);
}

searchRoot(0, inputInOrder.length - 1, 0, inputPostOrder.length - 1);

console.log(answer);