import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;
import java.util.Arrays;

// 11050 - 이항 계수1
public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int[] nk = Arrays.stream(br.readLine().split(" ")).mapToInt(Integer::parseInt).toArray();
        int n = nk[0];
        int k = nk[1];
        int numerator = 1;
        int denominator = 1;

        for (int i = 0; i < k; i++) {
            numerator *= n - i;
        }
        for (int i = k; i > 1; i--) {
            denominator *= i;
        }

        System.out.println((int) (numerator / denominator));
    }
}
