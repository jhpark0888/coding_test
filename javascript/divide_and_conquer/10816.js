// const [n, owned, m, input] = require("fs").readFileSync('input.txt').toString().split("\n");
const [n, owned, m, input] = require("fs").readFileSync('/dev/stdin').toString().split("\n");

let ownedArr = owned.split(" ");
let inputArr = input.split(" ");
let map = new Map();
let answer = [];

for (const num of ownedArr) {
    if (!map.has(num)) map.set(num, 0); 
    map.set(num, map.get(num) + 1);
}

for (const num of inputArr) {
    let count = map.get(num);
    count = count === undefined ? 0 : count;
    answer += `${count} `;
}

console.log(answer);

// function binarySearch(target) {
//     let left = 0;
//     let right = ownedArr.length - 1;
//     let targetIdx = -1;

//     while (left <= right) {
//         let mid = Math.floor((left + right) / 2);
//         const midNum = ownedArr[mid];

//         if (target === midNum) {
//             targetIdx = mid;
//             break
//         }

//         if (target > midNum) {
//             left = mid + 1;
//         } else {
//             right = mid - 1;
//         }
//     }

//     return targetIdx
// }

// function countNum(target, targetIdx) {
//     let start = targetIdx - 1;
//     let end = targetIdx + 1;
//     let count = 1;

//     while (start >= 0 && ownedArr[start] === target) {
//         start -= 1;
//         count += 1;
//     }
    
//     while (end <= ownedArr.length && ownedArr[end] === target) {
//         end += 1;
//         count += 1;
//     }

//     return count;
// }

// for (let num of inputArr) {
//     let targetIdx = binarySearch(num);
//     if (targetIdx === -1) {
//         answer.push(0);
//         continue;
//     }
    
//     answer.push(countNum(num, targetIdx));
// }

// console.log(answer.join(" "));
