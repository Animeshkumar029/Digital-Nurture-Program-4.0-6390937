public class Singleton {

    // Step 1: We create a private static instance of the class
    private static Singleton instance;

    // Step 2: We make the constructor private so that the class cannot be instantiated from outside
    private Singleton() {
        // private constructor
    }

    // Step 3: We provide a public static method to get the instance
    public static synchronized Singleton getInstance() {
        if (instance == null) {
            instance = new Singleton();
        }
        return instance;
    }

    // Example method
    public void showMessage() {
        System.out.println("Hello from Singleton!");
    }
}
