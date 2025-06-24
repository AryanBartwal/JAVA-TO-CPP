public class BasicMath {
    public static int add(int x, int y) {
        return x + y;
    }
    
    public static int subtract(int x, int y) {
        return x - y;
    }
    
    public static int multiply(int x, int y) {
        return x * y;
    }
    
    public static void main(String[] args) {
        int a = 15;
        int b = 5;
        
        int sum = add(a, b);
        System.out.println("Sum: " + sum);
        
        int diff = subtract(a, b);
        System.out.println("Difference: " + diff);
        
        int product = multiply(a, b);
        System.out.println("Product: " + product);
        
        for (int i = 1; i <= 5; i++) {
            int square = i * i;
            System.out.println(i + " squared = " + square);
        }
        
        int n = 10;
        while (n > 5) {
            System.out.println("n = " + n);
            n = n - 1;
        }
        
        int choice = 2;
        switch (choice) {
            case 1:
                System.out.println("Case 1");
                break;
            case 2:
                System.out.println("Case 2");
                int temp = choice * 10;
                System.out.println("Temp: " + temp);
                break;
            case 3:
                System.out.println("Case 3");
                break;
            default:
                System.out.println("Default case");
        }
    }
}
