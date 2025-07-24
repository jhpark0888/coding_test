import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Main {
    public static void main(String[] args) {
        try {
            BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
            String[] nm = br.readLine().split(" ");
            int n = Integer.parseInt(nm[0]);
            int m = Integer.parseInt(nm[1]);
            char[][] grid = new char[n][m];
            char[][] temp = new char[n][m];
            int[][] d = { { 0, 1 }, { 1, 0 }, { -1, 0 }, { 0, -1 } };
            int result = 0;

            for (int i = 0; i < n; i++) {
                String line = br.readLine();
                grid[i] = line.toCharArray();
            }

            for (int i = 0; i < n; i++) {
                for (int j = 0; j < m; j++) {
                    if (grid[i][j] != '#')
                        continue;

                    // temp 초기화
                    for (int k = 0; k < n; k++) {
                        for (int l = 0; l < m; l++) {
                            temp[k][l] = grid[k][l];
                        }
                    }

                    int size = 0;
                    most: while (true) {
                        for (int k = 0; k < d.length; k++) {
                            int cx = j + d[k][0] * size;
                            int cy = i + d[k][1] * size;
                            if (cx < 0 || cy < 0 || cx >= m || cy >= n || temp[cy][cx] != '#')
                                break most;
                            if (size != 0)
                                temp[cy][cx] = '.';
                        }

                        for (int k = 0; k < n; k++) {
                            for (int l = 0; l < m; l++) {

                                if (temp[k][l] != '#')
                                    continue;

                                int secondSize = 0;
                                secondMost: while (true) {
                                    for (int o = 0; o < d.length; o++) {
                                        int cx = l + d[o][0] * secondSize;
                                        int cy = k + d[o][1] * secondSize;
                                        if (cx < 0 || cy < 0 || cx >= m || cy >= n || temp[cy][cx] != '#')
                                            break secondMost;
                                    }

                                    result = Math.max(result, (size * 4 + 1) * (secondSize * 4 + 1));
                                    secondSize += 1;
                                }
                            }
                        }
                        size += 1;
                    }
                }
            }

            System.out.println(result);
        } catch (IOException e) {

        }
    }
}
