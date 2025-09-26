import java.io.*;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int t = Integer.parseInt(br.readLine());

        for (int i = 0; i < t; i++) {
            int time = Integer.parseInt(br.readLine());
            System.out.println(time % 25 < 17 ? "ONLINE" : "OFFLINE");
        }
    }
}
// 민규의 서카디안 리듬 34400