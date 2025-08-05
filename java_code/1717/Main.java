import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;
import java.util.Arrays;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int[] nm = Arrays.stream(br.readLine().split(" ")).mapToInt(Integer::parseInt).toArray();

        int n = nm[0];
        int m = nm[1];
        int[][] operators = new int[m][3];
        int[] groups = new int[n + 1];

        for (int i = 0; i < m; i++) {
            operators[i] = Arrays.stream(br.readLine().split(" ")).mapToInt(Integer::parseInt).toArray();
        }

        for (int i = 1; i <= n; i++) {
            groups[i] = i;
        }

        for (int[] operator : operators) {
            int a = operator[1];
            int b = operator[2];
            if (operator[0] == 0) {
                // a 집합, b 집합 결합
                union(groups, a, b);
            } else {
                // 같은 집합 여부 출력
                System.out.println(isUnion(groups, a, b) ? "yes" : "no");
            }
        }
    }

    public static int findRoot(int[] groups, int a) {
        if (groups[a] == a)
            return a;

        return findRoot(groups, groups[a]);
    }

    public static boolean isUnion(int[] groups, int a, int b) {
        return findRoot(groups, a) == findRoot(groups, b);
    }

    public static void union(int[] groups, int a, int b) {
        int aRoot = findRoot(groups, a);
        int bRoot = findRoot(groups, b);

        if (aRoot == bRoot)
            return;

        if (aRoot < bRoot) {
            groups[aRoot] = bRoot;
        } else {
            groups[bRoot] = aRoot;
        }
    }
}
