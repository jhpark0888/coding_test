import java.io.*;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String str = br.readLine().toUpperCase();
        int[] count = new int[26];
        char result = '?';

        for (char c : str.toCharArray()) {
            count[c - 'A']++;
        }

        int max = 0;
        for (int i = 0; i < 26; i++) {
            if (count[i] > max) {
                result = (char) ('A' + i);
                max = count[i];
            } else if (count[i] == max) {
                result = '?';
            }
        }

        System.out.println(result);
    }

}
// 단어 공부