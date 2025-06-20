public class Computer {
    private String cpu;
    private String ram;
    private String storage;
    private String graphicsCard;

    private Computer(Builder builder) {
        this.cpu = builder.cpu;
        this.ram = builder.ram;
        this.storage = builder.storage;
        this.graphicsCard = builder.graphicsCard;
    }

    public static class Builder {
        private String cpu;
        private String ram;
        private String storage;
        private String graphicsCard;

        public Builder(String cpu, String ram, String storage, String graphicsCard) {
            this.cpu = cpu;
            this.ram = ram;
            this.storage = storage;
            this.graphicsCard = graphicsCard;
        }

        public Computer build() {
            return new Computer(this);
        }
    }

    @Override
    public String toString() {
        return "Computer Configuration:\n" +
               "CPU: " + cpu + "\n" +
               "RAM: " + ram + "\n" +
               "Storage: " + storage + "\n" +
               "Graphics Card: " + graphicsCard;
    }
}
