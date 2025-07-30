import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Arrays;

public class Main {
    static class Planet {
        final int index, x, y, z;

        Planet(int index, int x, int y, int z) {
            this.index = index;
            this.x = x;
            this.y = y;
            this.z = z;
        }
    }

    public static void main(String[] args) throws IOException {

        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int n = Integer.parseInt(br.readLine());
        Planet[] planets = new Planet[n];
        ArrayList<int[]> distance = new ArrayList<int[]>();
        int[] tree = new int[n];
        int ternelCount = 0;
        int index = 0;
        int result = 0;

        for (int i = 0; i < n; i++) {
            int[] xyz = Arrays.stream(br.readLine().split(" ")).mapToInt(Integer::parseInt).toArray();
            planets[i] = new Planet(i, xyz[0], xyz[1], xyz[2]);
            tree[i] = i;
        }

        for (int i = 0; i < 3; i++) {
            switch (i) {
                case 0:
                    Arrays.sort(planets, (a, b) -> a.x - b.x);
                    break;
                case 1:
                    Arrays.sort(planets, (a, b) -> a.y - b.y);
                    break;
                case 2:
                    Arrays.sort(planets, (a, b) -> a.z - b.z);
                    break;
            }

            for (int j = 0; j < (n - 1); j++) {
                int num1 = j;
                Planet p1 = planets[num1];
                int num2 = j + 1;
                Planet p2 = planets[num2];
                int oneToTwo = getMinDistance(p1, p2);

                distance.add(new int[] { p1.index, p2.index, oneToTwo });
            }
        }

        distance.sort((a, b) -> a[2] - b[2]);

        while (ternelCount < (n - 1) && index < distance.size()) {
            int[] nnd = distance.get(index);
            int p1 = nnd[0];
            int p2 = nnd[1];
            int d = nnd[2];

            if (!isUnion(tree, p1, p2)) {
                union(tree, p1, p2);
                ternelCount++;
                result += d;
            }

            index++;
        }

        System.out.println(result);
    }

    static private int getMinDistance(Planet p1, Planet p2) {
        return Math.min(
                Math.abs(p1.x - p2.x),
                Math.min(
                        Math.abs(p1.y - p2.y),
                        Math.abs(p1.z - p2.z)));
    }

    static private int findRoot(int[] tree, int n) {
        if (n == tree[n])
            return n;

        return findRoot(tree, tree[n]);
    }

    static private void union(int[] tree, int n1, int n2) {
        int r1 = findRoot(tree, n1);
        int r2 = findRoot(tree, n2);
        if (r1 == r2)
            return;

        if (r1 < r2) {
            tree[r1] = r2;
        } else {
            tree[r2] = r1;
        }

    }

    static private boolean isUnion(int[] tree, int n1, int n2) {
        return findRoot(tree, n1) == findRoot(tree, n2);
    }
}
