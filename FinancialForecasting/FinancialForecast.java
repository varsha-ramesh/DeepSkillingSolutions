import java.util.Scanner;

public class FinancialForecast {

    // Recursive method to calculate future value
    public static double forecast(double presentValue, double rate, int years) {
        if (years == 0) {
            return presentValue;  // base case
        }
        return forecast(presentValue, rate, years - 1) * (1 + rate);  // recursive call
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("Enter Present Value (₹): ");
        double pv = sc.nextDouble();

        System.out.print("Enter Annual Growth Rate (%): ");
        double rate = sc.nextDouble() / 100;

        System.out.print("Enter Number of Years: ");
        int years = sc.nextInt();

        double futureValue = forecast(pv, rate, years);

        System.out.printf("Predicted Future Value after %d years: ₹%.2f\n", years, futureValue);
    }
}
