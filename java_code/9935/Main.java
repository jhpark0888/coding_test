import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Main {
    public static void main(String[] args) {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        try {
            StringBuilder str = new StringBuilder(br.readLine());
            StringBuilder stack = new StringBuilder();
            String pattern = br.readLine();

            for (int i = 0; i < str.length(); i++) {
                char current = str.charAt(i);
                boolean matched = true;
                stack.append(current);
                int startIndex = stack.length() - pattern.length();

                if (stack.length() < pattern.length())
                    continue;

                for (int j = 0; j < pattern.length(); j++) {
                    if (stack.charAt(startIndex + j) != pattern.charAt(j)) {
                        matched = false;
                        break;
                    }
                }

                if (matched)
                    stack.replace(startIndex, stack.length(), "");
            }

            System.out.println(stack.length() == 0 ? "FRULA" : stack);
        } catch (IOException e) {
        }
    }
}
