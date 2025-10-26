// N : 동전 갯수
// Cards : 각 동전의 가격이 담긴 배열
// K : 지폐로 바꿀 가격
function solution(N, Cards, K) {
    let answer = 0;
    const dp = Array.from({ length: K + 1 }, () => []);
    const cardCount = Array.from({ length: K + 1 }, () => 0);

    for (const card of Cards) {
        dp[card].push([card]);
        cardCount[card]++;
    }

    for (let i = 1; i <= K; i++) {
        for (let j = 1; j < i / 2; j++) {
            if (!dp[j] || !dp[i - j]) continue;
            const counts = Array.from(cardCount);
            for (const a of dp[j]) {
                next:
                for (const b of dp[i - j]) {
                    const cards = [...a, ...b];
                    for (const card of cards) {
                        if (counts[card] <= 0) continue next;
                        counts[card] -= 1;
                    }
                    dp[i].push(cards);
                }
            }
        }
    }

    console.log(dp);

    return dp[K].length;
}

console.log(solution(5, [6, 3, 2, 2, 2], 10));
// 고장난 자판기
// 자판기가 고장나 거스름돈이 나오지 않는다. 원하는 지폐에 맞게 동전을 넣어서 손해를 보지 않도록 할 때 최대 뽑을 수 있는 지폐의 갯수를 구하세요

// 테스트 케이스
// 5, [3, 7, 2, 4, 4], 10 -> 2
// 5, [6, 3, 2, 2, 2], 10 -> 1