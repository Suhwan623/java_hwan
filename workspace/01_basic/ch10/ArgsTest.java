package workspace.ch10;

public class ArgsTest {
    public static void main(String[] args) {
        if(args.length < 2) {
            System.out.println("사용: [이름] [나이]");
            return;
        }
        String name = args[0];
        int age = Integer.parseInt(args[1]);
        System.out.println("이름: " + name + ", 나이: " + age + ", 내년에는" + (age+1) + "살이 됩니다.");
    }
}
