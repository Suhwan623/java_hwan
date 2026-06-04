package ch11.capsule.ex03;

public class Account {
    private int balance;

    //입금
    public void deposit(int amount) {

        if (amount > 0) {
            this.balance += amount;
            System.out.println(amount + " 원이 입금 되었습니다. 잔고는 " + this.balance + "입니다");
        }
        else  {
            System.out.println("입금액이 잘못되었습니다.");
        }
    }

    //출금
    public void withdraw(int amount) {
        amount -= balance;
    }
}
