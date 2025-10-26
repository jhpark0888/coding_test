function solution(N) {
    const target = Math.ceil(N / 2);
    let start = 1;
    let end = target - 1;
    let k = Math.floor((start + end) / 2);
    let n = N;
    let a = 0;

    while (start !== end) {
        if (n === 0) {
            if (a >= target) end = k - 1;
            else start = k + 1;
            n = N;
            k = Math.ceil((start + end) / 2);
            a = 0;
        }

        const aAmount = Math.min(k, n);
        n -= aAmount;
        n -= Math.floor(n / 10);
        a += aAmount;
    }

    return k + 1;
}

console.log(solution(41));

// 돈가스 나눠먹기
// 순서대로 a는 k만큼 먹고 b는 10으로 나눈 몫만큼 먹을 때 a가 절반 이상을 먹는 k의 최소값

// 테스트 케이스
// 327 13
// 41 2