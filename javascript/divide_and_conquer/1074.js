const [n, r, c] = require("fs").readFileSync("input.txt").toString().split(" ").map(Number);
// const [n, r, c] = require("fs").readFileSync("/dev/stdin").toString().split(" ").map(Number);

function solution(n, r, c, index) {
    if (n == 1) { return index + r * 2 + c }
    const length = 2 ** n;
    const quadrant = length / 2;
    let value = 0;
    let nextR = r;
    let nextC = c;
    
    if ( r >= quadrant) {
        value += 2;
        nextR -= quadrant;
    }

    if ( c >= quadrant) {
        value += 1;
        nextC -= quadrant
    }

    return solution(n - 1, nextR, nextC, index + quadrant ** 2 * value);
}

console.log(solution(n, r, c, 0));