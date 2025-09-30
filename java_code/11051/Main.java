import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;
import java.util.Arrays;

// 11051 - 이항 계수2
public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int[] nk = Arrays.stream(br.readLine().split(" ")).mapToInt(Integer::parseInt).toArray();
        int n = nk[0];
        int k = nk[1];
        long[][] cache = new long[n + 1][k + 1];
        int MOD = 10007;

        for (int i = 0; i <= n; i++) {
            cache[i][0] = 1;
        }
        for (int i = 0; i <= k; i++) {
            cache[i][i] = 1;
        }

        for (int i = 1; i <= n; i++) {
            for (int j = 1; j <= k; j++) {
                cache[i][j] = cache[i - 1][j] % MOD + cache[i - 1][j - 1] % MOD;
            }
        }

        System.out.println(cache[n][k] % MOD);
    }
}
