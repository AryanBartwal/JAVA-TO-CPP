public class MathOperations {
    public static int factorial(int n) {
        if (n <= 1) {
            return 1;
        }
        int result = 1;
        for (int i = 2; i <= n; i++) {
            result = result * i;
        }
        return result;
    }
    
    public static double power(double base, int exp) {
        double result = 1.0;
        for (int i = 0; i < exp; i++) {
            result = result * base;
        }
        return result;
    }
    
    public static void main(String[] args) {
        int n = 5;
        int fact = factorial(n);
        System.out.println("Factorial of " + n + " is " + fact);
        
        double base = 2.0;
        int exponent = 3;
        double pow = power(base, exponent);
        System.out.println(base + " to the power " + exponent + " is " + pow);
        
        int sum = 0;
        for (int i = 1; i <= 10; i++) {
            sum = sum + i;
        }
        System.out.println("Sum of 1 to 10: " + sum);
        
        int choice = 2;
        switch (choice) {
            case 1:
                System.out.println("Addition selected");
                int a = 5 + 3;
                System.out.println("Result: " + a);
                break;
            case 2:
                System.out.println("Multiplication selected");
                int b = 4 * 6;
                System.out.println("Result: " + b);
                break;
            case 3:
                System.out.println("Subtraction selected");
                int c = 10 - 7;
                System.out.println("Result: " + c);
                break;
            default:
                System.out.println("Invalid choice");
        }
        
        float temperature = 25.5f;
        if (temperature > 30.0f) {
            System.out.println("Hot weather");
        }
        else if (temperature > 20.0f) {
            System.out.println("Pleasant weather");
        }
        else {
            System.out.println("Cold weather");
        }
    }
}
