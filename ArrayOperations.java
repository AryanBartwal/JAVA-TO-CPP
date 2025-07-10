public class ArrayOperations {
    public static void printArray(int[] arr) {
        System.out.println("Array elements:");
        for (int i = 0; i < 5; i++) {
            System.out.println("arr[" + i + "] = " + arr[i]);
        }
    }
    
    public static int findMax(int[] numbers) {
        int max = numbers[0];
        for (int i = 1; i < 5; i++) {
            if (numbers[i] > max) {
                max = numbers[i];
            }
        }
        return max;
    }
    
    public static void main(String[] args) {
        int[] data = new int[5];
        for (int i = 0; i < 5; i++) {
            data[i] = i * 3 + 1;
        }
        
        printArray(data);
          int maximum = findMax(data);
        System.out.println("Maximum value: " + maximum);
        
        int[] values = new int[4];
        values[0] = 10;
        values[1] = 20;
        values[2] = 30;
        values[3] = 40;
        
        System.out.println("Values:");
        for (int i = 0; i < 4; i++) {
            System.out.println("values[" + i + "] = " + values[i]);
        }
        
        char[] letters = new char[3];
        letters[0] = 'X';
        letters[1] = 'Y';
        letters[2] = 'Z';
        
        for (int i = 0; i < 3; i++) {
            System.out.println("Letter " + i + ": " + letters[i]);
        }
    }
}
