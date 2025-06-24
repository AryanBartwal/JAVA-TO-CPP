public class SimpleCalculator {
    public static int multiply(int a, int b) {
        System.out.println("Multiplying " + a + " and " + b);
        return a * b;
    }
    
    public static double divide(double a, double b) {
        if (b != 0) {
            return a / b;
        }
        return 0;
    }
    
    public static void main(String[] args) {
        int x = 15;
        int y = 3;
        int product = multiply(x, y);
        System.out.println("Product: " + product);
        
        double result = divide(20.0, 4.0);
        System.out.println("Division result: " + result);
        
        for (int i = 1; i <= 5; i++) {
            int square = i * i;
            System.out.println("Square of " + i + " is " + square);
        }
        
        int counter = 0;
        while (counter < 3) {
            System.out.println("Counter: " + counter);
            counter = counter + 1;
        }
    }
}
