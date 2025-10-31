function solution(numbers) {
    var answer = [];
    
    const isPossible = (binary) => {
        if (binary.length === 1) return Number(binary);
        
        const midIndex = Math.floor(binary.length / 2);
        const root = Number(binary.charAt(midIndex));
        const left = binary.slice(0, midIndex);
        const right = binary.slice(midIndex + 1);
        const leftIsPossible = isPossible(left);
        const rightIsPossible = isPossible(right);
        if (leftIsPossible === -1 || rightIsPossible === -1) return -1;
        if (root === 0 && leftIsPossible === 0 && rightIsPossible === 0 ) return 0;
        if (root === 0) return -1;
        return 1;
    }
    
    const toBinaryTree = (num) => {
        let binary = num.toString(2);
        let length = 2;
        while (binary.length > length - 1) length *= 2;
        while (binary.length < length - 1) binary = "0" + binary;
        
        return isPossible(binary) === -1 ? 0 : 1;
    }
    
    for (const num of numbers) {
        answer.push(toBinaryTree(num));
    }
    
    return answer;
}

console.log(solution([7, 42, 5]));

// 표현 가능한 이진트리 (Lv3)