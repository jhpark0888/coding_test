import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int n = Integer.parseInt(br.readLine());
        char[][] board = new char[n][n];
        int[][] d = { { 1, 0 }, { 0, 1 } };

        for (int i = 0; i < n; i++) {
            String line = br.readLine();
            for (int j = 0; j < n; j++) {
                board[i][j] = line.charAt(j);
            }
        }

        int result = checkBomboni(board, n);
        for (int y = 0; y < n; y++) {
            for (int x = 0; x < n; x++) {
                for (int k = 0; k < d.length; k++) {
                    int dy = d[k][0];
                    int dx = d[k][1];
                    if (y + dy >= n || x + dx >= n)
                        continue;

                    swapCandy(board, x, y, x + dx, y + dy);
                    result = Math.max(result, checkBomboni(board, n));
                    swapCandy(board, x + dx, y + dy, x, y);
                }
            }
        }

        System.out.println(result);
    }

    public static int checkBomboni(char[][] board, int n) {
        int maxCount = 1;

        for (int i = 0; i < n; i++) {
            int rowCount = 1;
            int colCount = 1;
            for (int j = 1; j < n; j++) {
                if (board[i][j] == board[i][j - 1]) {
                    rowCount += 1;
                } else {
                    maxCount = Math.max(maxCount, rowCount);
                    rowCount = 1;
                }

                if (board[j][i] == board[j - 1][i]) {
                    colCount += 1;
                } else {
                    maxCount = Math.max(maxCount, colCount);
                    colCount = 1;
                }
            }

            maxCount = Math.max(maxCount, Math.max(rowCount, colCount));
        }

        return maxCount;
    }

    public static void swapCandy(char[][] board, int x, int y, int dx, int dy) {
        char temp = board[y][x];
        board[y][x] = board[dy][dx];
        board[dy][dx] = temp;
    }
}

// 사탕 게임