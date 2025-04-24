const [nm, a, b] = require("fs").readFileSync("input.txt").toString().split("\n");
// const [nm, a, b] = require("fs").readFileSync("/dev/stdin").toString().split("\n");

let arr = (a + " " + b).split(" ").map(Number);
arr.sort((a,b) => a - b);
console.log(arr.join(" "));
