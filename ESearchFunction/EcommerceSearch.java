import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class EcommerceSearch {
    private List<EProduct> products;

    public EcommerceSearch() {
        products = new ArrayList<>();
    }

    // Add a product to the list
    public void addProduct(EProduct product) {
        products.add(product);
    }

    // Search products by keyword
    public List<EProduct> search(String keyword) {
        List<EProduct> results = new ArrayList<>();
        keyword = keyword.toLowerCase();
        for (EProduct product : products) {
            if (product.getName().contains(keyword)) {
                results.add(product);
            }
        }
        return results;
    }

    public static void main(String[] args) {
        EcommerceSearch store = new EcommerceSearch();

        // Adding sample products
        store.addProduct(new EProduct(1, "Wireless Mouse", 499));
        store.addProduct(new EProduct(2, "Gaming Keyboard", 1299));
        store.addProduct(new EProduct(3, "Bluetooth Speaker", 999));
        store.addProduct(new EProduct(4, "USB-C Cable", 199));

        Scanner sc = new Scanner(System.in);
        System.out.print("Enter a search keyword: ");
        String keyword = sc.nextLine();

        List<EProduct> results = store.search(keyword);

        System.out.println("\nSearch Results:");
        if (results.isEmpty()) {
            System.out.println("No products found.");
        } else {
            for (EProduct p : results) {
                System.out.println(p);
            }
        }
    }
}
