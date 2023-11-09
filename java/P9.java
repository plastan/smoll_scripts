// import java.util.*;

abstract class shapes{
    double dim1,dim2;
    shapes(double a, double b){
        dim1 =a;
        dim2= b;

    }
    abstract double area();
    
}


class Rectangle extends shapes{
 Rectangle(double a, double b){
    super(a,b);
 }
 double area(){
    System.out.println("area of rectangle ");
    return dim1*dim2;
 }
}

class Triangle extends shapes{
    Triangle(double a, double b){
        super(a,b);
    }
    double area(){
        System.out.println("inside area of triangle");
        return dim1*dim2*.5;
    }
}





public class P9 {
public static void main(String[] args) {
    Rectangle r = new Rectangle(10, 5);
    Triangle t = new Triangle(12, 6);
    shapes tysh;
    tysh = t;
    System.out.println("area is :"+tysh.area());
    System.out.println("are of Rectangel is : "+r.area());
}

}
