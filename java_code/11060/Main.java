import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.Arrays;
import java.io.IOException;

// 11060. 점프 점프
public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int n = Integer.parseInt(br.readLine());
        int[] miro = Arrays.stream(br.readLine().split(" ")).mapToInt(Integer::parseInt).toArray();
        int[] dp = new int[n];
        dp[0] = 0;
        final int MAX_VALUE = 1000;

        for (int i = 1; i < n; i++) {
            dp[i] = MAX_VALUE;
            for (int j = 0; j < i; j++) {
                if (i <= j + miro[j])
                    dp[i] = Math.min(dp[i], dp[j] + 1);
            }
        }

        System.out.println(dp[n - 1] == MAX_VALUE ? -1 : dp[n - 1]);
    }

}