public class test_array {
    public static void main(String[] args) {
        int[] arr = new int[5];
        for (int i = 0; i < 5; i++) {
            arr[i] = i * 2;
        }
        for (int i = 0; i < 5; i++) {
            System.out.println(arr[i]);
        }
        int[][] mat = new int[2][3];
        for (int i = 0; i < 2; i++) {            for (int j = 0; j < 3; j++) {
                mat[i][j] = i + j;
            }
        }
        for (int i = 0; i < 2; i++) {
            for (int j = 0; j < 3; j++) {
                System.out.println(mat[i][j]);
            }        }
    }
}
