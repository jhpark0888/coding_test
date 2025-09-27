package java_code.segment_tree;

public class Main {

    static class SegmentTree {
        int[] arr;
        int[] tree;

        SegmentTree(int[] arr) {
            this.arr = arr;
            tree = new int[arr.length * 4];
            build(1, 0, arr.length - 1);
        }

        // 세그먼트 트리 만드는 함수
        // node : 현재 노드
        // start : 배열의 시작 인덱스
        // end : 배열의 끝 인덱스
        void build(int node, int start, int end) {
            if (start == end) {
                tree[node] = arr[start];
                return;
            }

            int mid = (start + end) / 2;
            build(node * 2, start, mid);
            build(node * 2 + 1, mid + 1, end);
            tree[node] = tree[node * 2] + tree[node * 2 + 1];
        }

        // 범위의 합을 구하는 함수
        // node : 현재 노드
        // start : 현재 트리 범위의 시작 인덱스
        // end : 현재 트리 범위의 끝 인덱스
        // targetStart : 목표 범위의 시작 인덱스
        // targetEnd : 목표 범위의 끝 인덱스
        int query(int node, int start, int end, int targetStart, int targetEnd) {
            if (targetEnd < start || targetStart > end)
                return 0;

            if (targetStart <= start && end <= targetEnd)
                return tree[node];

            int mid = (start + end) / 2;
            int leftChild = query(node * 2, start, mid, targetStart, targetEnd);
            int rightChild = query(node * 2 + 1, mid + 1, end, targetStart, targetEnd);

            return leftChild + rightChild;
        }

        // 특정 인덱스의 값을 변경하는 함수
        // 인덱스가 포함된 범위의 합들도 모두 변경됨
        // node : 현재 노드
        // start : 현재 트리 범위의 시작 인덱스
        // end : 현재 트리 범위의 끝 인덱스
        // index : 변경하고자 하는 인덱스
        // val : 변경하고자 하는 값
        void update(int node, int start, int end, int index, int val) {
            if (start == end) {
                tree[node] = val;
                return;
            }

            int mid = (start + end) / 2;
            if (start <= index && index <= mid) {
                update(node * 2, start, mid, index, val);
            } else {
                update(node * 2 + 1, mid + 1, end, index, val);
            }
            tree[node] = tree[node * 2] + tree[node * 2 + 1];
        }
    }

    public static void main(String[] args) {
        int[] arr = { 1, 2, 3, 4, 5 };

        // 세그먼트 트리 생성
        SegmentTree st = new SegmentTree(arr);

        // 2~4 범위의 합 조회 -> 12
        System.out.println(st.query(1, 0, arr.length - 1, 2, 4));
        // 0~4 범위의 합 조회 -> 15
        System.out.println(st.query(1, 0, arr.length - 1, 0, 4));

        // 인덱스 2의 값을 10으로 변경
        st.update(1, 0, st.arr.length - 1, 2, 10);
        // 2~4 범위의 합 조회 -> 19
        System.out.println(st.query(1, 0, arr.length - 1, 2, 4));
    }
}
