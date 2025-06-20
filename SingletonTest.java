public class SingletonTest {
    public static void main(String[] args) {
        // Retrieving the Singleton instance
        Singleton obj1 = Singleton.getInstance();
        Singleton obj2 = Singleton.getInstance();

        // Calling a method on the instance
        obj1.displayMessage();

        // Verifying both references point to the same object
        if (obj1 == obj2) {
            System.out.println("Both references point to the same Singleton instance.");
        } else {
            System.out.println("Different instances exist (not a Singleton).");
        }
    }
}
