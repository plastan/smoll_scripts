import java.util.*;

public class P11 {
    public static void main(String args[])    {
        int a, b, res;
        Scanner sc = new Scanner(System.in);
        System.out.println(("enter two whole numbers to divide : "));
        a = sc.nextInt();
        b = sc.nextInt();
        try{
            res = a / b;
            System.out.println("result is "+ res);
        }
        catch(ArithmeticException e){
            System.out.println("Divided by zero !");
            System.out.println(e);
        }
    }

}
