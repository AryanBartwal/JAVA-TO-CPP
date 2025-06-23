public class ArrayTestDefault {
    public static void main(String[] args) {
        int s = 99;  // This will trigger the default case
        switch (s) {
            case 1:
                System.out.println("One");
                break;
            case 2:
                System.out.println("Two");
                break;
            default:
                System.out.println("Other");
                System.out.println("Default case reached.");
                int[] arrD = new int[3];
                for (int iD = 0; iD < 3; iD++) {
                    arrD[iD] = iD * 2;
                }
                for (int iD = 0; iD < 3; iD++) {
                    System.out.println("arrD[" + iD + "] = " + arrD[iD]);
                }
        }
    }
}
