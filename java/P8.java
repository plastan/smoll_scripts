import java.util.*;

abstract class shapes{
    int x,y;
    abstract void area();
}

class Twodim extends shapes{
    void area(){};
}
class Threedim extends shapes{
    void area(){};
}



class square extends Twodim{
    
    square(int a){
        x = a;
    }
    void area(){
        System.out.println("area of square is :" + x* x);
    }
}


class triangle extends Twodim{
    
    triangle(int b,int h){
        x = b;
        y = h;
    }
    void area(){
        System.out.println("area of triangle "+.5*x*y);
    }
}


class cube extends Threedim{
    cube(int a){
        x = a;
    }
    void area(){
        System.out.println("Area of shpere is "+3.14 *x * x* 4);
    }
}
public class P8 {
    public static void main(String[] args) {
        // shapes S;
        Scanner sc = new Scanner(System.in);
        int k;
        System.out.println("enter sides of square : ");
        k = sc.nextInt();
        square sq  = new square(k);
        System.out.println("Enter the base and height of a triangle : ");
        k = sc.nextInt();
        int ht = sc.nextInt();
        triangle tr = new triangle(k, ht);
        System.out.println("enter the side of cube");
        k= sc.nextInt();
        sc.close();
        cube cb = new cube(k);
        sq.area();
        tr.area();
        cb.area();

        

    }
}
