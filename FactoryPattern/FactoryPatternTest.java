public class FactoryPatternTest {
    public static void main(String[] args) {
        ShapeFactory factory = new ShapeFactory();

        Shape shape1 = factory.getShape("circle");
        Shape shape2 = factory.getShape("rectangle");

        if (shape1 != null) shape1.draw();
        if (shape2 != null) shape2.draw();
    }
}
