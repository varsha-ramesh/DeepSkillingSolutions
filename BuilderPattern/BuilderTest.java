public class BuilderTest {
    public static void main(String[] args) {
        // Create computer with all required fields
        Computer officePC = new Computer.Builder("Intel i5", "8GB", "512GB SSD", "Intel UHD Graphics").build();

        Computer gamingPC = new Computer.Builder("Intel i9", "32GB", "1TB SSD", "NVIDIA RTX 4080").build();

        System.out.println("💼 Office Computer:");
        System.out.println(officePC);

        System.out.println("\n🎮 Gaming Computer:");
        System.out.println(gamingPC);
    }
}
