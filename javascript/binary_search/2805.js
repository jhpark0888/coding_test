const fs = require('fs');
const [nm, inputTrees] = fs.readFileSync(process.platform === 'linux' ? '/dev/stdin' : 'input.txt').toString().split("\n");

const [n, m] = nm.split(' ').map(Number);
const trees = inputTrees.split(" ").map(Number);

let left = 1;
let right = Math.max.apply(null, trees);
let result = 0;

while (left <= right) {
    let mid = Math.floor((left + right) / 2);
    
    const length = trees.reduce((p, c) => p + Math.max(0, c - mid), 0);
    
    if (length >= m) {
        result = mid;
        left = mid + 1;
    } else {
        right = mid - 1;
    }
}

console.log(result);