public class EProduct {
    private int id;
    private String name;
    private double price;

    public EProduct(int id, String name, double price) {
        this.id = id;
        this.name = name.toLowerCase();  // for case-insensitive search
        this.price = price;
    }

    public String getName() {
        return name;
    }

    public String toString() {
        return id + ": " + name + " - ₹" + price;
    }
}
