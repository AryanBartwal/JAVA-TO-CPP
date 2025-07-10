public class CleanArrays {
    public static void fillNumbers(int[] arr) {
        for (int i = 0; i < 4; i++) {
            arr[i] = i + 10;
        }
    }
    
    public static void showNumbers(int[] arr) {
        for (int i = 0; i < 4; i++) {
            System.out.println("arr[" + i + "] = " + arr[i]);
        }
    }
    
    public static void main(String[] args) {
        int[] numbers = new int[4];
        fillNumbers(numbers);
        showNumbers(numbers);
        
        char[] chars = new char[3];
        chars[0] = 'A';
        chars[1] = 'B';
        chars[2] = 'C';
        
        for (int i = 0; i < 3; i++) {
            System.out.println("char[" + i + "] = " + chars[i]);
        }
        
        int sum = 0;
        for (int i = 0; i < 4; i++) {
            sum = sum + numbers[i];
        }
        System.out.println("Sum: " + sum);
    }
}
