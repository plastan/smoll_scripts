package P;
public class factorial {

    public long find_factorial(int number) {
        long result = 1;
        if (number == 0){
            return 1;
        }
        for (int i  = 1; i <= number ; i++){
            result = result*i;
        }
        return result;
    }
}


