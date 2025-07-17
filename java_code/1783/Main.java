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
            int result = 0;

            if (n == 1) {
                result = 1;
            } else if (n == 2) {
                result = Math.min(4, (m - 1) / 2 + 1);
            } else {
                if (m < 7) {
                    result = Math.min(4, m);
                } else {
                    result = m - 2;
                }
            }

            System.out.println(result);
        } catch (IOException e) {
            System.out.println(e);
        }
    }
}
