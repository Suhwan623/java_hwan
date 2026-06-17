package workspace.ch05.ex01;

public class PrimitiveType {

    public static void main(String[] args) {

        int age;
        age = 25;
        System.out.println(age);

        age = 30;
        System.out.println(age);

        int score = 100;
        System.out.println(score);

        byte b = 127;
        System.out.println(b);

        short s = 10000;
        System.out.println(s);

        int num = 1000000000;
        System.out.println(num);

        long bigNum = 10000000000L;
        System.out.println(bigNum);

        double pi = 3.1415926535;
        System.out.println(pi);

        System.out.println(pi * 5 * 5);
        System.out.println(pi * 4 * 4);

        float shortPi = 3.14F;
        System.out.println(shortPi);

        boolean isGood = true;
        System.out.println(isGood);

        boolean isMan = false;
        System.out.println(isMan);

        char grade = 'A';
        System.out.println(grade);

        grade = 'B';
        System.out.println(grade);

        String firstName = "멋쟁이";
        String lastName = "사자처럼";

        System.out.println(firstName);
        System.out.println(lastName);

        final double PI = 3.14;

        System.out.println(PI * 5 * 5);
        System.out.println(PI * 4 * 4);
    }
}