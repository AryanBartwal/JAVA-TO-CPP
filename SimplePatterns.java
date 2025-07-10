public class SimplePatterns {
    public static void printStars(int count) {
        for (int i = 0; i < count; i++) {
            System.out.println("*");
        }
    }
    
    public static void countDown(int start) {
        while (start > 0) {
            System.out.println("Countdown: " + start);
            start = start - 1;
        }
        System.out.println("Done!");
    }
    
    public static void main(String[] args) {
        printStars(3);
        countDown(5);
        
        int value = 15;
        if (value > 10) {
            System.out.println("Value is greater than 10");
            if (value > 20) {
                System.out.println("Value is also greater than 20");
            }
            else {
                System.out.println("Value is between 10 and 20");
            }
        }
        
        char grade = 'B';
        switch (grade) {
            case 'A':
                System.out.println("Excellent");
                break;
            case 'B':
                System.out.println("Good");
                break;
            case 'C':
                System.out.println("Average");
                break;
            default:
                System.out.println("Needs improvement");
        }
        
        double price = 99.99;
        System.out.println("Price: " + price);
        
        int counter = 0;
        do {
            System.out.println("Do-while loop: " + counter);
            counter = counter + 1;
        } while (counter < 2);
        
        boolean flag = true;
        if (flag) {
            System.out.println("Flag is true");
        }
        else {
            System.out.println("Flag is false");
        }
    }
}
