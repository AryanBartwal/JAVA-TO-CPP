public class ConditionalTest {
    public static boolean isEven(int n) {
        if (n % 2 == 0) {
            return true;
        }
        return false;
    }
    
    public static void checkGrade(int score) {
        if (score >= 90) {
            System.out.println("Grade A");
        }
        else if (score >= 80) {
            System.out.println("Grade B");
        }
        else if (score >= 70) {
            System.out.println("Grade C");
        }
        else {
            System.out.println("Grade F");
        }
    }
    
    public static void main(String[] args) {
        int num = 8;
        boolean even = isEven(num);
        System.out.println(num + " is even: " + even);
        
        checkGrade(85);
        checkGrade(95);
        checkGrade(65);
        
        int day = 3;
        switch (day) {
            case 1:
                System.out.println("Monday");
                break;
            case 2:
                System.out.println("Tuesday");
                break;
            case 3:
                System.out.println("Wednesday");
                break;
            case 4:
                System.out.println("Thursday");
                break;
            case 5:
                System.out.println("Friday");
                break;
            default:
                System.out.println("Weekend");
        }
        
        int x = 10;
        int y = 20;
        if (x < y && y > 15) {
            System.out.println("Both conditions true");
        }
    }
}
