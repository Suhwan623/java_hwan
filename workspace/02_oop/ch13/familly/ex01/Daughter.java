package workspace.ch13.familly.ex01;

public class Daughter extends Parent {

    Daughter(String name) {
        super(name);
    }

    void play() {
        System.out.println(name + ": 화장을 한다");
        doFaceMask();
    }

    private void doFaceMask() {
        System.out.println(name + ": 마스크 팩을 한다");
    }
}
