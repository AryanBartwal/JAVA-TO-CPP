public class test {
    public static void main(String[] args) {
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
                System.out.println(i * 10 + j);
            }
        }
        for (int i = 0; i < 2; i++) {
            int ww = 0;
            while (ww < 2) {
                do {
                    System.out.println(i * 100 + ww);
                    ww++;
                } while (ww < 1);
                ww++;
            }
        }
    }
}

