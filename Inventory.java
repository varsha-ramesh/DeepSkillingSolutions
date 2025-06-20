import java.util.HashMap;

public class Inventory {
    private HashMap<Integer, Product> inventory;

    public Inventory() {
        inventory = new HashMap<>();
    }

    // Add product
    public void addProduct(Product product) {
        inventory.put(product.getProductId(), product);
    }

    // Update product
    public void updateProduct(int productId, int newQty, double newPrice) {
        Product product = inventory.get(productId);
        if (product != null) {
            product.setQuantity(newQty);
            product.setPrice(newPrice);
        } else {
            System.out.println("Product not found.");
        }
    }

    // Delete product
    public void deleteProduct(int productId) {
        inventory.remove(productId);
    }

    // Display all products
    public void displayInventory() {
        for (Product p : inventory.values()) {
            System.out.println(p);
        }
    }

    public static void main(String[] args) {
        Inventory manager = new Inventory();

        // Sample products
        manager.addProduct(new Product(101, "Keyboard", 50, 999.99));
        manager.addProduct(new Product(102, "Mouse", 100, 499.49));

        System.out.println("Initial Inventory:");
        manager.displayInventory();

        manager.updateProduct(101, 45, 949.99);
        manager.deleteProduct(102);

        System.out.println("\nUpdated Inventory:");
        manager.displayInventory();
    }
}
