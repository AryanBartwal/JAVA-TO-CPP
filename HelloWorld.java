public class HelloWorld {
    public static void main(String[] args) {
        int x = 5;
        int y;
        y = x + 10;
        if (y > 10) {
            System.out.println("y is greater than 10");
        } else {
            System.out.println("y is 10 or less");
        }
        while (x < 10) {
            x = x + 1;
        }
        for (int i = 0; i < 3; i = i + 1) {
            System.out.println("i: " + i);
        }
        do {
            y = y - 1;
        } while (y > 0);
    }
}
