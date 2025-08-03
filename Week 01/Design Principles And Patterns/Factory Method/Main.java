public class Main {
    public static void main(String[] args) {
        ShapeFactory factory;

        factory = new CircleFactory();
        Shape circle = factory.createShape();
        circle.draw();  // Output: Drawing a Circle

        factory = new RectangleFactory();
        Shape rectangle = factory.createShape();
        rectangle.draw();  // Output: Drawing a Rectangle
    }
}
