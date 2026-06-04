package ch11.capsule.ex03;

public class AccountTest {
    public static void main(String[] args) {
        Account myAccount = new Account();

        myAccount.deposit(-10000);
        myAccount.withdraw(5000);
        // myAccount.balance  = -10000;
        myAccount.withdraw(10000);
    }
}
