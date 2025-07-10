public class LoopExamples {
    public static void printNumbers() {
        System.out.println("Printing numbers:");
        for (int i = 0; i < 5; i++) {
            System.out.println(i);
        }
    }
    
    public static void main(String[] args) {
        printNumbers();
        
        int j = 10;
        while (j > 5) {
            System.out.println("j = " + j);
            j = j - 1;
        }
        
        int k = 1;
        do {
            System.out.println("k = " + k);
            k = k + 1;
        } while (k <= 3);
        
        for (int row = 1; row <= 3; row++) {
            for (int col = 1; col <= 3; col++) {
                System.out.println("Row: " + row + ", Col: " + col);
            }
        }
        
        char letter = 'A';
        System.out.println("Letter: " + letter);
        
        float pi = 3.14159f;
        double e = 2.71828;
        System.out.println("Pi: " + pi);
        System.out.println("E: " + e);
    }
}
