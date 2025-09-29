import java.io.*;
import java.util.*;

public class Main {

    static class Pair {
        long t;
        int a;

        Pair(long t, int a) {
            this.t = t;
            this.a = a;
        }
    }

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int[] NPK = Arrays.stream(br.readLine().split(" ")).mapToInt(Integer::parseInt).toArray();
        int N = NPK[0];
        int P = NPK[1];
        int K = NPK[2];

        Pair[] arr = new Pair[N];
        boolean[] boarded = new boolean[N];
        long[] T = new long[N];
        int[] A = new int[N];
        long result = 0;

        // 인원 수 별로 먼저 온 그룹의 인덱스를 저장하는 덱
        @SuppressWarnings("unchecked")
        ArrayDeque<Integer>[] deques = new ArrayDeque[K + 1];
        for (int i = 0; i <= K; i++) {
            deques[i] = new ArrayDeque<Integer>();
        }

        for (int i = 0; i < N; i++) {
            int[] group = Arrays.stream(br.readLine().split(" ")).mapToInt(Integer::parseInt).toArray();
            arr[i] = new Pair((long) group[0], group[1]);
            boarded[i] = false;
        }

        Arrays.sort(arr, (a, b) -> Long.compare(a.t, b.t));

        for (int i = 0; i < N; i++) {
            Pair pair = arr[i];
            T[i] = pair.t;
            A[i] = pair.a;
            deques[pair.a].offerLast(i);
        }

        long boardedCnt = 0; // 탑승한 그룹 수
        long cur = 0; // 현재 시간
        int idx = 0;
        while (boardedCnt < N) {
            int capacity = K;
            if (boarded[idx]) {
                idx++;
                continue;
            }

            Pair pair = arr[idx];
            if (pair.t > cur) {
                long r = pair.t % P;
                cur = (r == 0) ? pair.t : pair.t + (P - r);
            }

            boardedCnt += 1;
            capacity -= pair.a;
            boarded[idx] = true;
            result += cur - pair.t;
            deques[pair.a].removeFirst();

            while (capacity > 0) {
                int bestIdx = -1;
                int bestA = -1;
                for (int i = 1; i <= capacity; i++) {
                    if (deques[i].isEmpty())
                        continue;

                    int dqIdx = deques[i].peekFirst();
                    long t = T[dqIdx];
                    if (cur < t)
                        continue;

                    if (bestIdx == -1) {
                        bestIdx = dqIdx;
                        bestA = i;
                    } else {
                        if (bestIdx > dqIdx) {
                            bestIdx = dqIdx;
                            bestA = i;
                        }
                    }
                }

                if (bestIdx == -1)
                    break;

                deques[bestA].removeFirst();
                boardedCnt += 1;
                capacity -= bestA;
                boarded[bestIdx] = true;
                result += cur - T[bestIdx];
            }

            cur += P;
            idx++;
        }

        System.out.println(result);
    }
}
// 놀이기구 줄서기 34401