import java.util.*;


public class odd_thread implements Runnable{

    Thread t;
    int n;
    odd_thread(int i){
        t = new Thread(this,"odd thead");
        n = 1;
        t.start();
        }
    
        public void run(){
            try{
                for(int i = 1; i < n; i++){
                    if(i%2 != 0)System.out.println("odd thread"+i);
                    Thread.sleep(100);
                }
            }
            catch(InterruptedException e){
                System.out.println("odd Thread interrupted");
            }
            System.err.println("odd thread existing");
        }
    

}


public class P10{
    public static void main(String[] args) {
        
        Scanner s  = new Scanner(System.in);
        int lim;
        System.err.println("enter limit");
        lim = s.nextInt();
        new odd_thread(lim);
        new even_thread(lim);
    }
}




