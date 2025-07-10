public class SimpleArrays {
    public static void fillArray(int[] arr) {
        for (int i = 0; i < 5; i++) {
            arr[i] = i * 2;
        }
    }
    
    public static void printArray(int[] arr) {
        for (int i = 0; i < 5; i++) {
            System.out.println("arr[" + i + "] = " + arr[i]);
        }
    }
    
    public static void main(String[] args) {
        int[] numbers = new int[5];
        fillArray(numbers);
        printArray(numbers);
        
        int[] values = new int[3];
        values[0] = 10;
        values[1] = 20;
        values[2] = 30;
        
        for (int i = 0; i < 3; i++) {
            System.out.println("values[" + i + "] = " + values[i]);
        }
        
        int sum = 0;
        for (int i = 0; i < 3; i++) {
            sum = sum + values[i];
        }
        System.out.println("Sum: " + sum);
        
        char[] letters = new char[4];
        letters[0] = 'A';
        letters[1] = 'B';
        letters[2] = 'C';
        letters[3] = 'D';
        
        for (int i = 0; i < 4; i++) {
            System.out.println("Letter: " + letters[i]);
        }
    }
}
