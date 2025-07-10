public class ControlFlow {
    public static void checkNumber(int num) {
        if (num > 0) {
            System.out.println("Positive number");
        }
        else if (num < 0) {
            System.out.println("Negative number");
        }
        else {
            System.out.println("Zero");
        }
    }
      public static void main(String[] args) {
        checkNumber(5);
        checkNumber(3);
        checkNumber(0);
        
        for (int i = 0; i < 3; i++) {
            for (int j = 0; j < 2; j++) {
                System.out.println("i=" + i + ", j=" + j);
            }
        }
        
        int count = 0;
        do {
            System.out.println("Count: " + count);
            count = count + 1;
        } while (count < 3);
        
        char grade = 'A';
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
                System.out.println("Poor");
        }
          float pi = 3.14f;
        double e = 2.718;
        System.out.println("Pi: " + pi);
        System.out.println("E: " + e);
        
        int flag = 1;
        if (flag > 0) {
            System.out.println("Flag is positive");
        }
    }
}
