// Test Java class with fields, inheritance, and object instantiation
class Animal {
    int age;
    String name;
    public void speak() {
        System.out.println("Animal speaks");
    }
}

class Dog extends Animal {
    String breed;
    public void speak() {
        System.out.println("Woof! My name is " + name);
    }
}

public class test_complex {
    public static void main(String[] args) {
        Dog d = new Dog();
        d.name = "Buddy";
        d.age = 5;
        d.breed = "Labrador";
        d.speak();
    }
}