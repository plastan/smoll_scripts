import java.util.Scanner;
import P.factorial;
public class P12 {
    public static  void main(String args[] ){
        factorial f = new factorial();
        int number;
        Scanner s = new Scanner(System.in);
        System.out.println("Enter the number : ");
        number = s.nextInt();
        long factorial = f.find_factorial(number);
        System.out.println("factorial of the "+"number "+" is "+ factorial);

    }
}
