// let n = BigInt(require('fs').readFileSync('input.txt').toString().split("\n")[0]);
let n = BigInt(require('fs').readFileSync('/dev/stdin').toString().split("\n")[0]);
let factorial = [BigInt(1)];
let temp = BigInt(1);
let index = BigInt(1);

while (temp <= n) {
    factorial.push(temp);
    index += BigInt(1);
    temp *= index;
}

function solution() {
    if (n === BigInt(0)) { return "NO" }
    
    for (let i = factorial.length - 1; i >= 0; i--) {
        let value = factorial[i];
        if (value <= n) { 
            n -= value;
        }
        if (n === BigInt(0)) { return "YES"; }
    }
    return "NO";
}

console.log(solution());
