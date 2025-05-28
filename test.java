public class test {
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
                break;
            case 2:
                System.out.println("Two");
                break;
            case 3:
                System.out.println("Three");
                break;
            default:
                System.out.println("Other");
        }
    }
}

