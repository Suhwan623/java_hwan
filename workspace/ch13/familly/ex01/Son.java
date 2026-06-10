package workspace.ch13.familly.ex01;

public class Son extends Parent{
    Son(String name){
        super(name); //부모의 생성자 호출
    }

    //오버라이딩
    void play() {
        work();
        System.out.println(name + ": 게임을 한다");
    }

    private void work() {
        System.out.println(name + ": 일한다");
    }
}