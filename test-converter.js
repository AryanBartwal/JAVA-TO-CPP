const Converter = require('./js-converter.js');
const c = new Converter();

const javaCode = `public class Hello {
    public static void main(String[] args) {
        System.out.println("Hello World");
    }
}`;

try {
    const result = c.convert(javaCode);
    console.log("Conversion successful:");
    console.log(result);
} catch (error) {
    console.log("Conversion failed:", error.message);
}
