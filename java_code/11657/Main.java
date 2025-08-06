import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.Arrays;
import java.io.IOException;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int[] nm = Arrays.stream(br.readLine().split(" ")).mapToInt(Integer::parseInt).toArray();
        int n = nm[0];
        int m = nm[1];
        int[][] busRoutes = new int[m][3];
        long[] bf = new long[n + 1];
        boolean isCycle = false;

        for (int i = 0; i < m; i++) {
            int[] busRoute = Arrays.stream(br.readLine().split(" ")).mapToInt(Integer::parseInt).toArray();
            busRoutes[i] = busRoute;
        }

        Arrays.sort(busRoutes, (a, b) -> a[0] - b[0]);

        // bf 초기값 셋팅
        for (int i = 2; i <= n; i++) {
            bf[i] = Long.MAX_VALUE;
        }

        for (int i = 0; i <= n; i++) {
            isCycle = bellmanford(i, n, busRoutes, bf);
        }

        if (isCycle) {
            System.out.println(-1);
        } else {
            for (int i = 2; i <= n; i++) {
                System.out.println(bf[i] == Long.MAX_VALUE ? -1 : bf[i]);
            }
        }
    }

    static boolean bellmanford(int i, int n, int[][] busRoutes, long[] bf) {
        for (int[] busRoute : busRoutes) {
            int a = busRoute[0];
            int b = busRoute[1];
            int duration = busRoute[2];

            if (bf[a] != Long.MAX_VALUE && bf[b] > bf[a] + duration) {
                bf[b] = bf[a] + duration;
                if (i == n)
                    return true;
            }
        }

        return false;
    }
}