let [t, ...input] = require('fs').readFileSync('input.txt').toString().split('\n');
// let [t, ...input] = require('fs').readFileSync('/dev/stdin').toString().split('\n');

for (let i = 0; i < t; i++) {
    const str = input[i];
    let temp = [];
    for (const word of str.split(" ")) {
        temp.push(word.split("").reverse().join(""))
    }
    console.log(temp.join(" "))
}