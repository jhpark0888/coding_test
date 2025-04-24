const fs = require('fs');
const [nk] = fs.readFileSync(process.platform === 'linux' ? '/dev/stdin' : 'input.txt').toString().split("\n");

let [n, k] = nk.split(' ').map(Number);

let result = '-1';
let digit = 1;
let count = 9;

while (digit * count < k) {
    k -= digit * count;
    digit += 1;
    count *= 10;
}

const number = Math.pow(10, digit - 1) + Math.floor((k - 1) / digit);

if (number <= n) {
    result = number.toString().charAt((k - 1) % digit);
} 

console.log(result);