public class test_working {
    public static void hello() {
        System.out.println("Hello from method!");
        int i=19;
        System.out.println(i);
    }
    public static int add(int a, int b) {
        System.out.println("Adding " + a + " and " + b);
        return a + b;
    }

    public static void main(String[] args) {
        hello();
        int sum = add(10, 20);
        System.out.println("Sum: " + sum);
        System.out.println("Hello, Java!");
        int x = 5;
        char c = 'A';
        float f = 3.14f;
        double d = 2.718;
        x = x * x + 1;
        double y = x * d;
        if (x > 0 && y < 10) {
            x = x - 1;
        } 
        if (x < 0) {
            x = x + 1;
        }
        else if (x == 0) {
            x = 0;
        }
        else {
            x = x + 1;
        }
        System.out.println(x);
        System.out.println(c);
        System.out.println(f);
        System.out.println(d);
        System.out.println(x + y);
        for (int i = 0; i <= 5;i++) {
            System.out.println(i);
        }
        int w = 0;
        while (w < 3) {
            System.out.println(w);
            w = w + 1;
        }
        do {
            w = w - 1;
            System.out.println(w);
        } while (w > 0);
        for (int i = 0; i <= 2; i++) {
            for (int j = 0; j <= 2; j++) {
                for(int k = 0; k <= 2; k++) {
                    System.out.println(i * 100 + j * 10 + k);
                }
                System.out.println(i * 10 + j);
            }
        }
        
        int s = 2;
        switch (s) {
            case 1:
                System.out.println("One");
                System.out.println("First case!");
                int a1 = 5;
                int b1 = 10;
                int sum1 = a1 + b1;
                System.out.println("Sum in case 1: " + sum1);
                break;
            case 2:
                System.out.println("Two");
                System.out.println("Second case!");
                int temp2 = s * 10;
                System.out.println("Temp: " + temp2);
                for (int i2 = 0; i2 < 3; i2++) {
                    System.out.println("Loop in case 2: " + i2);
                }
                break;
            case 3:
                System.out.println("Three");
                System.out.println("Third case!");
                double d3 = 3.14;
                System.out.println("Double in case 3: " + d3);
                if (d3 > 3) {
                    System.out.println("d3 is greater than 3");
                }
                break;
            case 4:
                System.out.println("Four");
                char c4 = 'Z';
                System.out.println("Char in case 4: " + c4);
                break;
            default:
                System.out.println("Other");
                System.out.println("Default case reached.");
                int[] arrD = new int[3];
        }
    }
}
