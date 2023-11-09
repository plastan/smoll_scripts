import java.util.Scanner;
class P13 {
        public static void main(String [] args){
            int minBalance = 500;

            Scanner sum = new Scanner(System.in);
            System.out.println("enter account balance : ");
            int balance = Integer.parseInt(sum.nextLine());
            sum.close();
            try{
                if (balance < minBalance){
                    throw new MinBalExp("A tleast balance of "+minBalance+" required");
                }
            }
            catch(MinBalExp cx){
                System.out.println(cx.getMessage());
                
            }
            
        }
        
}


class MinBalExp extends Exception{
    public MinBalExp(String message){
        super(message);
    }
}