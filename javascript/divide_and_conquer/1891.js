const [input, xy] = require("fs").readFileSync("input.txt").toString().split("\n");
// const [input, xy] = require("fs").readFileSync("/dev/stdin").toString().split("\n");

const [d, num] = input.split(" ");
const [x, y] = xy.split(" ").map(Number);

const quadLen = 2 ** d;
const limit = { max: quadLen / 2, min: -(quadLen / 2) }
let answer = '';

function toXY(i, curX, curY, len) {
    if (d == i) { return [curX, curY]; }
    const quad = num[i];
    const distance = len / 4;
    switch (quad) {
        case '1':
            return toXY(i + 1, curX + distance, curY + distance, len / 2);            
        case '2':
            return toXY(i + 1, curX - distance, curY + distance, len / 2);
        case '3':
            return toXY(i + 1, curX - distance, curY - distance, len / 2);
        case '4':
            return toXY(i + 1, curX + distance, curY - distance, len / 2);
    }
}

function toNum(cx, cy, n) {
    if (n < 0) { return [cx, cy] }
    const distance = n / 4;
    if (cx < curX && cy < curY  ) {
        answer += '1';
        return toNum(cx + distance, cy + distance, n / 2);
    }
    if (cx > curX && cy < curY  ) {
        answer += '2';
        return toNum(cx - distance, cy + distance, n / 2);
    }
    if (cx > curX && cy > curY  ) {
        answer += '3';
        return toNum(cx - distance, cy - distance, n / 2);
    }
    if (cx < curX && cy > curY  ) {
        answer += '4';
        return toNum(cx + distance, cy - distance, n / 2);
    }
}

let [curX, curY] = toXY(0, 0, 0, quadLen);

curX += x;
curY += y;

if (limit.max < curX || limit.min > curX || limit.max < curY || limit.min > curY ) {
    console.log(-1);
} else {
    toNum(0, 0, quadLen);
    console.log(answer);
}