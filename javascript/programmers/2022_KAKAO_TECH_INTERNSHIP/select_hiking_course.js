class Node {
    constructor(value) {
        this.prev = null;
        this.next = null;
        this.value = value;
    }
}

class Deque {
    constructor() {
        this.init();
    }
    
    init() {
        this.frontNode = null;
        this.rearNode = null;
        this.length = 0;
    }
    
    unshift(value) {
        const node = new Node(value);
        
        if (this.length === 0) {
            this.frontNode = node;
            this.rearNode = node;
        } else {
            node.next = this.frontNode;
            this.frontNode.prev = node;
            this.frontNode = node;
        }
        
        this.length += 1;
        return this.length;
    }
    
    shift() {
        if (this.length === 0) return null;
        
        const value = this.frontNode.value;
        
        if (this.length === 1) {
            this.init();
        } else {
            this.frontNode = this.frontNode.next;
            this.frontNode.prev = null;
            this.length -= 1;
        }
        
        return value;
    }
    
    push(value) {
        const node = new Node(value);
        
        if (this.length === 0) {
            this.rearNode = node;
            this.frontNode = node;
        } else {
            node.prev = this.rearNode;
            this.rearNode.next = node;
            this.rearNode = node;
        }
        
        this.length += 1;
        return this.length;
    }
    
    pop() {
        if (this.length === 0) return null;
        
        const value = this.rearNode.value;
        
        if (this.length === 1) {
            this.init();
        } else {
            this.rearNode = this.rearNode.prev;
            this.rearNode.next = null;
            this.length -= 1;
        }
        
        return value;
    }
}

function solution(n, paths, gates, summits) {
    const MAX_WEIGHT = 10_000_001;
    const graph = {};
    const dp = Array.from({length: n + 1}, () => MAX_WEIGHT);
    const queue = new Deque();
    dp[0] = 0;
        
    for (const [i, j, w] of paths) {
        if (!graph[i]) graph[i] = [];
        if (!graph[j]) graph[j] = [];
        graph[i].push([j, w]);
        graph[j].push([i, w]);
    }
    
    for (const gate of gates) {
        dp[gate] = 0;
        for (const [next, w] of graph[gate]) queue.push([gate, next, w]);
    }
    
    while (queue.length > 0) {
        const [prev, node, w] = queue.shift();
        const maxW = Math.max(dp[prev], w);
        if (dp[node] <= maxW) continue;
        dp[node] = maxW;
        
        if (gates.includes(node)) continue;
        if (summits.includes(node)) continue;
        for (const [next, nw] of graph[node]) {
            if (prev === next) continue;
            queue.push([node, next, nw]);  
        } 
        
    }
    
    let minIntensity = MAX_WEIGHT;
    let targetSummit = 0;

    for (const summit of summits) {
        const intensity = dp[summit];
        if (intensity <= minIntensity) {
            if (intensity === minIntensity && targetSummit < summit) continue;
            minIntensity = intensity;
            targetSummit = summit
        }        
    }
    
    return [targetSummit, minIntensity];
}

// [3, 4]
console.log(solution(7, [[1, 4, 4], [1, 6, 1], [1, 7, 3], [2, 5, 2], [3, 7, 4], [5, 6, 6]], [1], [2, 3, 4]));

// 등산코스 정하기 (Lv3)