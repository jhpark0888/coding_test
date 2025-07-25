import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;

public class Main {
    public static class Line {
        int start;
        int end;
        int weight;

        public Line(int start, int end, int weight) {
            this.start = start;
            this.end = end;
            this.weight = weight;
        }
    }

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int[] ve = Arrays.stream(br.readLine().split(" ")).mapToInt(Integer::parseInt).toArray();
        int v = ve[0];
        int e = ve[1];
        int[] tree = new int[v + 1];
        ArrayList<Line> lines = new ArrayList<Line>();
        int result = 0;

        for (int i = 0; i < e; i++) {
            int[] line = Arrays.stream(br.readLine().split(" ")).mapToInt(Integer::parseInt).toArray();
            int start = line[0];
            int end = line[1];
            int weight = line[2];

            lines.add(new Line(start, end, weight));
        }

        for (int i = 0; i <= v; i++) {
            tree[i] = i;
        }

        lines.sort((a, b) -> a.weight - b.weight);

        for (Line line : lines) {
            if (isUnion(tree, line.start, line.end))
                continue;

            union(tree, line.start, line.end);
            result += line.weight;
        }

        System.out.println(result);
    }

    public static int findRoot(int[] tree, int num) {
        if (tree[num] == num)
            return num;

        return findRoot(tree, tree[num]);
    }

    public static boolean isUnion(int[] tree, int num1, int num2) {
        int x = findRoot(tree, num1);
        int y = findRoot(tree, num2);

        return x == y;
    }

    public static void union(int[] tree, int num1, int num2) {
        int x = findRoot(tree, num1);
        int y = findRoot(tree, num2);

        if (x == y)
            return;

        if (x < y) {
            tree[x] = y;
        } else {
            tree[y] = x;
        }

    }
}