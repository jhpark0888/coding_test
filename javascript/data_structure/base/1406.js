// let [s, n, ...input] = require('fs').readFileSync('input.txt').toString().split('\n');
let [s, n, ...input] = require('fs').readFileSync('/dev/stdin').toString().split('\n');
let left = s.split("");
let right = [];
    
for (let i = 0; i < n; i++) {
    const c = input[i];
    const command = c[0];
    
    switch (command) {
        case "L":
            if (left.length > 0) { right.push(left.pop()); }
            break
        case "D":
            if (right.length > 0) { left.push(right.pop()); }
            break
        case "B":
            if (left.length > 0) { left.pop(); }
            break
        case "P":
            left.push(c[2]);
            break
    }
}

console.log(left.join("") + right.reverse().join(""));