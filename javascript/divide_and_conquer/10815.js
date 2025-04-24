const [n, owned, m, input] = require("fs").readFileSync("input.txt").toString().split("\n");
// const [n, owned, m, input] = require("fs").readFileSync("/dev/stdin").toString().split("\n");

const ownedArr = new Set(owned.split(" ").map(Number));
let result = input.split(" ").map(Number).map((value) => ownedArr.has(value) ? 1 : 0);

console.log(result.join(" "))