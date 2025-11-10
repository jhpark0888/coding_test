function solution(edges, target) {
    const answer = [];
    const tree = Array.from({length: target.length + 1}, () => []);
    const passedNodeCount = Array(target.length + 1).fill(0);
    const counts = Array(target.length + 1).fill(0);
    const leafOrder = [];
    target.unshift(0);
    
    for (const [p, c] of edges) tree[p].push(c);
    for (let i = 1; i < tree.length; i++) tree[i].sort((a, b) => a - b);
    
    const findLeaf = (num) => {
        const childrenCount = tree[num].length;
        if (childrenCount === 0) return num;

        const child = tree[num][passedNodeCount[num] % childrenCount];
        passedNodeCount[num] += 1;

        return findLeaf(child);
    }
    
    while (true) {
        const leaf = findLeaf(1);
        if (counts[leaf] + 1 > target[leaf]) return [-1];
        counts[leaf] += 1;
        leafOrder.push(leaf);
        if (counts.every((v, i) => {
            const t = target[i];
            return v <= t &&  t <= v * 3;
        })) break;
    }
    
    for (const leaf of leafOrder) {
        for (let i = 1; i <= 3; i++) {
            const t = target[leaf] - i;
            const c = counts[leaf] - 1;
            if (c <= t && t <= c * 3) {
                target[leaf] -= i;
                counts[leaf] -= 1;
                answer.push(i);
                break;
            }
        }
    }
    
    return answer;
}

console.log(solution([[2, 4], [1, 2], [6, 8], [1, 3], [5, 7], [2, 5], [3, 6], [6, 10], [6, 9]],	[0, 0, 0, 3, 0, 0, 5, 1, 2, 3]));
console.log(solution([[1, 2], [1, 3]], [0, 7, 3]));
console.log(solution([[1, 2], [1, 3]], [0, 7, 1]));

// 1,2,3 떨어트리기 (Lv4)
