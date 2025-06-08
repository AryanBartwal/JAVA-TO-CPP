import java.util.Scanner;
public class test2 {
    public static void inputMarks(int[][] marks, int students, int subjects, Scanner sc) {
        for (int i = 0; i < students; i++) {
            System.out.println("Enter marks for Student " + (i + 1) + ":");
            for (int j = 0; j < subjects; j++) {
                System.out.print("  Subject " + (j + 1) + ": ");
                marks[i][j] = sc.nextInt();
            }
        }
    }
    public static void displayResults(int[][] marks, int students, int subjects) {
        for (int i = 0; i < students; i++) {
            int total = 0;
            boolean fail = false;
            for (int j = 0; j < subjects; j++) {
                total += marks[i][j];
                if (marks[i][j] < 35) {
                    fail = true;
                }
            }
            double avg = total / (double) subjects;
            System.out.print("Student " + (i + 1) + ": Total = " + total + ", Average = " + avg);
            if (fail) {
                System.out.println(" --> Result: FAIL");
            } else {
                if (avg >= 75) {
                    System.out.println(" --> Result: Distinction");
                } else if (avg >= 60) {
                    System.out.println(" --> Result: First Class");
                } else if (avg >= 50) {
                    System.out.println(" --> Result: Second Class");
                } else {
                    System.out.println(" --> Result: Pass");
                }
            }
        }
    }    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int students = 3;
        int subjects = 3;
        int[][] marks = new int[students][subjects];
        inputMarks(marks, students, subjects, sc);
        displayResults(marks, students, subjects);
        sc.close();
    }
}

