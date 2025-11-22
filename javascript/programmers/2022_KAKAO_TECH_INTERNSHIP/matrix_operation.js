class Node {
    constructor(value) {
        this.value = value;
        this.prev = null;
        this.next = null;
    }
}

class Deque {
    constructor() {
        this.init();
    }

    front() {
        return this.frontNode ? this.frontNode.value : undefined;
    }
    
    rear() {
        return this.rearNode ? this.rearNode.value : undefined;
    }

    init() {
        this.length = 0;
        this.frontNode = null;
        this.rearNode = null;
    }

    shift() {
        if (this.length === 0) return undefined;

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

    unshift(value) {
        const node = new Node(value);

        if (!this.frontNode) {
            this.frontNode = node;
            this.rearNode = node;
        } else {
            this.frontNode.prev = node;
            node.next = this.frontNode;
            this.frontNode = node;
        }

        this.length += 1;
        return this.length;
    }

    pop() {
        if (this.length === 0) return undefined;

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

    push(value) {
        const node = new Node(value);

        if (!this.rearNode) {
            this.rearNode = node;
            this.frontNode = node;
        } else {
            this.rearNode.next = node;
            node.prev = this.rearNode;
            this.rearNode = node;
        }

        this.length += 1;
        return this.length;
    }

    atIndex(index) {
        const node = this.frontNode;
        for (let i = 0; i < index; i++) {
            node = node.next;
        }

        return node.value;
    }

    toArray() {
        const arr = [];
        let node = this.frontNode;
        for (let i = 0; i < this.length; i++) {
            arr.push(node.value);
            node = node.next;
        }

        return arr;
    }
}

function solution(rc, operations) {
    const first = new Deque();
    const centers = new Deque();
    const last = new Deque();

    for (const row of rc) {
        first.push(row[0]);
        last.push(row[row.length - 1]);

        const center = new Deque();
        for (const v of row.slice(1, row.length - 1)) center.push(v);
        centers.push(center);
    }

    const shiftRow = () => {
        first.unshift(first.pop());
        centers.unshift(centers.pop());
        last.unshift(last.pop());
    }

    const rotate = () => {
        centers.front().unshift(first.shift());
        last.unshift(centers.front().pop());
        centers.rear().push(last.pop());
        first.push(centers.rear().shift());
    }

    for (const op of operations) {
        if (op === "Rotate") rotate();
        else if (op === "ShiftRow") shiftRow();
    }

    const firstArr = first.toArray();
    const centerArr = centers.toArray().map((c) => c.toArray());
    const lastArr = last.toArray();
    const answer = [];
    for (let i = 0; i < first.length; i++) {
        answer.push([
            firstArr[i],
            ...centerArr[i],
            lastArr[i],
        ])
    }

    return answer;
}

// [[8, 3, 3], [4, 9, 7], [3, 8, 6]]
console.log(solution([[8, 6, 3], [3, 3, 7], [8, 4, 9]], ["Rotate", "ShiftRow", "ShiftRow"]))
// [[4, 1, 2], [7, 5, 3], [10, 8, 6], [11, 12, 9]]
console.log(solution([[1, 2, 3], [4, 5, 6], [7, 8, 9], [10, 11, 12]], ["Rotate"]))

// 행렬과 연산 (Lv4)
