const input = require('fs').readFileSync(process.platform === 'linux' ? '/dev/stdin' : 'input.txt').toString().split("\n");
const sudoku = input.map(line => line.trim().split(/\s+/).map(Number));

const vacancy = [];

const rowUsed = Array.from({ length: 9 }, () => new Array(10).fill(false));
const colUsed = Array.from({ length: 9 }, () => new Array(10).fill(false));
const squareUsed = Array.from({ length: 9 }, () => new Array(10).fill(false));

// 초기 사용 숫자 기록
for (let i = 0; i < 9; i++) {
    for (let j = 0; j < 9; j++) {
        const num = sudoku[i][j];
        if (num !== 0) {
            rowUsed[i][num] = true;
            colUsed[j][num] = true;
            squareUsed[getSquareIndex(i, j)][num] = true;
        } else {
            vacancy.push([i, j]);
        }
    }
}

function getSquareIndex(row, col) {
    return Math.floor(row / 3) * 3 + Math.floor(col / 3);
}

function dfs(depth) {
    if (depth === vacancy.length) {
        return true;
    }

    const [row, col] = vacancy[depth];
    const square = getSquareIndex(row, col);

    for (let num = 1; num <= 9; num++) {
        if (!rowUsed[row][num] && !colUsed[col][num] && !squareUsed[square][num]) {
            sudoku[row][col] = num;
            rowUsed[row][num] = colUsed[col][num] = squareUsed[square][num] = true;

            if (dfs(depth + 1)) return true;

            sudoku[row][col] = 0;
            rowUsed[row][num] = colUsed[col][num] = squareUsed[square][num] = false;
        }
    }

    return false;
}

dfs(0);
console.log(sudoku.map(row => row.join(' ')).join('\n'));

// 스도쿠
