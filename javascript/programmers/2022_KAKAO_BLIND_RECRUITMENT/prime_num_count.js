function solution(n, k) {
    let kNum = "";
    
    const isPrime = (num) => {
        if (num < 2) return false;
        
        for (let i = 2; i <= Math.sqrt(num); i++) {
            if (num % i === 0) return false;
        }
        
        return true;
    }
    
    while (n > 0) {
        kNum = String(n % k) + kNum;
        n = Math.floor(n / k);
    }
    
    return kNum.split('0').map((num) => isPrime(num)).filter((v) => v).length;
}

console.log(solution(1000000, 3));

// k진수에서 소수 개수 구하기 (Lv 2)