public class Singleton {
    
    private static Singleton singleInstance;
    private Singleton() {
        System.out.println("Singleton object created");
    }

    
    public static Singleton getInstance() {
        if (singleInstance == null) {
            singleInstance = new Singleton();
        }
        return singleInstance;
    }

    // Sample method
    public void displayMessage() {
        System.out.println("Welcome to the Singleton pattern!");
    }
}
