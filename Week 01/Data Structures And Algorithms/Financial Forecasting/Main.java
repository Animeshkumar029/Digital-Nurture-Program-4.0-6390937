import java.util.*;

public class Main{

    private static Map<Integer, Double> memo = new HashMap<>();
    public static double calculateFutureValueMemoized(double principal, double rate, int years) {
        if (memo.containsKey(years)) {
            return memo.get(years);
        }
        if (years == 0) {
            return principal;
        }
        double result = calculateFutureValueMemoized(principal * (1 + rate), rate, years - 1);
        memo.put(years, result);
        return result;
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.println();
        System.out.print("Enter the initial amount: ");
        double principal = scanner.nextDouble();

        System.out.print("Enter the annual growth rate (as a decimal): ");
        double rate = scanner.nextDouble();

        System.out.print("Enter the number of years: ");
        int years = scanner.nextInt();

        double futureValue = calculateFutureValueMemoized(principal, rate, years);
        System.out.printf("Future Value : %.2f%n", futureValue);

        scanner.close();
    }
}
