import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Arrays;

class Solution {
    int n;
    int m;
    int[][] miro;
    boolean[][] isVisited;
    private int[][] directions = { { 1, 0 }, { 0, 1 }, { -1, 0 }, { 0, -1 } };
    ArrayList<int[]> queue = new ArrayList<int[]>(Arrays.asList(new int[] { 0, 0 }));
    ArrayList<Integer> queueValue = new ArrayList<Integer>(Arrays.asList(1));
    int queueIndex = 0;

    public Solution(int n, int m, int[][] miro) {
        this.n = n;
        this.m = m;
        this.miro = miro;
        this.isVisited = new boolean[n][m];
    }

    public int bfs() {
        while (true) {
            int[] target = queue.get(queueIndex);
            int x = target[0];
            int y = target[1];
            int value = queueValue.get(queueIndex);
            if (y == (n - 1) && x == (m - 1)) {
                return value;
            }

            for (int[] d : directions) {
                int tx = x + d[0];
                int ty = y + d[1];
                if (tx < 0 || ty < 0 || tx >= m || ty >= n)
                    continue;
                if (isVisited[ty][tx])
                    continue;
                if (miro[ty][tx] == 0)
                    continue;

                isVisited[ty][tx] = true;
                queue.add(new int[] { tx, ty });
                queueValue.add(value + 1);
            }
            queueIndex += 1;
        }
    }
}

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String[] nm = br.readLine().split(" ");
        int n = Integer.parseInt(nm[0]);
        int m = Integer.parseInt(nm[1]);
        int[][] miro = new int[n][m];

        for (int i = 0; i < n; i++) {
            String line = br.readLine();
            miro[i] = line.chars().map(c -> c - '0').toArray();
        }

        Solution solution = new Solution(n, m, miro);

        System.out.println(solution.bfs());
    }

}
