// const input = require("fs")
//   .readFileSync("input.txt")
//   .toString()
//   .split("\n");
const input = require("fs")
  .readFileSync("/dev/stdin")
  .toString()
  .split("\n");

const [k, n] = input[0].split(" ").map(Number);
const cableArr = input.slice(1).map(Number);

let left = 1;
let right = Math.max(...cableArr);
let result = 0;

while (left <= right) {
  let mid = Math.floor((left + right) / 2);
  let count = 0;
  for (let i = 0; i < k; i++) {
    const cable = cableArr[i];
    count += Math.floor(cable / mid);
  }

  if (count >= n) {
    result = mid 
    left = mid + 1; 
  } else { 
    right = mid - 1; 
  }
}

console.log(result);